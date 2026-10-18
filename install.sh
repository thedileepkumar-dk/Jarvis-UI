#!/usr/bin/env bash
# ==============================================================================
# ⚡ JARVIS-UI — Universal Animated Installer
# Default destination for all platforms (macOS, Linux, WSL): ~/.jarvis-ui
# ==============================================================================

set -e

REPO_URL="https://github.com/thedileepkumar-dk/Jarvis-UI.git"
DEFAULT_INSTALL_DIR="${HOME}/.jarvis-ui"
SKILL_NAME="Jarvis-UI"

# Terminal Formatting
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

# TTY detection
IS_TTY=false
if [ -t 1 ]; then
  IS_TTY=true
fi

hide_cursor() { if $IS_TTY; then printf "${ESC}[?25l"; fi; }
show_cursor() { if $IS_TTY; then printf "${ESC}[?25h"; fi; }
trap show_cursor EXIT

# Universal Source Directory Resolver (defaults to ~/.jarvis-ui across all OS)
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  if [ "${SOURCE_DIR}" != "${DEFAULT_INSTALL_DIR}" ] && [ ! -e "${DEFAULT_INSTALL_DIR}" ]; then
    ln -sfn "${SOURCE_DIR}" "${DEFAULT_INSTALL_DIR}"
  fi
else
  # Piped from curl: install into ~/.jarvis-ui across all platforms (macOS, Linux, WSL)
  SOURCE_DIR="${DEFAULT_INSTALL_DIR}"

  if [ ! -d "${SOURCE_DIR}/.git" ]; then
    mkdir -p "$(dirname "${SOURCE_DIR}")"
    git clone --quiet "${REPO_URL}" "${SOURCE_DIR}"
  else
    git -C "${SOURCE_DIR}" pull --quiet 2>/dev/null || true
  fi
fi

# Always link agents through the universal ~/.jarvis-ui root
LINK_TARGET="${DEFAULT_INSTALL_DIR}"
if [ ! -e "${LINK_TARGET}" ]; then
  LINK_TARGET="${SOURCE_DIR}"
fi

# Tilde-abbreviated path for universal display across all OS environments
DISPLAY_SOURCE="~${LINK_TARGET#$HOME}"

# Animated Spinner Helper
spin_task() {
  local label="$1"
  local action_fn="$2"
  local frames=('⠋' '⠙' '⠹' '⠸' '⠼' '⠴' '⠦' '⠧' '⠇' '⠏')
  
  if ! $IS_TTY; then
    printf "  ${C_PURPLE}●${C_RESET} %-36s " "${label}"
    $action_fn >/dev/null 2>&1
    printf "${C_GREEN}✔ Done${C_RESET}\n"
    return 0
  fi

  hide_cursor
  $action_fn >/dev/null 2>&1 &
  local pid=$!

  local i=0
  while kill -0 $pid 2>/dev/null; do
    local frame="${frames[$((i % 10))]}"
    printf "\r  ${C_PURPLE}${frame}${C_RESET} ${C_WHITE}%-36s${C_RESET}" "${label}"
    i=$((i + 1))
    sleep 0.06
  done

  wait $pid
  printf "\r  ${C_GREEN}✔${C_RESET} ${C_WHITE}%-36s${C_RESET} ${C_GREEN}configured${C_RESET}\n" "${label}"
  show_cursor
}

