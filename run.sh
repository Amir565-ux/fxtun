#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Check fxtun version and commands
check_fxtun() {
    if command -v fxtunnel &> /dev/null; then
        # Check available commands
        if fxtunnel --help 2>&1 | grep -q "tunnel"; then
            CMD="fxtunnel"
            MODE="tunnel"
        elif fxtunnel --help 2>&1 | grep -q "start"; then
            CMD="fxtunnel"
            MODE="start"
        else
            CMD="fxtunnel"
            MODE="unknown"
        fi
    elif command -v fxtun &> /dev/null; then
        CMD="fxtun"
        MODE="tunnel"
    else
        CMD=""
        MODE=""
    fi
}

# Header with animation effect
clear
echo -e "\n\n${BLUE}╔════════════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║${NC}                                                                            ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}           ${BOLD}${PURPLE}🔥  ${CYAN}CODINGBOYZ PRESENTS  ${PURPLE}🔥${NC}                  ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}                                                                            ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}           ${BOLD}${GREEN}⚡ PORT FORWARDING MASTER TOOL g ⚡${NC}                 ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}                                                                            ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}              ${YELLOW}Power by FXTUN - Professional Tunneling${NC}            ${BLUE}║${NC}"
echo -e "${BLUE}║${NC}                                                                            ${BLUE}║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════════════════╝${NC}"

echo -e "\n\n${BOLD}${YELLOW}           📺  SUBSCRIBE TO CODINGBOYZ  📺${NC}\n"
echo -e "        ${CYAN}► YouTube: CodingBoyz ◄${NC}\n\n"

echo -e "${BLUE}════════════════════════════════════════════════════════════════════════${NC}\n"

# Menu with better design
echo -e "  ${BOLD}${GREEN}┌─────────────────────────────────────────────────┐${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}     ${BOLD}${YELLOW}SELECT YOUR OPTION${NC}                   ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}├─────────────────────────────────────────────────┤${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}                                                 ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}    ${BLUE}[${YELLOW}1${BLUE}]${NC}  ${GREEN}Install FXTUN${NC}                      ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}    ${BLUE}[${YELLOW}2${BLUE}]${NC}  ${GREEN}Authenticate (API Key)${NC}             ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}    ${BLUE}[${YELLOW}3${BLUE}]${NC}  ${GREEN}Start Tunneling / Forwarding${NC}       ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}    ${BLUE}[${YELLOW}4${BLUE}]${NC}  ${RED}Exit${NC}                             ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}│${NC}                                                 ${BOLD}${GREEN}│${NC}"
echo -e "  ${BOLD}${GREEN}└─────────────────────────────────────────────────┘${NC}\n"

echo -e "${BLUE}════════════════════════════════════════════════════════════════════════${NC}\n"
echo -e "${BOLD}${GREEN}┌─[ Enter Your Choice ]${NC}"
echo -e "${BOLD}${GREEN}└──╼ ${NC}\c"
read opt

case $opt in
1)
    echo -e "\n\n${BOLD}${YELLOW}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${YELLOW}║           📥 INSTALLING FXTUN OFFICIALLY 📥                     ║${NC}"
    echo -e "${BOLD}${YELLOW}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${CYAN}► Downloading from official server...${NC}\n"
    curl -fsSL https://fxtun.ru/install.sh | sh
    
    if [ $? -eq 0 ]; then
        export PATH="$HOME/.local/bin:$PATH"
        echo -e "\n${BOLD}${GREEN}✅ FXTUN INSTALLED SUCCESSFULLY!${NC}\n"
        
        # Show version
        if command -v fxtunnel &> /dev/null; then
            echo -e "${CYAN}► Version:${NC} $(fxtunnel version 2>/dev/null || echo 'Installed')"
        fi
        echo -e "\n${BOLD}${GREEN}► Binary Location:${NC} ~/.local/bin/fxtunnel"
        echo -e "${BOLD}${GREEN}► Symlink:${NC} ~/.local/bin/fxtun"
    else
        echo -e "\n${BOLD}${RED}❌ INSTALLATION FAILED!${NC}"
        echo -e "${YELLOW}► Try manual install:${NC}"
        echo -e "  curl -fsSL https://fxtun.ru/install.sh | sh"
    fi
    
    echo -e "\n${BOLD}${YELLOW}📺 Subscribe to CodingBoyz!${NC}\n"
    ;;
    
