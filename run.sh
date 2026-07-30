#!/bin/bash

# Colors - White Theme
WHITE='\033[1;37m'
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
DIM='\033[2m'
NC='\033[0m'
BG_WHITE='\033[47m'
BG_BLACK='\033[40m'

# Global variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
API_KEY_FILE="$HOME/.fxtun_key"

# Function to check fxtun installation
check_fxtun() {
    if command -v fxtunnel &> /dev/null; then
        CMD="fxtunnel"
        return 0
    elif command -v fxtun &> /dev/null; then
        CMD="fxtun"
        return 0
    else
        CMD=""
        return 1
    fi
}

# Function to get API key
get_api_key() {
    if [ -f "$API_KEY_FILE" ]; then
        cat "$API_KEY_FILE"
    else
        echo ""
    fi
}

# Function to show header
show_header() {
    clear
    echo -e "\n${WHITE}╔════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║${NC}                                                                            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}           ${BOLD}${BLACK}🔥  CODINGBOYZ PRESENTS  ${WHITE}🔥${NC}                  ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}                                                                            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}           ${BOLD}${BLACK}⚡ PORT FORWARDING MASTER TOOL ⚡${NC}                 ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}                                                                            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}              ${BLACK}Power by FXTUN - Professional Tunneling${NC}            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC}                                                                            ${WHITE}║${NC}"
    echo -e "${WHITE}╚════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e "\n${BOLD}${BLACK}           📺  SUBSCRIBE TO CODINGBOYZ  📺${NC}"
    echo -e "        ${WHITE}► YouTube: CodingBoyz ◄${NC}\n"
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════${NC}\n"
}

# Function to show menu
show_menu() {
    echo -e "  ${WHITE}┌─────────────────────────────────────────────────┐${NC}"
    echo -e "  ${WHITE}│${NC}     ${BOLD}${BLACK}SELECT YOUR OPTION${NC}                   ${WHITE}│${NC}"
    echo -e "  ${WHITE}├─────────────────────────────────────────────────┤${NC}"
    echo -e "  ${WHITE}│${NC}                                                 ${WHITE}│${NC}"
    echo -e "  ${WHITE}│${NC}    ${WHITE}[${BLACK}1${WHITE}]${NC}  ${BLACK}Install FXTUN${NC}                      ${WHITE}│${NC}"
    echo -e "  ${WHITE}│${NC}    ${WHITE}[${BLACK}2${WHITE}]${NC}  ${BLACK}Authenticate (API Key)${NC}             ${WHITE}│${NC}"
    echo -e "  ${WHITE}│${NC}    ${WHITE}[${BLACK}3${WHITE}]${NC}  ${BLACK}Start Tunneling / Forwarding${NC}       ${WHITE}│${NC}"
    echo -e "  ${WHITE}│${NC}    ${WHITE}[${BLACK}4${WHITE}]${NC}  ${BLACK}Exit${NC}                             ${WHITE}│${NC}"
    echo -e "  ${WHITE}│${NC}                                                 ${WHITE}│${NC}"
    echo -e "  ${WHITE}└─────────────────────────────────────────────────┘${NC}\n"
    echo -e "${WHITE}════════════════════════════════════════════════════════════════════════${NC}\n"
    echo -e "${BOLD}${BLACK}┌─[ Enter Your Choice ]${NC}"
    echo -e "${BOLD}${BLACK}└──╼ ${NC}\c"
}

# Function to return to home
return_home() {
    echo -e "\n${DIM}${WHITE}─────────────────────────────────────────────────────────${NC}"
    echo -e "${WHITE}⏎ Press Enter to return to main menu...${NC}"
    read -r
    main
}

# Function to install fxtun
install_fxtun() {
    clear
    show_header
    echo -e "\n${BOLD}${BLACK}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLACK}║           📥 INSTALLING FXTUN OFFICIALLY 📥                     ║${NC}"
    echo -e "${BOLD}${BLACK}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${WHITE}► Downloading from official server...${NC}\n"
    
    if curl -fsSL https://fxtun.ru/install.sh | sh; then
        export PATH="$HOME/.local/bin:$PATH"
        echo -e "\n${BOLD}${GREEN}✅ FXTUN INSTALLED SUCCESSFULLY!${NC}\n"
        
        if command -v fxtunnel &> /dev/null; then
            echo -e "${WHITE}► Version:${NC} $(fxtunnel version 2>/dev/null || echo 'Installed')"
            echo -e "${WHITE}► Binary:${NC} ~/.local/bin/fxtunnel"
            echo -e "${WHITE}► Symlink:${NC} ~/.local/bin/fxtun"
        fi
    else
        echo -e "\n${BOLD}${RED}❌ INSTALLATION FAILED!${NC}"
        echo -e "${WHITE}► Try manual install:${NC}"
        echo -e "  curl -fsSL https://fxtun.ru/install.sh | sh"
    fi
    
    return_home
}

