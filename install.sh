#!/usr/bin/env bash
# ==============================================================================
# ⚡ Jarvis-UI — Universal One-Command Installer
# Installs Jarvis-UI across Codex, Claude, OpenCode, Antigravity, and Cursor.
# Supports both direct local execution and one-liner curl execution:
# curl -fsSL https://raw.githubusercontent.com/thedileepkumar-dk/Jarvis-UI/main/install.sh | bash
# ==============================================================================

set -e

REPO_URL="https://github.com/thedileepkumar-dk/Jarvis-UI.git"
DEFAULT_INSTALL_DIR="${HOME}/Documents/Jarvis-UI"
SKILL_NAME="Jarvis-UI"

# Terminal Colors
C_RESET="\033[0m"
C_BOLD="\033[1m"
C_CYAN="\033[36m"
C_GREEN="\033[32m"
C_YELLOW="\033[33m"
C_PURPLE="\033[35m"

# Determine Source Directory (handle both curl | bash and local execution)
if [ -n "${BASH_SOURCE[0]}" ] && [ -f "${BASH_SOURCE[0]}" ]; then
  SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  SOURCE_DIR="${DEFAULT_INSTALL_DIR}"
  if [ ! -d "${SOURCE_DIR}/.git" ] && [ ! -f "${SOURCE_DIR}/SKILL.md" ]; then
    echo -e "${C_CYAN}Cloning Jarvis-UI to ${SOURCE_DIR}...${C_RESET}"
    mkdir -p "$(dirname "${SOURCE_DIR}")"
    git clone "${REPO_URL}" "${SOURCE_DIR}"
  else
    echo -e "${C_CYAN}Updating existing Jarvis-UI in ${SOURCE_DIR}...${C_RESET}"
    git -C "${SOURCE_DIR}" pull --quiet || true
  fi
fi

print_banner() {
  echo -e "${C_PURPLE}${C_BOLD}"
  echo "   ██╗ █████╗ ██████╗ ██╗   ██╗██╗███████╗      ██╗   ██╗██╗"
  echo "   ██║██╔══██╗██╔══██╗██║   ██║██║██╔════╝      ██║   ██║██║"
  echo "   ██║███████║██████╔╝██║   ██║██║███████╗█████╗██║   ██║██║"
  echo "██   ██║██╔══██║██╔══██╗╚██╗ ██╔╝██║╚════██║╚════╝██║   ██║██║"
  echo "╚█████╔╝██║  ██║██║  ██║ ╚████╔╝ ██║███████║     ╚██████╔╝██║"
  echo " ╚════╝ ╚═╝  ╚═╝╚═╝  ╚═╝  ╚═══╝  ╚═╝╚══════╝      ╚═════╝ ╚═╝"
  echo -e "${C_RESET}"
  echo -e "${C_CYAN}Universal Kinetic Frontend & Animated UI Engineering Framework${C_RESET}"
  echo -e "${C_BOLD}Repo:${C_RESET} ${REPO_URL}"
  echo -e "${C_BOLD}Source:${C_RESET} ${SOURCE_DIR}\n"
}

install_target() {
  local target_name="$1"
  local target_dir="$2"
  local dest_path="${target_dir}/${SKILL_NAME}"

  echo -e "${C_CYAN}● Installing for ${C_BOLD}${target_name}${C_RESET}..."
  mkdir -p "${target_dir}"

  rm -rf "${dest_path}"
  ln -s "${SOURCE_DIR}" "${dest_path}"
  echo -e "  ${C_GREEN}✔ Linked:${C_RESET} ${dest_path} -> ${SOURCE_DIR}"
}

install_cursor_rule() {
  local target_dir="$1"
  local rule_file="${target_dir}/Jarvis-UI.mdc"

  echo -e "${C_CYAN}● Installing Cursor Rule...${C_RESET}"
  mkdir -p "${target_dir}"

  cat << 'RULE' > "${rule_file}"
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

  echo -e "  ${C_GREEN}✔ Created Cursor Rule:${C_RESET} ${rule_file}"
}

install_cli_shortcut() {
  local bin_dir="${HOME}/.local/bin"
  mkdir -p "${bin_dir}"
  local shortcut_path="${bin_dir}/jarvis-ui-install"

  cat << SCRIPT > "${shortcut_path}"
#!/usr/bin/env bash
bash "${SOURCE_DIR}/install.sh" "\$@"
SCRIPT

  chmod +x "${shortcut_path}"
  echo -e "\n${C_GREEN}✔ Global CLI command installed:${C_RESET} ${shortcut_path}"
  echo -e "  You can run ${C_BOLD}jarvis-ui-install${C_RESET} from any terminal."
}

TARGET_ENV="${1:-all}"
print_banner

case "${TARGET_ENV}" in
  --codex|codex)
    install_target "Codex" "${HOME}/.codex/skills"
    ;;
  --claude|claude)
    install_target "Claude" "${HOME}/.claude/skills"
    ;;
  --opencode|opencode)
    install_target "OpenCode" "${HOME}/.config/opencode/skills"
    ;;
  --gemini|gemini|antigravity)
    install_target "Antigravity / Gemini" "${HOME}/.gemini/config/skills"
    ;;
  --cursor|cursor)
    install_cursor_rule "${HOME}/.cursor/rules"
    ;;
  --project|project)
    PROJECT_DIR="${2:-.}"
    echo -e "${C_CYAN}● Installing to Project at:${C_RESET} ${PROJECT_DIR}"
    install_target "Project Workspace" "${PROJECT_DIR}/.agents/skills"
    install_cursor_rule "${PROJECT_DIR}/.cursor/rules"
    ;;
  --all|all)
    echo -e "${C_YELLOW}Detected AI environments. Installing Jarvis-UI globally...${C_RESET}\n"
    install_target "Codex" "${HOME}/.codex/skills"
    install_target "Claude" "${HOME}/.claude/skills"
    install_target "OpenCode" "${HOME}/.config/opencode/skills"
    install_target "Antigravity / Gemini" "${HOME}/.gemini/config/skills"
    install_cursor_rule "${HOME}/.cursor/rules"
    install_cli_shortcut
    ;;
  *)
    echo -e "${C_YELLOW}Usage:${C_RESET}"
    echo "  curl -fsSL https://raw.githubusercontent.com/thedileepkumar-dk/Jarvis-UI/main/install.sh | bash"
    echo "  bash install.sh               # Install to all detected AI tools"
    echo "  bash install.sh --codex       # Install only for Codex"
    echo "  bash install.sh --claude      # Install only for Claude"
    echo "  bash install.sh --opencode    # Install only for OpenCode"
    echo "  bash install.sh --gemini      # Install only for Antigravity / Gemini"
    echo "  bash install.sh --project .   # Install directly into current project"
    exit 0
    ;;
esac

echo -e "\n${C_GREEN}${C_BOLD}★ Installation Complete!${C_RESET}"
echo -e "Jarvis-UI is now ready in ${C_BOLD}Codex, Claude, OpenCode, Antigravity, and Cursor${C_RESET}."
echo -e "Any updates in ${C_CYAN}${SOURCE_DIR}${C_RESET} will instantly sync across all tools.\n"
