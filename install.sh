#!/usr/bin/env bash
# ==============================================================================
# ⚡ JARVIS-UI — Animated Universal Installer
# ==============================================================================

set -e

REPO_URL="https://github.com/thedileepkumar-dk/Jarvis-UI.git"
DEFAULT_INSTALL_DIR="${HOME}/Documents/Jarvis-UI"
SKILL_NAME="Jarvis-UI"

# Colors & Formatting
ESC="\033"
C_RESET="${ESC}[0m"
C_BOLD="${ESC}[1m"
C_DIM="${ESC}[2m"
C_PURPLE="${ESC}[38;2;155;99;211m"
C_CYAN="${ESC}[38;2;6;182;212m"
C_GREEN="${ESC}[38;2;34;197;94m"
C_YELLOW="${ESC}[38;2;245;158;11m"
C_WHITE="${ESC}[38;2;255;255;255m"
C_MUTED="${ESC}[38;2;148;163;184m"

# TTY detection for animated spinners
IS_TTY=false
if [ -t 1 ]; then
  IS_TTY=true
fi

# Cursor controls
hide_cursor() { if $IS_TTY; then printf "${ESC}[?25l"; fi; }
show_cursor() { if $IS_TTY; then printf "${ESC}[?25h"; fi; }
trap show_cursor EXIT

# Animated Spinner Helper
spin_task() {
  local label="$1"
  local action_fn="$2"
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  
  if ! $IS_TTY; then
    printf "  ${C_PURPLE}●${C_RESET} %-40s " "${label}"
    $action_fn >/dev/null 2>&1
    printf "${C_GREEN}✔ Done${C_RESET}\n"
    return 0
  fi

  hide_cursor
  # Run action in background
  $action_fn >/dev/null 2>&1 &
  local pid=$!

  local i=0
  while kill -0 $pid 2>/dev/null; do
    local frame="${frames[$((i % 10))]}"
    printf "\r  ${C_PURPLE}${frame}${C_RESET} ${C_WHITE}%-40s${C_RESET}" "${label}"
    i=$((i + 1))
    sleep 0.06
  done

  wait $pid
  printf "\r  ${C_GREEN}✔${C_RESET} ${C_WHITE}%-40s${C_RESET} ${C_GREEN}configured${C_RESET}\n" "${label}"
  show_cursor
}

# Animated Progress Bar
draw_progress() {
  local duration=0.4
  local steps=24
  local delay=0.015

  if ! $IS_TTY; then return 0; fi

  hide_cursor
  printf "\n  ${C_MUTED}Syncing components:${C_RESET} ["
  for ((i=1; i<=steps; i++)); do
    printf "${C_CYAN}█${C_RESET}"
    sleep $delay
  done
  printf "] ${C_GREEN}100%%${C_RESET}\n\n"
  show_cursor
}

# Resolve source directory
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  SOURCE_DIR="${DEFAULT_INSTALL_DIR}"
  if [ ! -d "${SOURCE_DIR}/.git" ] && [ ! -f "${SOURCE_DIR}/SKILL.md" ]; then
    mkdir -p "$(dirname "${SOURCE_DIR}")"
    git clone --quiet "${REPO_URL}" "${SOURCE_DIR}"
  else
    git -C "${SOURCE_DIR}" pull --quiet 2>/dev/null || true
  fi
fi

# Print Sleek High-Tech Header
print_header() {
  echo ""
  echo -e "  ${C_PURPLE}╭─────────────────────────────────────────────────────────────────╮${C_RESET}"
  echo -e "  ${C_PURPLE}│${C_RESET}  ${C_BOLD}${C_WHITE}⚡ JARVIS-UI${C_RESET}  ${C_MUTED}•${C_RESET}  ${C_CYAN}Universal Kinetic Frontend Framework${C_RESET}          ${C_PURPLE}│${C_RESET}"
  echo -e "  ${C_PURPLE}│${C_RESET}  ${C_DIM}Autonomous UI Design & Animation Systems for AI Coding Agents${C_RESET}  ${C_PURPLE}│${C_RESET}"
  echo -e "  ${C_PURPLE}╰─────────────────────────────────────────────────────────────────╯${C_RESET}"
  echo -e "  ${C_MUTED}Source:${C_RESET} ${C_DIM}${SOURCE_DIR}${C_RESET}\n"
}

