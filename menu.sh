clear
echo -e "\e[1;36m####################################################\e[0m"
echo -e "\e[1;32m     _   _   _ _____ ___        _   _ _______  \e[0m"
echo -e "\e[1;32m    / \ | | | |_   _/ _ \      | \ | | ____\ \/ / \e[0m"
echo -e "\e[1;32m   / _ \| | | | | || | | |_____|  \| |  _|  \  /   \e[0m"
echo -e "\e[1;32m  / ___ \ |_| | | || |_| |_____| |\  | |___ /  \   \e[0m"
echo -e "\e[1;32m /_/   \_\___/  |_| \___/      |_| \_|_____/_/\_\  \e[0m"
echo -e "\e[1;34m----------------------------------------------------\e[0m"
echo -e "\e[1;37m  DEVELOPER : \e[1;33mYounus Ali\e[0m"
echo -e "\e[1;37m  GITHUB    : \e[1;33mrifatttc\e[0m"
echo -e "\e[1;37m  SOCIAL    : \e[1;33m@Younus.fb\e[0m"
echo -e "\e[1;34m----------------------------------------------------\e[0m"
echo -e "\e[1;33m             AUTO-NEX: FREE AUTOMATION HUB          \e[0m"
echo -e "\e[1;34m####################################################\e[0m"
echo -e "\e[1;37m  [1] \e[1;32mSTART BINANCE BOT\e[0m"
echo -e "\e[1;37m  [2] \e[1;32mUPCOMING PROJECTS\e[0m"
echo -e "\e[1;37m  [3] \e[1;32mDIRECTORY MANAGER\e[0m"
echo -e "\e[1;37m  [4] \e[1;36mSYSTEM UPDATE & UPGRADE\e[0m"
echo -e "\e[1;37m  [5] \e[1;31mEXIT TO TERMINAL\e[0m"
echo -e "\e[1;37m  [6] \e[1;33mUPDATE NEX TOOL\e[0m"
echo -e "\e[1;37m  [0] \e[1;35mREFRESH MENU\e[0m"
echo -e "\e[1;34m####################################################\e[0m"
read -p "  Selection: " choice
case $choice in
    1) cd ~/binance-bot && python main.py ;;
    2) echo -e "\n\e[1;33m  [i] New free tools coming soon...\e[0m"; sleep 2; ~/menu.sh ;;
    3) cd ~/binance-bot && ls -la ;;
    4) 
        echo -e "\n\e[1;36m[1/3] Fetching package list updates...\e[0m"
        apt update
        echo -e "\n\e[1;33m[2/3] Checking for upgradable packages:\e[0m"
        apt list --upgradable
        UPGRADABLE=$(apt list --upgradable 2>/dev/null | grep -c "upgradable")
        if [ $UPGRADABLE -gt 0 ]; then
            echo -e "\n\e[1;32m[!] Total $UPGRADABLE packages can be updated.\e[0m"
            echo -n -e "\e[1;37m[?] Press ENTER to Start Update & Upgrade (or CTRL+C to Exit): \e[0m"
            read confirm
            echo -e "\e[1;32m\n[3/3] Starting System Upgrade... Please wait.\e[0m"
            apt upgrade -y
            echo -e "\n\e[1;32m[✔] System Update & Upgrade Successful!\e[0m"
        else
            echo -e "\n\e[1;32m[✔] No updates available. System is already clean.\e[0m"
        fi
        echo -e "\e[1;34m[i] Returning to menu in 4 seconds...\e[0m"
        sleep 4; ~/menu.sh
        ;;
    5) clear; exit ;;
    6)
        echo -e "\n\e[1;33m[i] Checking for Nex Tool updates from GitHub...\e[0m"
        cd ~/-auto-nex && git pull
        chmod +x menu.sh
        echo -e "\e[1;32m[✔] Update Complete! Reloading...\e[0m"
        sleep 2; ~/menu.sh
        ;;
    0) ~/menu.sh ;;
    *) echo -e "\n\e[1;31m  Invalid Choice!\e[0m"; sleep 1; ~/menu.sh ;;
esac
