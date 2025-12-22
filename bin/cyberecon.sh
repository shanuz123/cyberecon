#!/bin/bash

# ==========================================
# CYBERECON – Web Reconnaissance Framework
# Interactive TUI powered by Charm Gum
# ==========================================

# ---------- CONFIG ----------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE="$SCRIPT_DIR/../data/web-tools"
DESC_DIR="$BASE/descriptions"
BROWSER="firefox"

# ---------- DEP CHECK ----------
if ! command -v gum >/dev/null 2>&1; then
    echo "[!] gum is not installed."
    echo "    Install it using: sudo apt install gum"
    exit 1
fi

# ---------- BANNER ----------
banner() {
clear
# Use Gum to join graphics if you want, or stick to printf for speed
printf "${CYAN}
  ██████╗██╗   ██╗██████╗ ███████╗██████╗ ███████╗ ██████╗  ██████╗ ███╗   ██╗
 ██╔════╝╚██╗ ██╔╝██╔══██╗██╔════╝██╔══██╗██╔════╝██╔════╝ ██╔═══██╗████╗  ██║
 ██║      ╚████╔╝ ██████╔╝█████╗  ██████╔╝█████╗  ██║      ██║   ██║██╔██╗ ██║
 ██║       ╚██╔╝  ██╔══██╗██╔══╝  ██╔══██╗██╔══╝  ██║      ██║   ██║██║╚██╗██║
 ╚██████╗   ██║   ██████╔╝███████╗██║  ██║███████╗╚██████╗ ╚██████╔╝██║ ╚████║
  ╚═════╝   ╚═╝   ╚═════╝ ╚══════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝
${NC}"
printf "${GRAY}      > Modern Web Reconnaissance & OSINT Framework <${NC}\n"
printf "${GRAY}      >      Recon smart. Install less. Think more.    <${NC}\n\n"
}

# ---------- CATEGORY SELECT ----------
select_category() {
    category=$(ls "$BASE"/*.txt 2>/dev/null \
        | xargs -n1 basename \
        | sed 's/\.txt$//' \
        | gum choose --header "Select Tool Category")

    [ -z "$category" ] && return
    select_tool "$category"
}

# ---------- TOOL SELECT ----------
select_tool() {
    local category="$1"
    local tools_file="$BASE/$category.txt"

    tool=$(cut -d'|' -f1 "$tools_file" | gum choose --header "Category: $category")
    [ -z "$tool" ] && return

    show_tool_info "$category" "$tool"
}

# ---------- TOOL INFO ----------
show_tool_info() {
    local category="$1"
    local tool="$2"

    local desc_file="$DESC_DIR/$category.desc"
    local url_file="$BASE/$category.txt"

    description=$(awk -F'|' -v t="$tool" 'tolower($1)==tolower(t){print $2; exit}' "$desc_file")
    url=$(awk -F'|' -v t="$tool" 'tolower($1)==tolower(t){print $2; exit}' "$url_file")

    [ -z "$description" ] && description="No description available."
    [ -z "$url" ] && url="URL not found."

    gum style \
      --border normal \
      --padding "1 2" \
      --margin "1" \
      --border-foreground 212 \
"Tool        : $tool

Description :
$description

URL         :
$url"

    action=$(gum choose \
        "Open in Browser" \
        "Back to Tools" \
        "Back to Categories" \
        "Exit")

    case "$action" in
        "Open in Browser")
            $BROWSER "$url" >/dev/null 2>&1 &
            ;;
        "Back to Tools")
            select_tool "$category"
            ;;
        "Back to Categories")
            select_category
            ;;
        "Exit")
            clear
            exit 0
            ;;
    esac
}

# ---------- MAIN ----------
main() {
    while true; do
        banner
        action=$(gum choose \
            "Browse Web Tools" \
            "Exit")

        case "$action" in
            "Browse Web Tools")
                select_category
                ;;
            "Exit")
                clear
                exit 0
                ;;
        esac
    done
}

main