2)
    echo -e "\n\n${BOLD}${YELLOW}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${YELLOW}║           🔑 AUTHENTICATION WITH API KEY 🔑                      ║${NC}"
    echo -e "${BOLD}${YELLOW}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    echo -e "${CYAN}► Enter your API Key:${NC}"
    echo -e "${YELLOW}  (Get from https://fxtun.ru)${NC}\n"
    echo -e "${BOLD}${GREEN}┌─[ API Key ]${NC}"
    echo -e "${BOLD}${GREEN}└──╼ ${NC}\c"
    read key
    
    if [ ${#key} -gt 10 ]; then
        echo "$key" > ~/.fxtun_key
        echo -e "\n${BOLD}${GREEN}✅ AUTHENTICATION SUCCESSFUL!${NC}"
        echo -e "${CYAN}► API Key saved:${NC} ~/.fxtun_key"
    else
        echo -e "\n${BOLD}${RED}❌ INVALID API KEY!${NC}"
        echo -e "${YELLOW}► Please enter a valid API key${NC}"
    fi
    
    echo -e "\n${BOLD}${YELLOW}📺 Subscribe to CodingBoyz!${NC}\n"
    ;;
    
3)
    echo -e "\n\n${BOLD}${YELLOW}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${YELLOW}║           🚀 START TUNNELING / FORWARDING 🚀                    ║${NC}"
    echo -e "${BOLD}${YELLOW}╚═══════════════════════════════════════════════════════════════╝${NC}\n"
    
    # Check authentication
    if [ ! -f ~/.fxtun_key ]; then
        echo -e "${BOLD}${RED}❌ AUTHENTICATION REQUIRED!${NC}"
        echo -e "${YELLOW}► Please authenticate first (Option 2)${NC}\n"
        exit 1
    fi
    
    # Check installation
    check_fxtun
    if [ -z "$CMD" ]; then
        echo -e "${BOLD}${RED}❌ FXTUN NOT INSTALLED!${NC}"
        echo -e "${YELLOW}► Please install first (Option 1)${NC}\n"
        exit 1
    fi
    
    API_KEY=$(cat ~/.fxtun_key)
    
    # Protocol selection with better UI
    echo -e "${BOLD}${CYAN}┌─────────────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}${CYAN}│           SELECT PROTOCOL TYPE                      │${NC}"
    echo -e "${BOLD}${CYAN}├─────────────────────────────────────────────────────┤${NC}"
    echo -e "${BOLD}${CYAN}│                                                     │${NC}"
    echo -e "${BOLD}${CYAN}│    ${BLUE}[${GREEN}1${BLUE}]${NC}  ${BOLD}TCP${NC}  - Transmission Control Protocol      ${BOLD}${CYAN}│${NC}"
    echo -e "${BOLD}${CYAN}│    ${BLUE}[${GREEN}2${BLUE}]${NC}  ${BOLD}UDP${NC}  - User Datagram Protocol             ${BOLD}${CYAN}│${NC}"
    echo -e "${BOLD}${CYAN}│    ${BLUE}[${GREEN}3${BLUE}]${NC}  ${BOLD}HTTPS${NC} - HTTP Secure / SSL/TLS             ${BOLD}${CYAN}│${NC}"
    echo -e "${BOLD}${CYAN}│                                                     │${NC}"
    echo -e "${BOLD}${CYAN}└─────────────────────────────────────────────────────┘${NC}\n"
    
    echo -e "${BOLD}${GREEN}┌─[ Select Protocol ]${NC}"
    echo -e "${BOLD}${GREEN}└──╼ ${NC}\c"
    read proto
    
    # Port input with validation
    echo -e "\n${BOLD}${CYAN}┌─────────────────────────────────────────────────────┐${NC}"
    echo -e "${BOLD}${CYAN}│           ENTER PORT NUMBER                          │${NC}"
    echo -e "${BOLD}${CYAN}├─────────────────────────────────────────────────────┤${NC}"
    echo -e "${BOLD}${CYAN}│                                                     │${NC}"
    echo -e "${BOLD}${CYAN}│    ${YELLOW}► Port range: 1-65535${NC}                       ${BOLD}${CYAN}│${NC}"
    echo -e "${BOLD}${CYAN}│    ${YELLOW}► Common ports: 80, 443, 8080, 8443${NC}          ${BOLD}${CYAN}│${NC}"
    echo -e "${BOLD}${CYAN}│                                                     │${NC}"
    echo -e "${BOLD}${CYAN}└─────────────────────────────────────────────────────┘${NC}\n"
    
    echo -e "${BOLD}${GREEN}┌─[ Enter Port Number ]${NC}"
    echo -e "${BOLD}${GREEN}└──╼ ${NC}\c"
    read port
    
    # Validate port
    if ! [[ "$port" =~ ^[0-9]+$ ]] || [ "$port" -lt 1 ] || [ "$port" -gt 65535 ]; then
        echo -e "\n${BOLD}${RED}❌ INVALID PORT!${NC}"
        echo -e "${YELLOW}► Please enter a number between 1-65535${NC}\n"
        exit 1
    fi
    
    # Protocol name
    case $proto in
    1) PROTO_NAME="TCP" ;;
    2) PROTO_NAME="UDP" ;;
    3) PROTO_NAME="HTTPS" ;;
    *) PROTO_NAME="UNKNOWN" ;;
    esac
    
    # Show summary
    echo -e "\n${BOLD}${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║           📋 TUNNEL CONFIGURATION SUMMARY 📋                   ║${NC}"
    echo -e "${BOLD}${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "${CYAN}► Protocol:${NC}     ${BOLD}${GREEN}$PROTO_NAME${NC}"
    echo -e "${CYAN}► Port:${NC}         ${BOLD}${GREEN}$port${NC}"
    echo -e "${CYAN}► API Key:${NC}      ${BOLD}${GREEN}${API_KEY:0:10}...${NC}"
    echo -e "${CYAN}► Command:${NC}      ${BOLD}${YELLOW}$CMD${NC}\n"
    
    # Start tunneling based on command structure
    echo -e "${BOLD}${GREEN}🚀 STARTING TUNNEL...${NC}\n"
    
    case $proto in
    1)
        # TCP Forwarding
        echo -e "${BOLD}${YELLOW}► Creating TCP tunnel on port $port...${NC}\n"
        if [ "$MODE" = "tunnel" ]; then
            $CMD tunnel tcp --port $port --key $API_KEY
        elif [ "$MODE" = "start" ]; then
            $CMD start --port $port --protocol tcp --key $API_KEY
        else
            # Try different command formats
            echo -e "${YELLOW}► Trying alternative command format...${NC}\n"
            $CMD --port $port --key $API_KEY 2>/dev/null || \
            $CMD tcp $port $API_KEY 2>/dev/null || \
            echo -e "${RED}❌ Command not found. Please check fxtun documentation.${NC}"
        fi
        ;;
    2)
        # UDP Forwarding
        echo -e "${BOLD}${YELLOW}► Creating UDP tunnel on port $port...${NC}\n"
        if [ "$MODE" = "tunnel" ]; then
            $CMD tunnel udp --port $port --key $API_KEY
        elif [ "$MODE" = "start" ]; then
            $CMD start --port $port --protocol udp --key $API_KEY
        else
            echo -e "${YELLOW}► Trying alternative command format...${NC}\n"
            $CMD --port $port --key $API_KEY 2>/dev/null || \
            $CMD udp $port $API_KEY 2>/dev/null || \
            echo -e "${RED}❌ Command not found. Please check fxtun documentation.${NC}"
        fi
        ;;
    3)
        # HTTPS Forwarding
        echo -e "${BOLD}${YELLOW}► Creating HTTPS tunnel on port $port...${NC}\n"
        if [ "$MODE" = "tunnel" ]; then
            $CMD tunnel https --port $port --key $API_KEY
        elif [ "$MODE" = "start" ]; then
            $CMD start --port $port --protocol https --key $API_KEY
        else
            echo -e "${YELLOW}► Trying alternative command format...${NC}\n"
            $CMD --port $port --key $API_KEY 2>/dev/null || \
            $CMD https $port $API_KEY 2>/dev/null || \
            echo -e "${RED}❌ Command not found. Please check fxtun documentation.${NC}"
        fi
        ;;
    *)
        echo -e "\n${BOLD}${RED}❌ INVALID PROTOCOL SELECTED!${NC}\n"
        exit 1
        ;;
    esac
    
    echo -e "\n${BOLD}${YELLOW}📺 Subscribe to CodingBoyz for more tools!${NC}\n"
    ;;
    
4)
    echo -e "\n\n${BOLD}${BLUE}╔═══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${BOLD}${BLUE}║           👋 THANK YOU FOR USING CODINGBOYZ TOOL 👋             ║${NC}"
    echo -e "${BOLD}${BLUE}╚═══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "\n${BOLD}${YELLOW}📺 Don't forget to Subscribe to CodingBoyz!${NC}"
    echo -e "${CYAN}► YouTube: CodingBoyz${NC}"
    echo -e "${CYAN}► GitHub: CODINGBOYZ${NC}\n"
    exit
    ;;
    
*)
    echo -e "\n\n${BOLD}${RED}❌ INVALID OPTION!${NC}"
    echo -e "${YELLOW}► Please select 1, 2, 3, or 4${NC}\n"
    ;;
esac
