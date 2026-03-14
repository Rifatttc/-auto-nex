clear
# মুভি স্টাইল টাইপিং ইফেক্ট
typing_effect() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -n "${text:$i:1}"
        sleep 0.005
    done
    echo ""
}

# প্রোফেশনাল ফাইল ম্যানেজার
file_manager() {
    while true; do
        clear
        # টপ স্টাইলিশ হেডার
        echo -e "\e[1;31m┌──────────────────────────────────────────────────┐"
        echo -e "│ \e[1;32m● \e[1;33m● \e[1;31m● \e[1;37m CORE_SYSTEM_ACCESS \e[1;31m| \e[1;36mSHELL_V3.0 \e[1;31m    │"
        echo -e "└──────────────────────────────────────────────────┘\e[0m"
        
        # বর্তমান লোকেশন বার
        echo -e "\e[1;31m[\e[1;37mNODE\e[1;31m] \e[1;32m>> \e[1;36m$(pwd)\e[0m"
        echo -e "\e[1;31m----------------------------------------------------\e[0m"
        
        # ফাইল এবং ফোল্ডার সর্টিং লজিক
        all_items=($(ls))
        dirs=(); files=()
        for item in "${all_items[@]}"; do
            [ -d "$item" ] && dirs+=("$item") || files+=("$item")
        done
        sorted_list=("${dirs[@]}" "${files[@]}")
        
        # টেবিল হেডার
        echo -e "\e[1;32mID    TYPE          NAME\e[0m"
        echo -e "\e[1;31m──    ────          ────\e[0m"
        
        # ব্যাক অপশন
        printf "\e[1;31m[\e[1;37m00\e[1;31m]  \e[1;35m<DIR_RECOVERY> \e[1;35m.. (BACK_TO_ROOT)\e[0m\n"
        
        # লুপ দিয়ে ফাইল/ফোল্ডার সাজানো
        i=1
        for item in "${sorted_list[@]}"; do
            if [ -d "$item" ]; then
                printf "\e[1;31m[\e[1;32m%02d\e[1;31m]  \e[1;33m{DIRECTORY}    \e[1;32m%s\e[0m\n" "$i" "$item"
            else
                printf "\e[1;31m[\e[1;32m%02d\e[1;31m]  \e[1;36m[DATA_FILE]    \e[1;37m%s\e[0m\n" "$i" "$item"
            fi
            ((i++))
        done
        
        echo -e "\e[1;31m----------------------------------------------------\e[0m"
        echo -ne "\e[1;33m[?] SELECT TARGET ID OR \"Q\" TO DISCONNECT: \n\e[1;31mHACKER@ROOT_SHELL# \e[0m"
        read choice
        
        if [[ "$choice" == "q" || "$choice" == "Q" ]]; then 
            typing_effect ">> DISCONNECTING ENCRYPTED TUNNEL..."
            break
        fi
        
        if [[ "$choice" == "00" || "$choice" == "0" ]]; then 
            cd ..
            continue # অটোমেটিক আবার লিস্ট দেখাবে
        fi
        
        if [[ "$choice" =~ ^[0-9]+$ ]] && [ "$choice" -le "${#sorted_list[@]}" ] && [ "$choice" -gt 0 ]; then
            target="${sorted_list[$((choice-1))]}"
            if [ -d "$target" ]; then
                cd "$target"
                # এখানে কোনো ব্রেক বা রিড নেই, সরাসরি লুপের শুরুতে গিয়ে আবার লিস্ট দেখাবে
            else
                clear
                echo -e "\e[1;31m"
                typing_effect ">> INJECTING PAYLOAD TO: $target"
                typing_effect ">> EXECUTING BINARY..."
                echo -e "\e[0m"
                
                if [[ "$target" == *.sh ]]; then bash "$target"
                elif [[ "$target" == *.py ]]; then python "$target"
                elif [[ "$target" == *.php ]]; then php "$target"
                else cat "$target"; fi
                
                echo -e "\n\e[1;32m>> EXECUTION FINISHED.\e[0m"
                echo -e "\e[1;33mPress Enter to return to Explorer...\e[0m"
                read
            fi
        else
            # যদি ভুল কমান্ড দেয়, তবে সরাসরি ওই কমান্ড রান করবে (যেমন: rm, cp ইত্যাদি)
            clear
            eval $choice
            echo -e "\n\e[1;32mCommand Finished. Press Enter...\e[0m"
            read
        fi
    done
}

# মেইন লুপ শুরু
while true; do
    clear
    echo -e "\e[1;32m     _   _   _ _____ ___        _   _ _______  "
    echo -e "\e[1;32m    / \ | | | |_   _/ _ \      | \ | | ____\ \/ / "
    echo -e "\e[1;32m   / _ \| | | | | || | | |_____|  \| |  _|  \  /   "
    echo -e "\e[1;32m  / ___ \ |_| | | || |_| |_____| |\  | |___ /  \   "
    echo -e "\e[1;32m /_/   \_\___/  |_| \___/      |_| \_|_____/_/\_\ \e[0m"
    echo -e "\e[1;34m----------------------------------------------------\e[0m"
    echo -e "\e[1;33m             AUTO-NEX: FREE AUTOMATION HUB          \e[0m"
    echo -e "\e[1;34m####################################################\e[0m"
    echo -e "  \e[1;37m[1] \e[1;32m✨ UPCOMING PROJECTS\e[0m"
    echo -e "  \e[1;36m[2] \e[1;36m⚙️  SYSTEM UPDATE\e[0m"
    echo -e "  \e[1;33m[3] \e[1;33m🔄 UPDATE NEX TOOL\e[0m"
    echo -e "  \e[1;31m[4] \e[1;31m❌ EXIT TO TERMUX\e[0m"
    echo -e "\e[1;34m####################################################\e[0m"
    
    read -p "STYLISH TERMINAL# " cmd
    case $cmd in
        1) echo -e "\n\e[1;33m  [i] Scanning database...\e[0m"; sleep 1 ;;
        2) apt update && apt upgrade -y; echo -e "\n\e[1;32mSYSTEM UPDATED SUCCESSFULLY\e[0m"; read ;;
        3) cd ~/auto-nex && git pull && chmod +x menu.sh; echo -e "\n\e[1;32m  Updated!\e[0m"; read ;;
        4) clear; exit ;;
        "") continue ;; 
        ls) file_manager ;; 
        *) 
            clear
            typing_effect ">> EXECUTING COMMAND: $cmd"
            eval $cmd
            echo -e "\n\e[1;33mPress Enter to return...\e[0m"; read ;;
    esac
done