draw_progress() {
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

print_header() {
  echo ""
  echo -e "  ${C_PURPLE}╭─────────────────────────────────────────────────────────────────╮${C_RESET}"
  echo -e "  ${C_PURPLE}│${C_RESET}  ${C_BOLD}${C_WHITE}⚡ JARVIS-UI${C_RESET}  ${C_MUTED}•${C_RESET}  ${C_CYAN}Universal Kinetic Frontend Framework${C_RESET}          ${C_PURPLE}│${C_RESET}"
  echo -e "  ${C_PURPLE}│${C_RESET}  ${C_DIM}Autonomous UI Design & Animation Systems for AI Coding Agents${C_RESET}  ${C_PURPLE}│${C_RESET}"
  echo -e "  ${C_PURPLE}╰─────────────────────────────────────────────────────────────────╯${C_RESET}"
  echo -e "  ${C_MUTED}Location:${C_RESET} ${C_CYAN}${DISPLAY_SOURCE}${C_RESET}\n"
}

# Target Installers
do_codex() {
  mkdir -p "${HOME}/.codex/skills"
  rm -rf "${HOME}/.codex/skills/${SKILL_NAME}"
  ln -sfn "${LINK_TARGET}" "${HOME}/.codex/skills/${SKILL_NAME}"
}

do_claude() {
  mkdir -p "${HOME}/.claude/skills"
  rm -rf "${HOME}/.claude/skills/${SKILL_NAME}"
  ln -sfn "${LINK_TARGET}" "${HOME}/.claude/skills/${SKILL_NAME}"
}

do_opencode() {
  mkdir -p "${HOME}/.config/opencode/skills"
  rm -rf "${HOME}/.config/opencode/skills/${SKILL_NAME}"
  ln -sfn "${LINK_TARGET}" "${HOME}/.config/opencode/skills/${SKILL_NAME}"
}

do_gemini() {
  mkdir -p "${HOME}/.gemini/config/skills"
  rm -rf "${HOME}/.gemini/config/skills/${SKILL_NAME}"
  ln -sfn "${LINK_TARGET}" "${HOME}/.gemini/config/skills/${SKILL_NAME}"
}

do_cursor() {
  mkdir -p "${HOME}/.cursor/rules"
  cat << RULE > "${HOME}/.cursor/rules/Jarvis-UI.mdc"
---
description: Jarvis-UI Kinetic Frontend Framework. Apply when building animated, modern web frontends, SaaS landing pages, interactive cockpits, and micro-animations.
globs: **/*.{html,css,js,jsx,ts,tsx,vue,svelte}
---
Always follow the Jarvis-UI skill guidelines located at:
~/.jarvis-ui/SKILL.md

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
bash "${LINK_TARGET}/install.sh" "\$@"
SCRIPT
  chmod +x "${HOME}/.local/bin/jarvis-ui-install"
}

print_header

TARGET="${1:-all}"

case "${TARGET}" in
  --codex|codex)
    spin_task "Codex (~/.codex/skills)" do_codex
    ;;
  --claude|claude)
    spin_task "Claude (~/.claude/skills)" do_claude
    ;;
  --opencode|opencode)
    spin_task "OpenCode (~/.config/opencode)" do_opencode
    ;;
  --gemini|gemini|antigravity)
    spin_task "Antigravity (~/.gemini/config)" do_gemini
    ;;
  --cursor|cursor)
    spin_task "Cursor Rule (~/.cursor/rules)" do_cursor
    ;;
  --all|all)
    spin_task "Codex (~/.codex/skills)" do_codex
    spin_task "Claude (~/.claude/skills)" do_claude
    spin_task "OpenCode (~/.config/opencode)" do_opencode
    spin_task "Antigravity (~/.gemini/config)" do_gemini
    spin_task "Cursor Rule (~/.cursor/rules)" do_cursor
    spin_task "Global CLI Command (jarvis-ui-install)" do_cli
    draw_progress
    ;;
esac

echo -e "  ${C_GREEN}╭─────────────────────────────────────────────────────────────────╮${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_BOLD}${C_GREEN}✔ Installation Active & Synchronized${C_RESET}                           ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_WHITE}Jarvis-UI is now live across all your AI environments.${C_RESET}         ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}│${C_RESET}  ${C_MUTED}Prompt any agent:${C_RESET} ${C_CYAN}\"Using Jarvis-UI, build [your project]\"${C_RESET}  ${C_GREEN}│${C_RESET}"
echo -e "  ${C_GREEN}╰─────────────────────────────────────────────────────────────────╯${C_RESET}\n"
