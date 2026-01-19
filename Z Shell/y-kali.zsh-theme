#Author : JeffreyYAJ (https://github.com/JeffreyYAJ)

HOSTNAME=$(hostname)
length=$(echo -n "$HOSTNAME" | wc -c)

setopt PROMPT_SUBST
get_ip() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig eth0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig eth0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

shorten_path() {
  local path=$(pwd)
  local path_length=${#path}

  if (( path_length > 45 )); then
    echo "...${path: -40}" 
  else
    echo "$path"
  fi
}



if (( length < 15 )); then
  PROMPT=$'
┌─[%B%F{blue}'"${USER}"' '"${HOSTNAME}"'  $(shorten_path "$PWD")%f%b] [%F{green} $(get_ip)%f] $(git_prompt_info)
└─%B%F$%f%b '
else
  PROMPT=$'
┌─[%F{blue}'"${USER}"'  %~%f] [%F{green} $(get_ip)%f] $(git_prompt_info)
└─%B%F$%f%b '
fi

RPROMPT='%(?..'"${RED}Exit %?"')'

# Paste the rest in your .zshrc file 
# Make sure to have lolcat installed and adjust to as you wish

# # Reset #
 RESET_COLOR='\033[0m' # Text Reset

# # Regular Colors #
 Black='\033[0;30m'  Red='\033[0;31m'     Green='\033[0;32m'  Yellow='\033[0;33m'
 Blue='\033[0;34m'   Purple='\033[0;35m'  Cyan='\033[0;36m'   White='\033[0;37m'

# # Bold #
 BBlack='\033[1;30m' BRed='\033[1;31m'    BGreen='\033[1;32m' BYellow='\033[1;33m'
 BBlue='\033[1;34m'  BPurple='\033[1;35m' BCyan='\033[1;36m'  BWhite='\033[1;37m'

# # Underline #
 UBlack='\033[4;30m' URed='\033[4;31m'    UGreen='\033[4;32m' UYellow='\033[4;33m'
 UBlue='\033[4;34m'  UPurple='\033[4;35m' UCyan='\033[4;36m'  UWhite='\033[4;37m'

# # Background #
 On_Black='\033[40m' On_Red='\033[41m'    On_Green='\033[42m' On_Yellow='\033[43m'
 On_Blue='\033[44m'  On_Purple='\033[45m' On_Cyan='\033[46m'  On_White='\033[47m'

# # High Intensity #
 IBlack='\033[0;90m' IRed='\033[0;91m' IGreen='\033[0;92m' IYellow='\033[0;93m'
 IBlue='\033[0;94m' IPurple='\033[0;95m' ICyan='\033[0;96m' IWhite='\033[0;97m'

# # Bold High Intensity #
 BIBlack='\033[1;90m' BIRed='\033[1;91m' BIGreen='\033[1;92m' BIYellow='\033[1;93m'
 BIBlue='\033[1;94m' BIPurple='\033[1;95m' BICyan='\033[1;96m' BIWhite='\033[1;97m'

# # High Intensity backgrounds #
 On_IBlack='\033[0;100m' On_IRed='\033[0;101m' On_IGreen='\033[0;102m' On_IYellow='\033[0;103m'
 On_IBlue='\033[0;104m' On_IPurple='\033[0;105m' On_ICyan='\033[0;106m' On_IWhite='\033[0;107m'


 host=$(hostname)

# echo '   Welcome to Kali Linux ${BIGreen}Analyst.${USER} ${RESET_COLOR}\n' | lolcat
#  echo -e ${Blue} "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━━━━━━━━━━━━━━━┳━━━━━━━┓"
#  echo -e ${Blue} "┃                                                                 ┃ ${Cyan}  ${BRed}${USER} on ${host} ${Blue} ┃ ${BGreen}  ${BYellow} ${Blue} ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃ ██╗ ██╗    ██╗ ██╗   █████╗  ██╗     ██╗       ██████╗ ███████╗ ┣━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━┫"${RESET_COLOR}
#  echo -e ${Blue} "┃████████╗   ██║██╔╝  ██╔══██╗ ██║     ██║      ██╔═══██╗██╔════╝ ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃╚██╔═██╔╝   ████╔╝   ███████║ ██║     ██║      ██║   ██║███████╗ ┃ ${Cyan}  ${Blue}@author : ${BIGreen}YAJ     ${Blue}       ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃████████╗   ██║██╗   ██╔══██║ ██║     ██║      ██║   ██║╚════██║ ┃ ${Cyan}  ${Blue}Developed by : ${BIGreen}YAJ       ${Blue}┃"${RESET_COLOR}
#  echo -e ${Blue} "┃╚██╔═██╔╝   ██║ ███╗ ██║  ██║ ██████╗ ██║      ╚██████╔╝███████║ ┃ ${Cyan}  ${Blue}GitHub : ${BIGreen}@JeffreyYAJ    ${Blue} ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃ ╚═╝ ╚═╝    ╚═╝ ╚══╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝       ╚═════╝ ╚══════╝ ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┃                                                                 ┃                             ┃"${RESET_COLOR}
#  echo -e ${Blue} "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┻━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"${RESET_COLOR}

  echo -e "   Welcome to KALI Linux ${BIGreen}Analyst.${USER} ${RESET_COLOR}\n" | lolcat

if [ "$USE_SYNTAX_HIGHLIGHTING" = yes ]; then

    syntax_highlighting=no

    # enable syntax-highlighting if avalaible

    if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        syntax_highlighting=yes
    fi

    if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        syntax_highlighting=yes
    fi

    if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
        syntax_highlighting=yes

    fi

    if [ "$syntax_highlighting" = no ]; then
        if [ "$AUTO_DOWNLOAD_SYNTAX_HIGHLIGHTING_PLUGIN" = yes ]; then
            if whence -cp git &> /dev/null; then
                mkdir ~/.zsh >/dev/null 2>&1
                git clone --quiet https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting >/dev/null 2>&1
                if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
                    . ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
                    syntax_highlighting=yes
                else
                    echo "git not found, plugin zsh_syntax_highlighting not installed"
                fi
            fi
        fi
    fi


    if [ "$syntax_highlighting" = yes ]; then
    CL_CYAN="073"
        ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
        ZSH_HIGHLIGHT_STYLES[default]=none
        ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=white,underline
        ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[global-alias]=fg=$CL_CYAN,bold
        ZSH_HIGHLIGHT_STYLES[precommand]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=$CL_CYAN,underline
        ZSH_HIGHLIGHT_STYLES[path]=fg=white,bold
        ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
        ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[command-substitution]=none
        ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[process-substitution]=none
        ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=$CL_CYAN
        ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=$CL_CYAN
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
        ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
        ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
        ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[assign]=none
        ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
        ZSH_HIGHLIGHT_STYLES[named-fd]=none
        ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
        ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
        ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=$CL_CYAN,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
        ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
        ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
    fi

    unset syntax_highlighting

fi

toggle_oneline_prompt(){
    if [ "$PROMPT_ALTERNATIVE" = oneline ]; then
        PROMPT_ALTERNATIVE=twoline
    else
        PROMPT_ALTERNATIVE=oneline
    fi
    configure_prompt
    zle reset-prompt
}
zle -N toggle_oneline_prompt
bindkey ^P toggle_oneline_prompt



# enable color support of ls, less and man, and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:" # fix ls color for folders with 777 permissions

    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias diff='diff --color=auto'
    alias ip='ip --color=auto'

    alias pacman='pacman --color=auto'


    export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
    export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
    export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
    export LESS_TERMCAP_so=$'\E[01;33m'    # begin reverse video
    export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
    export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
    export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

    # Take advantage of $LS_COLORS for completion as well
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
    zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

if [ "$USE_ZSH_AUTOSUGGESTIONS" = yes ]; then

    zsh_autosuggestions=no

    # enable auto-suggestions based on completion and  history
    if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        zsh_autosuggestions=yes
    fi

    if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        zsh_autosuggestions=yes
    fi

    if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        # change suggestion color
        ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
        ZSH_AUTOSUGGEST_STRATEGY=(completion history)
        zsh_autosuggestions=yes
    fi

    if [ "$zsh_autosuggestions" = no ]; then
        if [ "$AUTO_DOWNLOAD_ZSH_AUTOSUGGESTIONS_PLUGIN" = yes ]; then
            if whence -cp git &> /dev/null; then
                mkdir ~/.zsh >/dev/null 2>&1
                git clone --quiet https://github.com/zsh-users/zsh-autosuggestions.git ~/.zsh/zsh-autosuggestions >/dev/null 2>&1
                if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
                    . ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
                    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555'
                    ZSH_AUTOSUGGEST_STRATEGY=(completion)
                    zsh_autosuggestions=yes
                fi
            else
                echo "git not found, plugin zsh_autosuggestions not installed"
            fi
        fi
    fi
fi


# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
    . /etc/zsh_command_not_found
fi


