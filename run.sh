#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;36m'
NC='\033[0m'

# Header
clear
echo -e "\n\n${BLUE}╔═══════════════════════════════════════════════════════════════════╗"
echo -e "║                                                                   ║"
echo -e "║                      🔥  CODINGBOYZ  🔥                           ║"
echo -e "║                                                                   ║"
echo -e "║                  Port Forwarding Tool with fxtun                  ║"
echo -e "║                                                                   ║"
echo -e "╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo -e "\n\n${YELLOW}              📺  SUBSCRIBE TO CODINGBOYZ  📺${NC}\n\n"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════════${NC}\n"

# Menu
echo -e "  ${YELLOW}[1]${NC}  ${GREEN}Install fxtun${NC}\n"
echo -e "  ${YELLOW}[2]${NC}  ${GREEN}Authenticate (API Key)${NC}\n"
echo -e "  ${YELLOW}[3]${NC}  ${GREEN}Forward Port${NC}\n"
echo -e "  ${YELLOW}[4]${NC}  ${RED}Exit${NC}\n\n"
echo -e "${BLUE}═══════════════════════════════════════════════════════════════════${NC}\n"
echo -e "${GREEN}┌─[ Select an Option ]${NC}"
echo -e "${GREEN}└──╼ ${NC}\c"
read opt

case $opt in
1)
    echo -e "\n\n${YELLOW}⬇  Installing fxtun using official installer...${NC}\n"
    
    # Official installation script
    curl -fsSL https://fxtun.ru/install.sh | sh
    
    # Add to PATH immediately
    export PATH="$HOME/.local/bin:$PATH"
    
    echo -e "\n\n${GREEN}✅ fxtun installed successfully!${NC}\n"
    echo -e "${YELLOW}📺 Subscribe to CodingBoyz!${NC}\n"
    ;;
    
2)
    echo -e "\n\n${YELLOW}🔑 Enter your API Key:${NC}\n"
    read key
    echo "$key" > ~/.fxtun_key
    echo -e "\n\n${GREEN}✅ Authenticated successfully!${NC}\n"
    echo -e "${YELLOW}📺 Subscribe to CodingBoyz!${NC}\n"
    ;;
    
3)
    if [ ! -f ~/.fxtun_key ]; then
        echo -e "\n\n${RED}❌ Please authenticate first (option 2)${NC}\n"
    else
        # Check if fxtun is installed
        if ! command -v fxtun &> /dev/null && ! command -v fxtunnel &> /dev/null; then
            echo -e "\n\n${RED}❌ fxtun not installed! Please install first (option 1)${NC}\n"
        else
            echo -e "\n\n${YELLOW}📡 Select protocol:${NC}\n"
            echo -e "  ${BLUE}[1]${NC}  ${GREEN}TCP${NC}\n"
            echo -e "  ${BLUE}[2]${NC}  ${GREEN}UDP${NC}\n"
            echo -e "  ${BLUE}[3]${NC}  ${GREEN}HTTPS${NC}\n"
            read proto
            echo -e "\n${YELLOW}🔌 Enter port number to forward:${NC}\n"
            read port
            echo -e "\n"
            
            # Use fxtun or fxtunnel
            if command -v fxtun &> /dev/null; then
                CMD="fxtun"
            else
                CMD="fxtunnel"
            fi
            
            case $proto in
            1)
                echo -e "${GREEN}✅ Forwarding TCP on port $port...${NC}\n"
                $CMD forward tcp --port $port --key $(cat ~/.fxtun_key)
                ;;
            2)
                echo -e "${GREEN}✅ Forwarding UDP on port $port...${NC}\n"
                $CMD forward udp --port $port --key $(cat ~/.fxtun_key)
                ;;
            3)
                echo -e "${GREEN}✅ Forwarding HTTPS on port $port...${NC}\n"
                $CMD forward https --port $port --key $(cat ~/.fxtun_key)
                ;;
            *)
                echo -e "\n${RED}❌ Invalid protocol selected${NC}\n"
                ;;
            esac
        fi
    fi
    ;;
    
4)
    echo -e "\n\n${BLUE}👋 Goodbye! Don't forget to Subscribe to CodingBoyz!${NC}\n\n"
    exit
    ;;
    
*)
    echo -e "\n\n${RED}❌ Invalid option! Please select 1-4${NC}\n"
    ;;
esac