# Installation functions for each environment
do_codex() {
  mkdir -p "${HOME}/.codex/skills"
  rm -rf "${HOME}/.codex/skills/${SKILL_NAME}"
  ln -s "${SOURCE_DIR}" "${HOME}/.codex/skills/${SKILL_NAME}"
}

do_claude() {
  mkdir -p "${HOME}/.claude/skills"
  rm -rf "${HOME}/.claude/skills/${SKILL_NAME}"
  ln -s "${SOURCE_DIR}" "${HOME}/.claude/skills/${SKILL_NAME}"
}

do_opencode() {
  mkdir -p "${HOME}/.config/opencode/skills"
  rm -rf "${HOME}/.config/opencode/skills/${SKILL_NAME}"
  ln -s "${SOURCE_DIR}" "${HOME}/.config/opencode/skills/${SKILL_NAME}"
}

do_gemini() {
  mkdir -p "${HOME}/.gemini/config/skills"
  rm -rf "${HOME}/.gemini/config/skills/${SKILL_NAME}"
  ln -s "${SOURCE_DIR}" "${HOME}/.gemini/config/skills/${SKILL_NAME}"
}

do_cursor() {
  mkdir -p "${HOME}/.cursor/rules"
  cat << 'RULE' > "${HOME}/.cursor/rules/Jarvis-UI.mdc"
---
description: Jarvis-UI Kinetic Frontend Framework. Apply when building animated, modern web frontends, SaaS landing pages, interactive cockpits, and micro-animations.
globs: **/*.{html,css,js,jsx,ts,tsx,vue,svelte}
---
Always follow the Jarvis-UI skill guidelines located at:
~/Documents/Jarvis-UI/SKILL.md

Key Architecture Rules:
1. Volumetric lighting and atmospheric glow plumes (no plain flat backgrounds).
2. Domain-tailored interactive showcases (dense 3-column cockpits, hardware bezels).
3. Kinetic vector animations (traveling SVG path pulses, rotating dials/gauges).
4. Interactive 3D card tilt and mouse sheen physics.
5. Tabular numerals (tabular-nums) for dynamic metrics, stats, and prices.
6. Snappy spring deceleration timing: cubic-bezier(0.16, 1, 0.3, 1).
RULE
}

do_cli() {
  mkdir -p "${HOME}/.local/bin"
  cat << SCRIPT > "${HOME}/.local/bin/jarvis-ui-install"
#!/usr/bin/env bash
bash "${SOURCE_DIR}/install.sh" "\$@"
SCRIPT
  chmod +x "${HOME}/.local/bin/jarvis-ui-install"
}

# Main Execution Flow
print_header

TARGET="${1:-all}"

case "${TARGET}" in
  --codex|codex)
    spin_task "Codex Skill Integration" do_codex
    ;;
  --claude|claude)
    spin_task "Claude Skill Integration" do_claude
    ;;
  --opencode|opencode)
    spin_task "OpenCode Skill Integration" do_opencode
    ;;
  --gemini|gemini|antigravity)
    spin_task "Antigravity / Gemini Integration" do_gemini
    ;;
  --cursor|cursor)
    spin_task "Cursor Rule Configuration" do_cursor
    ;;
  --all|all)
    spin_task "Codex (${HOME}/.codex/skills)" do_codex
    spin_task "Claude (${HOME}/.claude/skills)" do_claude
    spin_task "OpenCode (~/.config/opencode/skills)" do_opencode
    spin_task "Antigravity (~/.gemini/config/skills)" do_gemini
    spin_task "Cursor Rule (~/.cursor/rules)" do_cursor
    spin_task "Global CLI Command (jarvis-ui-install)" do_cli
    draw_progress
    ;;
esac

# Summary Box
echo -e "  ${C_GREEN}╭─────────────────────────────────────────────────────────────────╮${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_BOLD}${C_GREEN}✔ Installation Active & Synchronized${C_RESET}                           ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_WHITE}Jarvis-UI is now live across all your AI environments.${C_RESET}         ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_MUTED}Prompt any agent:${C_RESET} ${C_CYAN}\"Using Jarvis-UI, build [your project]\"${C_RESET}  ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}╰─────────────────────────────────────────────────────────────────╯${C_RESET}\n"