# Function to authenticate
authenticate() {
    clear
    show_header
    echo -e "\n${BOLD}${BLACK}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLACK}║           🔑 AUTHENTICATION WITH API KEY 🔑                      ║${NC}"
    echo -e "${BOLD}${BLACK}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${WHITE}► Enter your API Key:${NC}"
    echo -e "${DIM}${WHITE}  (Get from https://fxtun.ru)${NC}\n"
    echo -e "${BOLD}${BLACK}┌─[ API Key ]${NC}"
    echo -e "${BOLD}${BLACK}└──╼ ${NC}\c"
    read -r key
    
    if [ ${#key} -gt 10 ]; then
        echo "$key" > "$API_KEY_FILE"
        echo -e "\n${BOLD}${GREEN}✅ AUTHENTICATION SUCCESSFUL!${NC}"
        echo -e "${WHITE}► API Key saved:${NC} $API_KEY_FILE"
    else
        echo -e "\n${BOLD}${RED}❌ INVALID API KEY!${NC}"
        echo -e "${WHITE}► Please enter a valid API key${NC}"
    fi
    
    return_home
}

# Function to start tunneling
start_tunneling() {
    clear
    show_header
    
    # Check authentication
    API_KEY=$(get_api_key)
    if [ -z "$API_KEY" ]; then
        echo -e "\n${BOLD}${RED}❌ AUTHENTICATION REQUIRED!${NC}"
        echo -e "${WHITE}► Please authenticate first (Option 2)${NC}\n"
        return_home
        return
    fi
    
    # Check installation
    if ! check_fxtun; then
        echo -e "\n${BOLD}${RED}❌ FXTUN NOT INSTALLED!${NC}"
        echo -e "${WHITE}► Please install first (Option 1)${NC}\n"
        return_home
        return
    fi
    
    echo -e "\n${BOLD}${BLACK}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLACK}║           🚀 START TUNNELING / FORWARDING 🚀                    ║${NC}"
    echo -e "${BOLD}${BLACK}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    # Protocol selection
    echo -e "${BOLD}${WHITE}┌─────────────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}${WHITE}│           SELECT PROTOCOL TYPE                      │${NC}"
    echo -e "${BOLD}${WHITE}├─────────────────────────────────────────────────────┤${NC}"
    echo -e "${BOLD}${WHITE}│                                                     │${NC}"
    echo -e "${BOLD}${WHITE}│    ${WHITE}[${BLACK}1${WHITE}]${NC}  ${BLACK}TCP${NC}  - Transmission Control Protocol      ${BOLD}${WHITE}│${NC}"
    echo -e "${BOLD}${WHITE}│    ${WHITE}[${BLACK}2${WHITE}]${NC}  ${BLACK}UDP${NC}  - User Datagram Protocol             ${BOLD}${WHITE}│${NC}"
    echo -e "${BOLD}${WHITE}│    ${WHITE}[${BLACK}3${WHITE}]${NC}  ${BLACK}HTTPS${NC} - HTTP Secure / SSL/TLS             ${BOLD}${WHITE}│${NC}"
    echo -e "${BOLD}${WHITE}│                                                     │${NC}"
    echo -e "${BOLD}${WHITE}└─────────────────────────────────────────────────────┘${NC}\n"
    
    echo -e "${BOLD}${BLACK}┌─[ Select Protocol ]${NC}"
    echo -e "${BOLD}${BLACK}└──╼ ${NC}\c"
    read -r proto
    
    # Port input
    echo -e "\n${BOLD}${WHITE}┌─────────────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}${WHITE}│           ENTER PORT NUMBER                          │${NC}"
    echo -e "${BOLD}${WHITE}├─────────────────────────────────────────────────────┤${NC}"
    echo -e "${BOLD}${WHITE}│                                                     │${NC}"
    echo -e "${BOLD}${WHITE}│    ${DIM}► Port range: 1-65535${NC}                       ${BOLD}${WHITE}│${NC}"
    echo -e "${BOLD}${WHITE}│    ${DIM}► Common ports: 80, 443, 8080, 8443${NC}          ${BOLD}${WHITE}│${NC}"
    echo -e "${BOLD}${WHITE}│                                                     │${NC}"
    echo -e "${BOLD}${WHITE}└─────────────────────────────────────────────────────┘${NC}\n"
    
    echo -e "${BOLD}${BLACK}┌─[ Enter Port Number ]${NC}"
    echo -e "${BOLD}${BLACK}└──╼ ${NC}\c"
    read -r port
    
    # Validate port
    if ! [[ "$port" =~ ^[0-9]+$ ]] || [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
        echo -e "\n${BOLD}${RED}❌ INVALID PORT!${NC}"
        echo -e "${WHITE}► Please enter a number between 1-65535${NC}\n"
        return_home
        return
    fi
    
    # Protocol name
    case $proto in
    1) PROTO_NAME="TCP" ;;
    2) PROTO_NAME="UDP" ;;
    3) PROTO_NAME="HTTPS" ;;
    *) 
        echo -e "\n${BOLD}${RED}❌ INVALID PROTOCOL!${NC}"
        return_home
        return
        ;;
    esac
    
    # Show summary
    echo -e "\n${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${WHITE}║           📋 TUNNEL CONFIGURATION SUMMARY 📋                   ║${NC}"
    echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${WHITE}► Protocol:${NC}     ${BOLD}${BLACK}$PROTO_NAME${NC}"
    echo -e "${WHITE}► Port:${NC}         ${BOLD}${BLACK}$port${NC}"
    echo -e "${WHITE}► API Key:${NC}      ${BOLD}${BLACK}${API_KEY:0:10}...${NC}"
    echo -e "${WHITE}► Command:${NC}      ${BOLD}${BLACK}$CMD${NC}\n"
    
    # Start tunneling
    echo -e "${BOLD}${GREEN}🚀 STARTING TUNNEL...${NC}\n"
    echo -e "${DIM}${WHITE}Press Ctrl+C to stop the tunnel${NC}\n"
    
    # Try different command formats
    case $proto in
    1)
        # TCP
        $CMD tunnel tcp --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD tcp --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD tcp "$port" "$API_KEY" 2>/dev/null || \
        $CMD "$port" "$API_KEY" 2>/dev/null || \
        echo -e "${RED}❌ Failed to start tunnel. Please check fxtun documentation.${NC}"
        ;;
    2)
        # UDP
        $CMD tunnel udp --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD udp --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD udp "$port" "$API_KEY" 2>/dev/null || \
        $CMD "$port" "$API_KEY" 2>/dev/null || \
        echo -e "${RED}❌ Failed to start tunnel. Please check fxtun documentation.${NC}"
        ;;
    3)
        # HTTPS
        $CMD tunnel https --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD https --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD --port "$port" --key "$API_KEY" 2>/dev/null || \
        $CMD https "$port" "$API_KEY" 2>/dev/null || \
        $CMD "$port" "$API_KEY" 2>/dev/null || \
        echo -e "${RED}❌ Failed to start tunnel. Please check fxtun documentation.${NC}"
        ;;
    esac
    
    return_home
}

# Main function
main() {
    while true; do
        show_header
        show_menu
        read -r opt
        
        case $opt in
        1)
            install_fxtun
            ;;
        2)
            authenticate
            ;;
        3)
            start_tunneling
            ;;
        4)
            clear
            echo -e "\n${BOLD}${WHITE}╔═══════════════════════════════════════════════════════════════╗${NC}"
            echo -e "${BOLD}${WHITE}║           👋 THANK YOU FOR USING CODINGBOYZ TOOL 👋             ║${NC}"
            echo -e "${BOLD}${WHITE}╚═══════════════════════════════════════════════════════════════╝${NC}"
            echo -e "\n${BOLD}${BLACK}📺 Don't forget to Subscribe to CodingBoyz!${NC}"
            echo -e "${WHITE}► YouTube: CodingBoyz${NC}"
            echo -e "${WHITE}► GitHub: CODINGBOYZ${NC}\n"
            exit 0
            ;;
        *)
            echo -e "\n${BOLD}${RED}❌ INVALID OPTION!${NC}"
            echo -e "${WHITE}► Please select 1, 2, 3, or 4${NC}"
            sleep 2
            ;;
        esac
    done
}

# Run main function
main
