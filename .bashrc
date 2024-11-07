#!/usr/bin/env bash
iatest=$(expr index "$-" i)

#######################################################
# SOURCED ALIAS'S AND SCRIPTS BY zachbrowne.me
#######################################################
if [ -f /usr/bin/fastfetch ]; then
	fastfetch
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Enable bash programmable completion features in interactive shells
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
elif [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

#######################################################
# EXPORTS
#######################################################

# Disable the bell
if [[ $iatest -gt 0 ]]; then bind "set bell-style visible"; fi

# Expand the history size
export HISTFILESIZE=10000
export HISTSIZE=500
export HISTTIMEFORMAT="%F %T" # add timestamp to history

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# set up XDG folders
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# Seeing as other scripts will use it might as well export it
export LINUXTOOLBOXDIR="$HOME/linuxtoolbox"

# Allow ctrl-S for history navigation (with ctrl-R)
[[ $- == *i* ]] && stty -ixon

# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nvim
export VISUAL=nvim
alias pico='edit'
alias spico='sedit'
alias nano='edit'
alias snano='sedit'
alias vim='nvim'

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated

# Check if ripgrep is installed
if command -v rg &> /dev/null; then
    # Alias grep to rg if ripgrep is installed
    alias grep='rg'
else
    # Alias grep to /usr/bin/grep with GREP_OPTIONS if ripgrep is not installed
    alias grep="/usr/bin/grep $GREP_OPTIONS"
fi
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

#######################################################
# MACHINE SPECIFIC ALIAS'S
#######################################################

# Alias's for SSH
# alias SERVERNAME='ssh YOURWEBSITE.com -l USERNAME -p PORTNUMBERHERE'

# Alias's to change the directory
alias web='cd /var/www/html'

# Alias's to mount ISO files
# mount -o loop /home/NAMEOFISO.iso /home/ISOMOUNTDIR/
# umount /home/NAMEOFISO.iso
# (Both commands done as root only.)

#######################################################
# GENERAL ALIAS'S
#######################################################
# To temporarily bypass an alias, we precede the command with a \
# EG: the ls command is aliased, but to use the normal ls command you would type \ls
alias freegames='docker run --rm -it -p 6080:6080 -v fgc:/fgc/data --pull=always ghcr.io/vogler/free-games-claimer
'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'

# Show help for this .bashrc file
alias hlp='less ~/.bashrc_help'

# alias to show the date
alias da='date "+%Y-%m-%d %A %T %Z"'

# Alias's to modified commands
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v'
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias vi='nvim'
alias svi='sudo vi'
alias vis='nvim "+set si"'


# Change directory aliases
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# cd into the old directory
alias bd='cd "$OLDPWD"'

# Remove a directory and all files
alias rmd='/bin/rm  --recursive --force --verbose '

# Alias's for multiple directory listing commands
alias la='ls -Alh'                # show hidden files
alias ls='ls -aFh --color=always' # add colors and file type extensions
alias lx='ls -lXBh'               # sort by extension
alias lk='ls -lSrh'               # sort by size
alias lc='ls -ltcrh'              # sort by change time
alias lu='ls -lturh'              # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              # alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias lla='ls -Al'                # List and Hidden Files
alias las='ls -A'                 # Hidden Files
alias lls='ls -l'                 # List

# alias chmod commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search command line history
alias h="history | grep "

# Search running processes
alias p="ps aux | grep "
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"

# Search files in the current folder
alias f="find . | grep "

# Count all files (recursively) in the current folder
alias countfiles="for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null"

# To see if a command is aliased, a file, or a built-in command
alias checkcommand="type -t"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Alias's for archives
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# Show all logs in /var/log
alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"

# SHA1
alias sha1='openssl sha1'

alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'

# KITTY - alias to be able to use kitty features when connecting to remote servers(e.g use tmux on remote server)

alias kssh="kitty +kitten ssh"

# alias to cleanup unused docker containers, images, networks, and volumes

alias docker-clean=' \
  docker container prune -f ; \
  docker image prune -f ; \
  docker network prune -f ; \
  docker volume prune -f '
alias docker-ip='docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /''
function dip() {
        if [ -z $1 ]; then
                docker ps -a --format "{{.ID}}" | while read -r line ; do
                        echo $line $(docker inspect --format "{{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $line | sed 's/\///'):$(docker port "$line" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
                done
        else
                echo $(docker inspect --format "{{.ID }} {{ .Name }} {{ .NetworkSettings.Networks.bridge.IPAddress }}" $1 | sed 's/\///'):$(docker port "$1" | grep -o "0.0.0.0:.*" | cut -f2 -d:)
        fi
}

#######################################################
# SPECIAL FUNCTIONS
#######################################################
# Extracts any archive(s) (if unp isn't installed)
extract() {
	for archive in "$@"; do
		if [ -f "$archive" ]; then
			case $archive in
			*.tar.bz2) tar xvjf $archive ;;
			*.tar.gz) tar xvzf $archive ;;
			*.bz2) bunzip2 $archive ;;
			*.rar) rar x $archive ;;
			*.gz) gunzip $archive ;;
			*.tar) tar xvf $archive ;;
			*.tbz2) tar xvjf $archive ;;
			*.tgz) tar xvzf $archive ;;
			*.zip) unzip $archive ;;
			*.Z) uncompress $archive ;;
			*.7z) 7z x $archive ;;
			*) echo "don't know how to extract '$archive'..." ;;
			esac
		else
			echo "'$archive' is not a valid file!"
		fi
	done
}

# Searches for text in all files in the current folder
ftext() {
	# -i case-insensitive
	# -I ignore binary files
	# -H causes filename to be printed
	# -r recursive search
	# -n causes line number to be printed
	# optional: -F treat search term as a literal, not a regular expression
	# optional: -l only print filenames and not the matching lines ex. grep -irl "$1" *
	grep -iIHrn --color=always "$1" . | less -r
}

# Copy file with a progress bar
cpp() {
    set -e
    strace -q -ewrite cp -- "${1}" "${2}" 2>&1 |
    awk '{
        count += $NF
        if (count % 10 == 0) {
            percent = count / total_size * 100
            printf "%3d%% [", percent
            for (i=0;i<=percent;i++)
                printf "="
            printf ">"
            for (i=percent;i<100;i++)
                printf " "
            printf "]\r"
        }
    }
    END { print "" }' total_size="$(stat -c '%s' "${1}")" count=0
}

# Copy and go to the directory
cpg() {
	if [ -d "$2" ]; then
		cp "$1" "$2" && cd "$2"
	else
		cp "$1" "$2"
	fi
}

# Move and go to the directory
mvg() {
	if [ -d "$2" ]; then
		mv "$1" "$2" && cd "$2"
	else
		mv "$1" "$2"
	fi
}

# Create and go to the directory
mkdirg() {
	mkdir -p "$1"
	cd "$1"
}

# Goes up a specified number of directories  (i.e. up 4)
up() {
	local d=""
	limit=$1
	for ((i = 1; i <= limit; i++)); do
		d=$d/..
	done
	d=$(echo $d | sed 's/^\///')
	if [ -z "$d" ]; then
		d=..
	fi
	cd $d
}

# Automatically do an ls after each cd, z, or zoxide
cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# Returns the last 2 fields of the working directory
pwdtail() {
	pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Show the current distribution
distribution () {
    local dtype="unknown"  # Default to unknown

    # Use /etc/os-release for modern distro identification
    if [ -r /etc/os-release ]; then
        source /etc/os-release
        case $ID in
            fedora|rhel|centos)
                dtype="redhat"
                ;;
            sles|opensuse*)
                dtype="suse"
                ;;
            ubuntu|debian)
                dtype="debian"
                ;;
            gentoo)
                dtype="gentoo"
                ;;
            arch|manjaro)
                dtype="arch"
                ;;
            slackware)
                dtype="slackware"
                ;;
            *)
                # Check ID_LIKE only if dtype is still unknown
                if [ -n "$ID_LIKE" ]; then
                    case $ID_LIKE in
                        *fedora*|*rhel*|*centos*)
                            dtype="redhat"
                            ;;
                        *sles*|*opensuse*)
                            dtype="suse"
                            ;;
                        *ubuntu*|*debian*)
                            dtype="debian"
                            ;;
                        *gentoo*)
                            dtype="gentoo"
                            ;;
                        *arch*)
                            dtype="arch"
                            ;;
                        *slackware*)
                            dtype="slackware"
                            ;;
                    esac
                fi

                # If ID or ID_LIKE is not recognized, keep dtype as unknown
                ;;
        esac
    fi

    echo $dtype
}


DISTRIBUTION=$(distribution)
if [ "$DISTRIBUTION" = "redhat" ] || [ "$DISTRIBUTION" = "arch" ]; then
      alias cat='bat'
else
      alias cat='batcat'
fi 

# Show the current version of the operating system
ver() {
    local dtype
    dtype=$(distribution)

    case $dtype in
        "redhat")
            if [ -s /etc/redhat-release ]; then
                cat /etc/redhat-release
            else
                cat /etc/issue
            fi
            uname -a
            ;;
        "suse")
            cat /etc/SuSE-release
            ;;
        "debian")
            lsb_release -a
            ;;
        "gentoo")
            cat /etc/gentoo-release
            ;;
        "arch")
            cat /etc/os-release
            ;;
        "slackware")
            cat /etc/slackware-version
            ;;
        *)
            if [ -s /etc/issue ]; then
                cat /etc/issue
            else
                echo "Error: Unknown distribution"
                exit 1
            fi
            ;;
    esac
}

# Automatically install the needed support files for this .bashrc file
install_bashrc_support() {
	local dtype
	dtype=$(distribution)

	case $dtype in
		"redhat")
			sudo yum install multitail tree zoxide trash-cli fzf bash-completion fastfetch
			;;
		"suse")
			sudo zypper install multitail tree zoxide trash-cli fzf bash-completion fastfetch
			;;
		"debian")
			sudo apt-get install multitail tree zoxide trash-cli fzf bash-completion
			# Fetch the latest fastfetch release URL for linux-amd64 deb file
			FASTFETCH_URL=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep "browser_download_url.*linux-amd64.deb" | cut -d '"' -f 4)

			# Download the latest fastfetch deb file
			curl -sL $FASTFETCH_URL -o /tmp/fastfetch_latest_amd64.deb

			# Install the downloaded deb file using apt-get
			sudo apt-get install /tmp/fastfetch_latest_amd64.deb
			;;
		"arch")
			sudo paru multitail tree zoxide trash-cli fzf bash-completion fastfetch
			;;
		"slackware")
			echo "No install support for Slackware"
			;;
		*)
			echo "Unknown distribution"
			;;
	esac
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip () {
    # Internal IP Lookup.
    if command -v ip &> /dev/null; then
        echo -n "Internal IP: "
        ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
    else
        echo -n "Internal IP: "
        ifconfig wlan0 | grep "inet " | awk '{print $2}'
    fi

    # External IP Lookup
    echo -n "External IP: "
    curl -s ifconfig.me
}
netinfo() {
    sparkbars
	echo "--------------- Network Information ---------------"
	ip a | awk '/^[0-9]+:/{gsub(/:/,"",$2); device=$2} /^[[:space:]]*inet /{print "Device: " device "  IP: " $2}' # shows all devices with ip's
	echo "---------------------------------------------------"
	sparkbars
}
# Find IP used to route to outside world

alias IPv4dev=$(ip route get 8.8.8.8 | awk '{for(i=1;i<=NF;i++)if($i~/dev/)print $(i+1)}')
alias IPv4addr=$(ip route get 8.8.8.8| awk '{print $7}')
alias IPv4gw=$(ip route get 8.8.8.8 | awk '{print $3}')
alias availableInterfaces=$(ip -o link | grep "state UP" | awk '{print $2}' | cut -d':' -f1 | cut -d'@' -f1)
alias dhcpcdFile=/etc/dhcpcd.conf

setClientDNS() {
    DNSChoseCmd=(whiptail --separate-output --radiolist "Select the DNS Provider for your VPN Clients. To use your own, select Custom." ${r} ${c} 6)
    DNSChooseOptions=(Google "" on
            OpenDNS "" off
            Level3 "" off
            DNS.WATCH "" off
            Norton "" off
            Custom "" off)

    if DNSchoices=$("${DNSChoseCmd[@]}" "${DNSChooseOptions[@]}" 2>&1 >/dev/tty)
    then
        case ${DNSchoices} in
        Google)
            echo "::: Using Google DNS servers."
            OVPNDNS1="8.8.8.8"
            OVPNDNS2="8.8.4.4"
            # These are already in the file
            ;;
        OpenDNS)
            echo "::: Using OpenDNS servers."
            OVPNDNS1="208.67.222.222"
            OVPNDNS2="208.67.220.220"
            $SUDO sed -i '0,/\(dhcp-option DNS \)/ s/\(dhcp-option DNS \).*/\1'${OVPNDNS1}'\"/' /etc/openvpn/server.conf
            $SUDO sed -i '0,/\(dhcp-option DNS \)/! s/\(dhcp-option DNS \).*/\1'${OVPNDNS2}'\"/' /etc/openvpn/server.conf
            ;;
        Level3)
            echo "::: Using Level3 servers."
            OVPNDNS1="209.244.0.3"
            OVPNDNS2="209.244.0.4"
            $SUDO sed -i '0,/\(dhcp-option DNS \)/ s/\(dhcp-option DNS \).*/\1'${OVPNDNS1}'\"/' /etc/openvpn/server.conf
            $SUDO sed -i '0,/\(dhcp-option DNS \)/! s/\(dhcp-option DNS \).*/\1'${OVPNDNS2}'\"/' /etc/openvpn/server.conf
            ;;
        DNS.WATCH)
            echo "::: Using DNS.WATCH servers."
            OVPNDNS1="84.200.69.80"
            OVPNDNS2="84.200.70.40"
            $SUDO sed -i '0,/\(dhcp-option DNS \)/ s/\(dhcp-option DNS \).*/\1'${OVPNDNS1}'\"/' /etc/openvpn/server.conf
            $SUDO sed -i '0,/\(dhcp-option DNS \)/! s/\(dhcp-option DNS \).*/\1'${OVPNDNS2}'\"/' /etc/openvpn/server.conf
            ;;
        Norton)
            echo "::: Using Norton ConnectSafe servers."
            OVPNDNS1="199.85.126.10"
            OVPNDNS2="199.85.127.10"
            $SUDO sed -i '0,/\(dhcp-option DNS \)/ s/\(dhcp-option DNS \).*/\1'${OVPNDNS1}'\"/' /etc/openvpn/server.conf
            $SUDO sed -i '0,/\(dhcp-option DNS \)/! s/\(dhcp-option DNS \).*/\1'${OVPNDNS2}'\"/' /etc/openvpn/server.conf
            ;;
        Custom)
            until [[ $DNSSettingsCorrect = True ]]
            do
                strInvalid="Invalid"

                if OVPNDNS=$(whiptail --backtitle "Specify Upstream DNS Provider(s)"  --inputbox "Enter your desired upstream DNS provider(s), seperated by a comma.\n\nFor example '8.8.8.8, 8.8.4.4'" ${r} ${c} "" 3>&1 1>&2 2>&3)
                then
                    OVPNDNS1=$(echo "$OVPNDNS" | sed 's/[, \t]\+/,/g' | awk -F, '{print$1}')
                    OVPNDNS2=$(echo "$OVPNDNS" | sed 's/[, \t]\+/,/g' | awk -F, '{print$2}')
                    if ! valid_ip "$OVPNDNS1" || [ ! "$OVPNDNS1" ]; then
                        OVPNDNS1=$strInvalid
                    fi
                    if ! valid_ip "$OVPNDNS2" && [ "$OVPNDNS2" ]; then
                        OVPNDNS2=$strInvalid
                    fi
                else
                    echo "::: Cancel selected, exiting...."
                    exit 1
                fi
                if [[ $OVPNDNS1 == "$strInvalid" ]] || [[ $OVPNDNS2 == "$strInvalid" ]]; then
                    whiptail --msgbox --backtitle "Invalid IP" --title "Invalid IP" "One or both entered IP addresses were invalid. Please try again.\n\n    DNS Server 1:   $OVPNDNS1\n    DNS Server 2:   $OVPNDNS2" ${r} ${c}
                    if [[ $OVPNDNS1 == "$strInvalid" ]]; then
                        OVPNDNS1=""
                    fi
                    if [[ $OVPNDNS2 == "$strInvalid" ]]; then
                        OVPNDNS2=""
                    fi
                    DNSSettingsCorrect=False
                else
                    if (whiptail --backtitle "Specify Upstream DNS Provider(s)" --title "Upstream DNS Provider(s)" --yesno "Are these settings correct?\n    DNS Server 1:   $OVPNDNS1\n    DNS Server 2:   $OVPNDNS2" ${r} ${c}) then
                        DNSSettingsCorrect=True
                        $SUDO sed -i '0,/\(dhcp-option DNS \)/ s/\(dhcp-option DNS \).*/\1'${OVPNDNS1}'\"/' /etc/openvpn/server.conf
                        if [ -z ${OVPNDNS2} ]; then
                            $SUDO sed -i '/\(dhcp-option DNS \)/{n;N;d}' /etc/openvpn/server.conf
                        else
                            $SUDO sed -i '0,/\(dhcp-option DNS \)/! s/\(dhcp-option DNS \).*/\1'${OVPNDNS2}'\"/' /etc/openvpn/server.conf
                        fi
                    else
                        # If the settings are wrong, the loop continues
                        DNSSettingsCorrect=False
                    fi
                fi
        done
        ;;
    esac
    else
        echo "::: Cancel selected. Exiting..."
        exit 1
    fi
}

# View Apache logs
apachelog() {
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
	else
		cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
	fi
}

# Edit the Apache configuration
apacheconfig() {
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		sedit /etc/httpd/conf/httpd.conf
	elif [ -f /etc/apache2/apache2.conf ]; then
		sedit /etc/apache2/apache2.conf
	else
		echo "Error: Apache config file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate httpd.conf && locate apache2.conf
	fi
}

# Edit the PHP configuration file
phpconfig() {
	if [ -f /etc/php.ini ]; then
		sedit /etc/php.ini
	elif [ -f /etc/php/php.ini ]; then
		sedit /etc/php/php.ini
	elif [ -f /etc/php5/php.ini ]; then
		sedit /etc/php5/php.ini
	elif [ -f /usr/bin/php5/bin/php.ini ]; then
		sedit /usr/bin/php5/bin/php.ini
	elif [ -f /etc/php5/apache2/php.ini ]; then
		sedit /etc/php5/apache2/php.ini
	else
		echo "Error: php.ini file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate php.ini
	fi
}

# Edit the MySQL configuration file
mysqlconfig() {
	if [ -f /etc/my.cnf ]; then
		sedit /etc/my.cnf
	elif [ -f /etc/mysql/my.cnf ]; then
		sedit /etc/mysql/my.cnf
	elif [ -f /usr/local/etc/my.cnf ]; then
		sedit /usr/local/etc/my.cnf
	elif [ -f /usr/bin/mysql/my.cnf ]; then
		sedit /usr/bin/mysql/my.cnf
	elif [ -f ~/my.cnf ]; then
		sedit ~/my.cnf
	elif [ -f ~/.my.cnf ]; then
		sedit ~/.my.cnf
	else
		echo "Error: my.cnf file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate my.cnf
	fi
}


# Trim leading and trailing spaces (for scripts)
trim() {
	local var=$*
	var="${var#"${var%%[![:space:]]*}"}" # remove leading whitespace characters
	var="${var%"${var##*[![:space:]]}"}" # remove trailing whitespace characters
	echo -n "$var"
}
# GitHub Titus Additions

gcom() {
	git add .
	git commit -m "$1"
}
lazyg() {
	git add .
	git commit -m "$1"
	git push
}

function hb {
    if [ $# -eq 0 ]; then
        echo "No file path specified."
        return
    elif [ ! -f "$1" ]; then
        echo "File path does not exist."
        return
    fi

    uri="http://bin.christitus.com/documents"
    response=$(curl -s -X POST -d @"$1" "$uri")
    if [ $? -eq 0 ]; then
        hasteKey=$(echo $response | jq -r '.key')
        echo "http://bin.christitus.com/$hasteKey"
    else
        echo "Failed to upload the document."
    fi
}
# Check if a command or alias exists
function cmd-exists() {
	# If no arguments or just '--strict' is provided, show help message
	if [[ -z "${1}" || (${#} -eq 1 && "${1}" == "--strict") ]]; then
		echo -e "${BRIGHT_WHITE}cmd-exists:${RESET} Checks if a command or alias exists"
		echo -e "${BRIGHT_WHITE}Options:${RESET}"
		echo -e "  ${BRIGHT_YELLOW}--strict${RESET} or ${BRIGHT_YELLOW}-s${RESET} checks for executable commands only ${BRIGHT_RED}excluding aliases${RESET}"
		echo -e "${BRIGHT_WHITE}Usage examples:${RESET}"
		echo -e "  Check any command or alias:"
		echo -e "    ${BRIGHT_GREEN}cmd-exists ${BRIGHT_YELLOW}ls${RESET}"
		echo -e "  Check executable only ${BRIGHT_RED}(strict mode)${RESET}:"
		echo -e "    ${BRIGHT_GREEN}cmd-exists ${BRIGHT_YELLOW}--strict ${BRIGHT_YELLOW}grep${RESET}"
		echo -e "  Display this help message:"
		echo -e "    ${BRIGHT_GREEN}cmd-exists${RESET}"
		return 2  # Return code 2 to indicate incorrect usage
	fi

	# Check for the '--strict' option
	if [[ "${1}" == "--strict" ]] || [[ "${1}" == "-s" ]]; then
		# Look for executable command
		if [[ -x "$(\command -v ${2})" ]]; then
			return 0  # Command exists
		else
			return 1  # Command doesn't exist
		fi
	else
		# Look for command or alias
		if [[ -n "$(\command -v ${1})" ]]; then
			return 0  # Command or alias exists
		else
			return 1  # Command or alias doesn't exist
		fi
	fi
}

# Loop a list of common editors and check if installed
_EDITORS=("nano" "micro" "ne" "helix" "tilde" "nvim" "vim" "emacs" "vi" "ed")
for EDITOR in "${_EDITORS[@]}"; do
	if cmd-exists $EDITOR &>/dev/null; then

		# Default text editor for various command-line utilities
		# (fallback if VISUAL is not set)
		export EDITOR

		# Default text editor for visual (full-screen) utilities
		# (takes precedence over EDITOR)
		export VISUAL=$EDITOR

		# Specifies the editor to use with 'sudo -e' or 'sudoedit'
		# (overrides VISUAL and EDITOR)
		export SUDO_EDITOR=$EDITOR

		# Specifies the editor for 'fc' command to edit and re-run
		# commands from history (falls back to EDITOR)
		export FCEDIT=$EDITOR

		# Specifies a fallback editor for Emacs and its derivatives
		# (Used when Emacs cannot start the primary editor defined by EDITOR)
		export ALTERNATE_EDITOR=$EDITOR

		# nnn default action for opening a file
		# https://github.com/jarun/nnn
		export NNN_OPENER=$EDITOR

		# Exit the loop when the first installed editor is found
		break
	fi
done
unset _EDITORS

# Set some defaults for nano
# NOTE: Depending on the version of nano you have, --linenumbers and --suspend is helpful
if cmd-exists --strict nano; then
	alias {n,nano}='nano --smarthome --multibuffer --const --autoindent --linenumbers'
fi
#######################################################
# Add Common Binary Directories to Path
#######################################################

# Add directories to the end of the path if they exists and are not already in the path
# Link: https://superuser.com/questions/39751/add-directory-to-path-if-its-not-already-there
function pathappend() {
	for ARG in "$@"
	do
		if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
			PATH="${PATH:+"$PATH:"}$ARG"
		fi
	done
}

# Add directories to the beginning of the path if they exist and are not already in the path
function pathprepend() {
	for ((i=$#; i>0; i--));
	do
		ARG=${!i}
		if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
			PATH="$ARG${PATH:+":$PATH"}"
		fi
	done
}

# Add the most common personal binary paths located inside the home folder
# (these directories are only added if they exist)
pathprepend "$HOME/bin" "$HOME/sbin" "$HOME/.local/bin" "$HOME/local/bin" "$HOME/.bin"

# Check for the Rust package manager binary install location
# Link: https://doc.rust-lang.org/cargo/index.html
pathappend "$HOME/.cargo/bin" "/root/.cargo/bin"

# If the GOPATH environment variable is not set, set it to the default
if cmd-exists --strict go && [[ -z ${GOPATH+x} ]] && [[ -d $HOME/go ]]; then
	export GOPATH="$HOME/go"
fi

#######################################################
# Bashrc Support
#######################################################

# Alias to edit and reload  this .bashrc file
alias {ebrc,editbashrc}='edit ~/.bashrc'
alias {rbrc,reloadbashrc}='\clear; \source ~/.bashrc'
alias rbrc='clear; source ~/.bashrc'
alias reloadbashrc='clear; source ~/.bashrc'
# Find the help file for this .bashrc file (type hlp or press CONTROL-H)
if [[ -f "$HOME/.config/bashrc/help" ]]; then
	_BASHRC_HELP="$HOME/.config/bashrc/help"
	if [[ $_SKIP_HELP_KEYBIND = false ]]; then
		bind -x '"\C-h":"less -f -r -n -S ~/.config/bashrc/help"'
	fi
elif [[ -f "$HOME/.bashrc_help" ]]; then
	_BASHRC_HELP="$HOME/.bashrc_help"
	if [[ $_SKIP_HELP_KEYBIND = false ]]; then
		bind -x '"\C-h":"less -f -r -n -S ~/.bashrc_help"'
	fi
fi

# Alias to edit the global bashrc if it exists using the same aliases upper case
if [[ -f "/etc/bash.bashrc" ]]; then
	alias {EBRC,EDITBASHRC}='sudoedit /etc/bash.bashrc'
fi

# Alias to show the help file
alias hlp='\less -f -r -n -S "$_BASHRC_HELP"'
#######################################################
# General Aliases
# NOTE: To temporarily bypass an alias, we proceed the command with a \
# EG: if the ls command is aliased, to use the normal command you would type \ls
#######################################################

# Show a list of available aliases and functions with optional filtering
function a() {
	# Store the first argument as a filter.
	local FILTER="${1}"

	# Function to list aliases.
	function list_aliases() {
		# Print the heading for aliases in bright red.
		echo -e "${BRIGHT_RED}Aliases:${RESET}"

		# If filter is provided, list aliases and apply the filter.
		alias | awk -F'[ =]' '{print "\033[33m"$2"\033[0m\t\033[34m"$0"\033[0m";}' | grep -E "${FILTER}"
	}

	# Function to list functions.
	function list_functions() {
		# Print the heading for functions in bright red.
		echo -e "${BRIGHT_RED}Functions:${RESET}"

		# If filter is provided, list functions and apply the filter.
		compgen -A function | grep -v '^_.*' | grep -E "${FILTER}"
	}

	# Combine the output of list_aliases and list_functions and pass to less.
	# The output is piped into less with several options for improved viewing.
	{ list_aliases; echo; list_functions; } | \less --line-numbers --no-init
}

#######################################################
### DIRECTORY ALIASES
#######################################################

declare -A ALIASES=(
	["autostart"]="$HOME/.config/autostart"
	["bashrc"]="$HOME"
	["bashrc"]="$HOME/.config/bashrc"
	["bin"]="$HOME/.local/bin"
	["BIN"]="/usr/bin"
	["config"]="$HOME/.config"
	["CONFIG"]="/etc"
	["desktop"]="$HOME/Desktop"
	["docs"]="$HOME/Documents"
	["DOCS"]="/usr/local/man"
	["DOCS"]="/usr/local/share/man"
	["DOCS"]="/usr/share/man"
	["downloads"]="$HOME/Downloads"
	["fonts"]="$HOME/.local/share/fonts"
	["fonts"]="$HOME/.fonts"
	["FONTS"]="/usr/share/fonts"
	["icons"]="$HOME/.local/share/icons"
	["icons"]="$HOME/.icons"
	["ICONS"]="/usr/share/icons"
	["music"]="$HOME/Music"
	["pics"]="$HOME/Pictures"
	["share"]="$HOME/.local/share"
	["SHARE"]="/usr/share"
	["themes"]="$HOME/.local/share/themes"
	["THEMES"]="/usr/share/themes"
	["tmp"]="~/tmp"
	["tmp"]="~/.cache/tmp"
	["tmp"]="~/.cache"
	["TMP"]="${TMPDIR:-/tmp}"
	["videos"]="$HOME/Videos"
	["wallpaper"]="$HOME/.local/share/wallpapers"
	["WALLPAPER"]="/usr/share/backgrounds"
	["WALLPAPER"]="/usr/share/wallpapers"
)

# Loop through the associative array and create aliases for existing directories
for ALIAS in "${!ALIASES[@]}"; do
	[ -d "${ALIASES[$ALIAS]}" ] && alias "$ALIAS"="cd \"${ALIASES[$ALIAS]}\""
done

# Clean up
unset ALIAS
unset ALIASES
#######################################################
### SYSTEMD ALIASES
#######################################################

if cmd-exists --strict systemctl; then
	# Get a list of all services
	alias services='systemctl list-units --type=service --state=running,failed'
	alias servicesall='systemctl list-units --type=service'

	# Find what systemd services have failed
	alias {failed,servicefailed}='systemctl --failed'

	# Get the status of a services
	alias servicestatus='sudo systemctl status'

	# Start a service and enable automatic startup at boot
	alias serviceenable='sudo systemctl enable --now'

	# Start a service
	alias servicestart='sudo systemctl start'

	# Stop a service
	alias servicestop='sudo systemctl stop'

	# Forcefully terminate a service
	alias servicekill='sudo systemctl kill'

	# Stop and restart a service
	alias servicerestart='sudo systemctl restart'

	# Reload a service's configuration (soft restart)
	alias servicereload='sudo systemctl reload'

	# Clear system log entries from the systemd journal
	alias clearsystemlogs='echo -ne "${BRIGHT_BLUE}Before${RESET}: "; journalctl --disk-usage; sudo journalctl --rotate; sudo journalctl --vacuum-time=1s; echo -ne "${BRIGHT_BLUE}After${RESET}: "; journalctl --disk-usage'

	# If SSH is installed...
	if cmd-exists --strict ssh; then
		# Create aliases to start/enable and stop/disable the SSH server
		alias sshstatus='systemctl status sshd.service'
		alias sshstart='sudo systemctl start sshd.service && sudo systemctl enable sshd.service'
		alias sshstop='sudo systemctl stop sshd.service && sudo systemctl disable sshd.service'
		alias sshrestart='sudo systemctl restart sshd.service && sudo systemctl enable sshd.service'
	fi

	# If gpm is installed...
	# Link: https://github.com/telmich/gpm
	if cmd-exists --strict gpm; then
		alias ttymouseon='sudo systemctl enable --now gpm'
		alias ttymouseoff='sudo systemctl stop gpm && sudo systemctl disable gpm'
		alias ttymousestatus='sudo systemctl status gpm'
	fi

	# Flushing and restart the DNS cache if installed and running
	function flushdns() {
		# Check if systemd-resolved is available
		if cmd-exists --strict systemd-resolve; then
			# Check if systemd-resolved service is active
			if systemctl is-active systemd-resolved >/dev/null; then
				# Flush DNS cache and restart systemd-resolved
				sudo systemd-resolve --flush-caches
				sudo systemctl restart systemd-resolved
				echo "DNS cache flushed and systemd-resolved restarted"
			else
				echo "systemd-resolved is not active, unable to flush DNS cache"
			fi
		# Check if dnsmasq is available
		elif cmd-exists --strict dnsmasq; then
			# Check if dnsmasq process is running
			if pgrep -x "dnsmasq" >/dev/null; then
				# Restart dnsmasq to flush DNS cache
				sudo systemctl restart dnsmasq
				echo "DNS cache flushed and dnsmasq restarted"
			else
				echo "dnsmasq is not running, unable to flush DNS cache"
			fi
		else
			echo "No supported DNS caching service found"
		fi
	}
fi
# Stop pinging after sending 5 ECHO_REQUEST packets
alias ping='ping -c 5'
# If nmap is installed, set an alias for a network scan of a host (takes a while)
# Scan delay slows things down but reduces throttling, anti-ddos, auto-block
# Link: https://nmap.org/
# Example: netscan localhost
if cmd-exists nmap; then
	alias netscan='sudo nmap --scan-delay 1.1s -v --resolve-all -A -sTUV'
fi
# Get local IP addresses
if cmd-exists --strict ip; then
	alias iplocal="ip -br -c a"
else
	alias iplocal="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"
fi

# Get public IP address (several options below)
#alias ipexternal='wget -O - -q icanhazip.com && echo'
# alias ipexternal='wget -qO- ifconfig.me/ip && echo'
 alias ipexternal='curl ipinfo.io/ip && echo'

#######################################################
### MISCELLANEOUS
#######################################################

# Alias to show the current TTY (CTRL+ALT+1 through 7)
alias whichtty='tty | sed -e "s:/dev/::"'

# Conditionally set alias for checking failed login attempts
if cmd-exists aureport; then
	# Use aureport to generate a report of failed authentication attempts
	alias check-login-failures='sudo \aureport -au --failed | \less'
elif cmd-exists lastb; then
	# If aureport is not available, check for the lastb command
	alias check-login-failures='sudo \lastb | \less'
else
	# If neither executable command is available, check for system log files
	if [[ -f /var/log/auth.log ]]; then
		# Use grep to search for 'FAILED LOGIN' entries in auth.log
		alias check-login-failures="sudo \grep 'FAILED LOGIN' /var/log/auth.log | \less"
	elif [[ -f /var/log/secure ]]; then
		# Use grep to search for 'FAILED LOGIN' entries in secure
		alias check-login-failures="sudo \grep 'FAILED LOGIN' /var/log/secure | \less"
	else
		# Provide feedback if no methods are available for checking login failures
		echo "Error: No common methods or logs found for checking login failures"
	fi
fi
# Update the fireware on Linux automatically and safely using fwupdmgr
# (used by companies like Corsair, Dell, HP, Intel, Logitech, etc.)
# Install: pkginstall fwupdmgr
# Link: https://fwupd.org
if cmd-exists --strict fwupdmgr; then
	alias firmwareupdate='fwupdmgr get-devices && fwupdmgr refresh && fwupdmgr get-updates && fwupdmgr update'
fi
# Check for the availability of web browsers
# Link: https://www.geeksforgeeks.org/using-lynx-to-browse-the-web-from-the-linux-terminal/
# Link: https://wiki.archlinux.org/title/ELinks
# Link: https://w3m.sourceforge.net/
# Link: http://www.aboutlinux.info/2007/02/links2-cross-platform-console-based-web.html
# Link: https://www.tecmint.com/command-line-web-browsers/
for TERMINAL_BROWSER in "w3m" "lynx" "elinks" "links2" "links"; do
	if cmd-exists "${TERMINAL_BROWSER}"; then
		# Show the Extreme Ultimate .bashrc README file in the available browser
		if [[ -f "${HOME}/.config/bashrc/README.html" ]]; then
			alias readme="${TERMINAL_BROWSER} ~/.config/bashrc/README.html"
			break  # Exit the loop once the first available browser is found
		elif [[ -f "${HOME}/README.html" ]]; then
			alias readme="${TERMINAL_BROWSER} ~/README.html"
			break  # Exit the loop once the first available browser is found
		fi
	fi
done
# If the readme alias is still not set, try markdown readers
if [[ $(type -t readme) != 'alias' ]]; then
	# Check for the availability of markdown viewers
	# Link: https://github.com/Textualize/frogmouth
	# Link: https://github.com/charmbracelet/glow
	# Link: https://github.com/swsnr/mdcat
	# Link: https://github.com/ttscoff/mdless
	for TERMINAL_MARKDOWN_VIEWER in "frogmouth" "glow" "mdcat" "mdless"; do
		if cmd-exists "${TERMINAL_MARKDOWN_VIEWER}"; then
			# If README.md exists in .config/bashrc, set 'readme' alias
			if [[ -f "${HOME}/.config/bashrc/README.md" ]]; then
				alias readme="${TERMINAL_MARKDOWN_VIEWER} ~/.config/bashrc/README.md"
				break  # Exit the loop once the first available browser is found
			# If README.md exists in home, set 'readme' alias
			elif [[ -f "${HOME}/README.md" ]]; then
				alias readme="${TERMINAL_MARKDOWN_VIEWER} ~/README.md"
				break  # Exit the loop once the first available browser is found
			fi
		fi
	done
fi

# If glow is installed, set up some aliases for it
# Link: https://github.com/charmbracelet/glow
if cmd-exists glow; then
	# Use glow's pager option
	alias glow='glow --all --pager'

	# Local only version for security
	alias glowsafe='glow --all --pager --local'
fi

# If mdcat is installed, use pagination
# Link: https://github.com/swsnr/mdcat
if cmd-exists mdcat; then
	alias mdcat='mdcat --paginate'
fi

# fx is a JavaScript Object Notation (JSON) viewer
# Link: https://github.com/antonmedv/fx
if cmd-exists --strict fx; then
	alias json='fx'

# jless is a command-line JSON viewer
# Link: https://jless.io/
elif cmd-exists --strict jless; then
	alias json='jless'

# jq - Pretty Print JSON Files in the terminal
# Link: https://itsfoss.com/pretty-print-json-linux/
elif cmd-exists --strict jq; then
	alias json='jq'
fi

# baca TUI ebook reader
# Link: https://github.com/wustho/baca
# Install: pip install baca
if cmd-exists --strict baca; then
	alias ebook=baca
fi

#######################################################
# Easy Cross-Platform Package Management Aliases
#######################################################

# Depending on the installed package managers, set up some package aliases
if cmd-exists --strict paru; then # Arch
	# Link: https://github.com/Morganamilo/paru
	# Link: https://itsfoss.com/paru-aur-helper/
	# NOTE: To get search results to start at the bottom and go upwards, enable BottomUp in paru.conf
	alias has='paru -Si'
	alias pkgupdateall='paru -Syyu --sudoloop --noconfirm --newsonupgrade && if type flatpak >/dev/null 2>&1; then sudo flatpak update --assumeyes --noninteractive; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='paru --sync --sudoloop --noconfirm'
	alias pkginstall='paru --sync --sudoloop --noconfirm'
	alias pkgremove='paru --remove'
	alias pkgclean='paru --clean'
	alias pkgsearch='paru --bottomup'
	alias pkglist='paru -Qe'
	alias pkglistmore='paru -Q' # Also includes dependencies
elif cmd-exists --strict yay; then # Arch
	# Link: https://github.com/Jguer/yay
	alias has='yay -Si'
	alias pkgupdateall='yay -Syyu --sudoloop && if type flatpak >/dev/null 2>&1; then sudo flatpak update; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='yay -S'
	alias pkginstall='yay -S'
	alias pkgremove='yay -Rns'
	alias pkgclean='yay -Yc'
	alias pkgsearch='yay'
	alias pkglist='yay -Qe'
	alias pkglistmore='yay -Q' # Also includes dependencies
elif cmd-exists --strict pamac; then    # Manjaro
	# Link: https://wiki.manjaro.org/index.php/Pamac
	alias has='sudo pamac info'
	alias pkgupdateall='sudo pamac upgrade -a && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo pamac update'
	alias pkginstall='sudo pamac install'
	alias pkgremove='sudo pamac remove'
	alias pkgclean='sudo pamac remove --orphans'
	alias pkgsearch='sudo pamac search -a'
	alias pkglist='pacman -Qe'
	alias pkglistmore='pacman -Q' # Also includes dependencies
elif cmd-exists --strict pacman && [[ -n $(uname -r | grep arch) ]]; then # Arch (No AUR)
	# Link: https://archlinux.org/pacman/
	alias has='pacman -Q --info'
	alias pkgupdateall='sudo pacman -Syyu && if type flatpak >/dev/null 2>&1; then sudo flatpak update; fi && if type snap >/dev/null 2>&1; then sudo snap refresh; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo pacman -S'
	alias pkginstall='sudo pacman -S'
	alias pkgremove='sudo pacman -Rns'
	alias pkgclean='pacman -Qtdq | sudo pacman -Rns -'
	alias pkgsearch='pacman -Ss'
	alias pkglist='pacman -Qe'
	alias pkglistmore='pacman -Q' # Also includes dependencies
elif cmd-exists --strict dnf; then # RedHat/Fedora
	# Link: https://fedoraproject.org/wiki/DNF
	alias has='dnf info'
	alias pkgupdateall='sudo dnf upgrade --refresh'
	alias pkgupdate='sudo dnf upgrade'
	alias pkginstall='sudo dnf install'
	alias pkgremove='sudo dnf remove'
	alias pkgclean='sudo dnf autoremove'
	alias pkgsearch='sudo dnf search'
	alias pkglist='dnf list installed'
	alias pkgdependencies='yum whatprovides'
elif cmd-exists --strict yum; then # RedHat/Fedora
	# Link: https://access.redhat.com/articles/yum-cheat-sheet
	alias has='yum info'
	alias pkgupdateall='sudo yum clean all && yum -y update'
	alias pkgupdate='sudo yum update'
	alias pkginstall='sudo yum install'
	alias pkgremove='sudo yum remove'
	alias pkgclean='sudo yum autoremove'
	alias pkgsearch='sudo yum search'
	alias pkglist='yum list installed'
	alias pkgdependencies='yum whatprovides'
elif cmd-exists --strict nala; then # Debian/Ubuntu/Raspbian
	# Link: https://gitlab.com/volian/nala
	# Link: https://itsfoss.com/nala/
	alias has='nala show'
	alias pkgupdateall='sudo nala update && sudo nala upgrade && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi'
	alias pkgupdate='sudo nala update'
	alias pkginstall='sudo nala install --install-suggests'
	alias pkgremove='sudo nala remove'
	alias pkgclean='sudo nala clean --fix-broken'
	alias pkgsearch='sudo nala search'
	alias pkglist='sudo nala list --installed'
	alias pkgmirrors='sudo nala fetch'
elif cmd-exists --strict apt; then # Debian/Ubuntu/Raspbian
	# Link: https://itsfoss.com/apt-command-guide/
	alias has='apt show'
	alias pkgupdateall='sudo apt update --assume-yes && sudo apt upgrade --assume-yes && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo apt-get install --only-upgrade'
	alias pkginstall='sudo apt install'
	alias pkgremove='sudo apt remove'
	alias pkgclean='sudo apt autoremove'
	alias pkgsearch='sudo apt search'
	alias pkglist='sudo apt list --installed'
	alias pkgcheck='sudo apt update --assume-yes && apt list --upgradable'
elif cmd-exists --strict apt-get; then # Debian/Ubuntu
	# Link: https://help.ubuntu.com/community/AptGet/Howto
	alias has='apt-cache show'
	alias pkgupdateall='sudo apt-get update && sudo apt-get upgrade && if type pacstall >/dev/null 2>&1; then pacstall --upgrade; fi && if type tldr >/dev/null 2>&1; then tldr --update; fi'
	alias pkgupdate='sudo apt-get install --only-upgrade'
	alias pkginstall='sudo apt-get install'
	alias pkgremove='sudo apt-get remove'
	alias pkgclean='sudo apt-get autoremove'
	alias pkgsearch='sudo apt-cache search'
	alias pkglist='sudo dpkg -l'
elif cmd-exists --strict zypper; then # SUSE
	# Link: https://en.opensuse.org/SDB:Zypper_usage
	alias has='zypper info'
	alias pkgupdateall='sudo zypper patch'
	alias pkgupdate='sudo zypper up'
	alias pkginstall='sudo zypper in'
	alias pkgremove='sudo zypper rm'
	alias pkgclean='sudo zypper packages --orphaned'
	alias pkgsearch='sudo zypper se'
	alias pkglist='zypper se --installed-only'
elif cmd-exists --strict eopkg; then # Solus
	# Link: https://getsol.us/articles/package-management/basics/en/
	alias has='sudo eopkg info'
	alias pkgupdateall='sudo eopkg upgrade'
	alias pkgupdate='sudo eopkg upgrade'
	alias pkginstall='sudo eopkg install'
	alias pkgremove='sudo eopkg remove'
	alias pkgsearch='sudo eopkg search'
	alias pkglist='eopkg li -l'
elif cmd-exists --strict emerge; then # Gentoo (Portage)
	# Link: https://www.linode.com/docs/guides/portage-package-manager/
	alias has='equery files'
	alias pkgupdateall='sudo emerge --sync && sudo emerge --update --deep --with-bdeps=y --newuse @world && sudo emerge --depclean && sudo revdep-rebuild'
	alias pkgupdate='sudo emerge -u'
	alias pkginstall='sudo emerge'
	alias pkgremove='sudo emerge --depclean'
	alias pkgsearch='sudo emerge --search'
	alias pkglist='equery list "*"'
elif cmd-exists --strict slackpkg; then # Slackware
	# Link: https://www.linux.com/training-tutorials/intro-slackware-package-management/
	alias has='slackpkg info'
	alias pkgupdateall='slackpkg update && slackpkg install-new && slackpkg upgrade-all'
	alias pkgupdate='upgradepkg'
	alias pkginstall='installpkg'
	alias pkgremove='removepkg'
	alias pkglist='pkgtool'
elif cmd-exists --strict urpmi; then # Mandrake
	# Link: https://wiki.mageia.org/en/URPMI
	alias has='urpmq --summary -Y'
	alias pkgupdateall='urpmi --auto-update'
	alias pkgupdate='urpmi'
	alias pkginstall='urpmi'
	alias pkgremove='urpme'
	alias pkgsearch='urpmq --summary -Y'
	alias pkglist='rpm -qa'
elif cmd-exists --strict apt-cyg; then # Cygwin
	# Link: http://stephenjungels.com/jungels.net/projects/apt-cyg/
	alias has='apt-cyg show'
	alias pkgupdateall='apt-cyg update'
	alias pkgupdate='apt-cyg update'
	alias pkginstall='apt-cyg install'
	alias pkgremove='apt-cyg remove'
	alias pkgsearch='apt-cyg find'
	alias pkglist='cygcheck --check-setup'
elif cmd-exists --strict brew; then # macOS
	# Link: https://brew.sh/
	alias has='brew info'
	alias pkgupdateall='brew update'
	alias pkgupdate='brew update'
	alias pkginstall='brew install'
	alias pkgremove='brew uninstall'
	alias pkgclean='brew cleanup'
	alias pkgsearch='brew search'
	alias pkglist='brew list'
fi

# If this is an Arch based distrobution with pacman...
if cmd-exists --strict pacman && [[ -d /etc/pacman.d/ ]]; then

	# Install a list of packages with regex
	# https://wiki.archlinux.org/title/pacman#Installing_specific_packages
	function pkginstallregex() {
		if [ $# -eq 0 ]; then
			echo "No regex provided"
			exit 1
		else
			sudo pacman -S $(pacman -Ssq "${@}")
		fi
	}

	# Clean the pacman and helper package caches
	alias pacman-clean-cache='yes | sudo pacman -Scc && command -v yay &> /dev/null && yes | yay -Sc || true && command -v paru &> /dev/null && yes | paru -Sc || true && echo'

	# To mark a package as explicitly installed or only a dependency
	alias pkgmarkasexplicit='sudo pacman -D --asexplicit'
	alias pkgmarkasdependency='sudo pacman -D --asdeps'

	# Show all packages and their install reason
	alias pkgreasons="pacman -Qi | awk -F': ' '/^Name/ { name = \$2; } /^Install Reason/ { reason = \$2; } /^$/ { printf \"%s: %s\\n\", name, reason; }'"

	# Check for default configuration file default backups
	alias pacnew='sudo true && echo "Pacman backup configuration files found:"; sudo find /etc -type f \( -iname \*.pacnew -o -iname \*.pacsave \) | sort -t"/" -k2.2r -k2.1'

	# Force remove a package ignoring required dependencies
	# NOTE: Also can be typed as sudo pacman -Rdd for short
	alias pkgforceremove='sudo pacman -Rd --nodeps'

	# Force remove a package ignoring required dependencies and then reinstall
	alias pkgforcereinstall='_PACKAGE_NAME=$1 && sudo pacman -Rd --nodeps $_PACKAGE_NAME && sudo pacman -S $_PACKAGE_NAME'

	# Search for a package containing a file
	alias pkgsearchcontainingfile='sudo pacman -Fy'

	# List all the local files in an installed package
	alias pkglocalpackagefiles='pacman -Ql'

	# Verify the presence of the files installed by a package
	alias pkgverifylocalpackage='sudo pacman -Qkk'

	# Verify all packages
	# Link: https://unix.stackexchange.com/questions/659756/arch-linux-reinstall-all-broken-packages-after-poweroff-during-system-upgrade
	alias pkgverifyall="pacman -Qk 2>/dev/null | grep -v ' 0 missing files'"

	# Show the latest Arch linux update news
	alias archnews='w3m https://www.archlinux.org/ | sed -n "/Latest News/,/Older News/p" | "${PAGER}"'

	# Pacseek - browse and search through the Arch Linux package databases and AUR
	# Link: https://github.com/moson-mo/pacseek
	if cmd-exists --strict pacseek; then
		alias pkg='pacseek'
	fi

	# If perl is installed (preset on most systems)...
	# Link: https://wiki.archlinux.org/title/Perl
	# Install: sudo pacman -S perl
	if cmd-exists --strict perl; then

		# Use a much more detailed package listing with descriptions (AUR separated)
		# pkglist [search] will search for all installed packages instead
		alias pkglist &>/dev/null && unalias pkglist
		function pkglist() {
			if [ $# -eq 0 ]; then
				# In order to make this accurate, lets get a basic list of all the main repositories (minus the AUR) to check against
				repo="$(pacman -Sl core | awk '/\[.*[[:alpha:]]+]$/ {print $2}')\n$(pacman -Sl extra | awk '/\[.*[[:alpha:]]+]$/ {print $2}')\n$(pacman -Sl community | awk '/\[.*[[:alpha:]]+]$/ {print $2}')\n$(pacman -Sl multilib | awk '/\[.*[[:alpha:]]+]$/ {print $2}')\n"

				# If it's in the repo list, it's not the AUR
				echo -e "${BRIGHT_BLUE}=============== ${BRIGHT_YELLOW}Native Arch Packages${BRIGHT_BLUE} ===============${RESET}"
				for line in "$(pacman -Qqe | while read line; do if [[ $repo =~ $line ]]; then echo "$line"; fi; done)"; do \pacman -Qi $(echo "$line") ; done | perl -pe 's/ +/ /gm' | perl -pe 's/^(Groups +: )(.*)/$1($2)/gm' | perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' | grep -A1 --color -P "^[^\s]+"

				# If it's not in the repo list, it is from the AUR or Chaotic-AUR (or a custom repository)
				echo -e "\n${BRIGHT_BLUE}=============== ${BRIGHT_YELLOW}Arch User Repository (AUR)${BRIGHT_BLUE} ===============${RESET}"
				for line in "$(pacman -Qqe | while read line; do if [[ ! $repo =~ $line ]]; then echo "$line"; fi; done)"; do \pacman -Qi $(echo "$line") ; done | perl -pe 's/ +/ /gm' | perl -pe 's/^(Groups +: )(.*)/$1($2)/gm' | perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' | grep -A1 --color -P "^[^\s]+"
			else
				# If a search parameter was specified, just grep the parameter and ignore which repo
				for line in "$(\pacman -Qqe)"; do \pacman -Qi $(echo "$line") ; done | perl -pe 's/ +/ /gm' | perl -pe 's/^(Groups +: )(.*)/$1($2)/gm' | perl -0777 -pe 's/^Name : (.*)\nVersion :(.*)\nDescription : ((?!None).*)?(?:.|\n)*?Groups :((?! \(None\)$)( )?.*)?(?:.|\n(?!Name))+/$1$4 - $3/gm' | grep -A1 --color -P "^[^\s]+" | grep "${@}"
			fi
		}
	fi

	# If pacman-contrib (contributed scripts and tools for pacman) is installed...
	# Install: sudo pacman -S pacman-contrib
	if cmd-exists --strict paccache; then

		# Add aliases to find dependencies
		alias pkgdependencies='pactree --color' # --unique --depth 1
		alias pkgwhatuses='pactree --reverse --color'

		# The checkupdates script (also from Arch pacman-contrib)
		# NOTE: The benefit to this is it does NOT need SUDO/ROOT access
		alias pkgcheck='checkupdates | sort | \less --no-init --ignore-case --LONG-PROMPT --LINE-NUMBERS'

		# Alias to fix Arch Pacman install error "invalid or corrupted package" with a
		# new PGP key, clear anything older than the last 3 installs, and remove locks
		# Link: https://odysee.com/@DistroTube:2/solved-pacman-wouldn't-let-me-run-an:0
		alias pacmanfix='sudo rm -f /var/lib/pacman/db.lck && sudo paccache -r && sudo pacman -Sy archlinux-keyring'
		alias pacmanfixkeys='sudo rm -f /var/lib/pacman/db.lck; sudo rm -R /etc/pacman.d/gnupg/; sudo rm -R /root/.gnupg/; sudo gpg --refresh-keys && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy archlinux-keyring'
	fi
fi

# If apt package manager is installed, add aliases to find dependencies in Ubuntu/Debian
if cmd-exists --strict apt-cache; then
	alias pkgdependencies='apt-cache depends'
	# If apt-rdepends is installed (sudo apt install apt-rdepends)
	if cmd-exists --strict apt-rdepends; then
		alias pkgwhatuses='apt-rdepends'
	fi
fi

# Aliases for flatpak packages if installed
if cmd-exists --strict flatpak; then
	alias flatpakhas='flatpak info'
	alias flatpakupdateall='sudo flatpak update'
	alias flatpakupdate='sudo flatpak update'
	alias flatpakinstall='sudo flatpak install'
	alias flatpakremove='sudo flatpak uninstall'
	alias flatpakwipe='sudo flatpak uninstall --delete-data'
	alias flatpakclean='sudo flatpak repair && sudo flatpak uninstall --unused'
	alias flatpaksearch='flatpak search'
	alias flatpaklist='flatpak list --columns=name,app:f,version:e,description:e --app'
	alias flatpaksize='flatpak list --columns=app:f,name,size:f,installation:e'
	alias flatpakremotes='flatpak remotes --show-details'

	# Create missing or recreate broken Flatpak icons (might require restart)
	if [ -d "/var/lib/flatpak/exports/share/applications/" ]; then
		alias flatpakmakeicons='\cp /var/lib/flatpak/exports/share/applications/*.desktop ~/.local/share/applications/'
	else
		alias flatpakmakeicons='find /var/lib/flatpak/app/ -type f -iname "*.desktop" -exec cp {} ~/.local/share/applications \;'
	fi

	# Make sure the Flatpak environment variable (for icons) is correct
	XDG_DATA_DIRS=$XDG_DATA_DIRS:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share
fi

# Aliases for snap packages if installed
if cmd-exists --strict snap; then
	alias snaphas='snap info'
	alias snapupdateall='sudo snap refresh --list'
	alias snapupdate='sudo snap refresh'
	alias snapinstall='sudo snap install'
	alias snapremove='sudo snap remove'
	alias snapclean='LANG=C snap list --all | while read snapname ver rev trk pub notes; do if [[ $notes = *disabled* ]]; then sudo snap remove "$snapname" --revision="$rev"; fi; done'
	alias snapsearch='snap find'
	alias snaplist='snap list'
	alias snapsize='du -hcs /var/lib/snapd/snaps/*'
fi
# Extracts any archive(s)
function extract() {
	# If no archive is specified or --help or -h is passed, show help text
	if [ -z "$1" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
		echo -e "${BRIGHT_WHITE}extract:${RESET} Extracts one or multiple archive files"
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}[archive_file1] [archive_file2] ...${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}'/path/to/file/example.tar.gz'${RESET}"
		echo -e "  ${BRIGHT_CYAN}extract${RESET} ${BRIGHT_YELLOW}example1.tar.gz example2.zip${RESET} ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}multiple files${BRIGHT_BLUE})${RESET}"
		return 1
	fi

	# Loop through each archive provided as an argument
	for archive in "$@"; do
		# Check if the file exists
		if [ -f "${archive}" ] ; then
			# Switch case to handle various archive types
			case "${archive}" in
				*.tar.bz2)  tar xvjf "${archive}"    ;;
				*.tar.gz)   tar xvzf "${archive}"    ;;
				*.bz2)      bunzip2 "${archive}"     ;;
				*.rar)      rar x "${archive}"       ;;
				*.gz)       gunzip "${archive}"      ;;
				*.tar)      tar xvf "${archive}"     ;;
				*.tbz2)     tar xvjf "${archive}"    ;;
				*.tgz)      tar xvzf "${archive}"    ;;
				*.zip)      unzip "${archive}"       ;;
				*.Z)        uncompress "${archive}"  ;;
				*.7z)       7z x "${archive}"        ;;
				*)          echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}Unknown archive type ${BRIGHT_YELLOW}${archive##*.}${RESET}" ;;
			esac
		else
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The file ${BRIGHT_YELLOW}${archive}${BRIGHT_CYAN} is not valid or does not exist${RESET}"
		fi
	done
}
# Generate a random password
# Pass the number of characters for the password on the command line
# Add the parameter +s to include symbols and -s to exclude them
# Example: genpw
# Example: genpw +s 24
# Example: genpw 8
# Example: genpw 12 -s
# HINT: Check passwords with cracklib: echo "1234abc" | cracklib-check
# Link: https://www.cyberciti.biz/security/linux-password-strength-checker/
function genpw() {
	local _PASSWORD_LENGTH
	local _PASSWORD_SYMBOLS

	if [[ ${1} -gt 0 ]]; then
		_PASSWORD_LENGTH=${1}
	elif [[ ${2} -gt 0 ]]; then
		_PASSWORD_LENGTH=${2}
	else
		read -e -i "16" -p "How many characters? " _PASSWORD_LENGTH
		if [[ ! ${_PASSWORD_LENGTH} -gt 0 ]]; then
			_PASSWORD_LENGTH=16
		fi
	fi

	if [[ ${1} == '-s' ]] || [[ ${2} == '-s' ]]; then
		_PASSWORD_SYMBOLS=false
	elif [[ ${1} == '+s' ]] || [[ ${2} == '+s' ]]; then
		_PASSWORD_SYMBOLS=true
	else
		if ask "Do you want to include symbols?" Y; then
			_PASSWORD_SYMBOLS=true
		fi
	fi

	if cmd-exists --strict apg; then
		if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
			apg -a 1 -n 10 -m ${_PASSWORD_LENGTH} -l
		else
			apg -a 0 -n 10 -m ${_PASSWORD_LENGTH} -l
		fi
	elif cmd-exists --strict pwgen; then
		if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
			pwgen --capitalize --numerals --symbols --secure -C ${_PASSWORD_LENGTH} 40
		else
			pwgen --capitalize --numerals --secure -C ${_PASSWORD_LENGTH} 40
		fi
	elif cmd-exists --strict gpg; then
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				gpg --gen-random 1 1024 | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				gpg --gen-random 1 1024 | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	elif cmd-exists --strict openssl; then
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				openssl rand 1024 | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				openssl rand 1024 | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	else
		for ((n=0;n<10;n++)); do
			if [[ ${_PASSWORD_SYMBOLS} == true ]]; then
				cat /dev/urandom | tr -dc a-zA-Z0-9'`~!@#$%^&*-_=+()[]{}|;:",.?<>/\\'"'" | head -c${_PASSWORD_LENGTH}; echo
			else
				cat /dev/urandom | tr -dc a-zA-Z0-9 | head -c${_PASSWORD_LENGTH}; echo
			fi
		done
	fi
}
# Send file(s) to the trash
# Link: https://www.tecmint.com/trash-cli-manage-linux-trash-from-command-line/
function trash() {
	# Check for the presence of arguments
	if [[ $# -eq 0 ]]; then
		echo -e "${BRIGHT_WHITE}trash:${RESET} Send files to the trash"
		echo -e "${BRIGHT_WHITE}Usage:${BRIGHT_CYAN} trash${RESET} ${BRIGHT_YELLOW}<filename1> [filename2] ...${RESET}"
		return 1
	fi

	# Check if trash-cli exists...
	# https://github.com/andreafrancia/trash-cli
	if cmd-exists --strict trash-put; then
		trash-put "${@}"
	# Check if rem exists...
	# Link: https://github.com/quackduck/rem
	elif cmd-exists --strict rem; then
		rem "${@}"
	# Check if gio trash exists (glib2)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
	elif cmd-exists --strict gio; then
		gio trash "${@}"
	# Check if kioclient5 exists (kde-cli-tools)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
	elif cmd-exists --strict kioclient5; then
		kioclient5 move "${@}" trash:/
	elif [[ -d $HOME/.local/share/Trash/files ]]; then
		mv "${@}" $HOME/.local/share/Trash/files/
	elif [[ -d $HOME/.local/share/trash/files ]]; then
		mv "${@}" $HOME/.local/share/trash/files/
	elif [[ -d $HOME/.Trash ]]; then
		mv "${@}" $HOME/.Trash/
	elif [[ -d $HOME/.trash ]]; then
		mv "${@}" $HOME/.trash/
	else
		mkdir $HOME/.trash
		mv "${@}" $HOME/.trash/
	fi
}

# Display the contents of the trash
function trashlist() {
	# Check if trash-cli exists...
	# https://github.com/andreafrancia/trash-cli
	if cmd-exists --strict trash-list; then
		trash-list
	# Check if rem exists...
	# Link: https://github.com/quackduck/rem
	elif cmd-exists --strict rem; then
		rem -l
	# Check if gio trash exists (glib2)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
	elif cmd-exists --strict gio; then
		gio list trash:///
	# Check if kioclient5 exists (kde-cli-tools)...
	# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
	elif cmd-exists --strict kioclient5; then
		kioclient5 ls trash:/
	# Check for alternative trash directories and list files
	elif [[ -d ${HOME}/.local/share/Trash/files ]]; then
		ls -l ${HOME}/.local/share/Trash/files/
	elif [[ -d ${HOME}/.local/share/trash/files ]]; then
		ls -l ${HOME}/.local/share/trash/files/
	elif [[ -d ${HOME}/.Trash ]]; then
		ls -l ${HOME}/.Trash/
	elif [[ -d ${HOME}/.trash ]]; then
		ls -l ${HOME}/.trash/
	else
		echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}No trash directory found${RESET}"
	fi
}

# Empty and permanently delete all the files in the trash
function trashempty() {
	# Ask for user confirmation before deleting trash
	if ask "${BRIGHT_WHITE}Are you sure you want to ${BRIGHT_MAGENTA}permanently delete${BRIGHT_WHITE} all the files in the trash? ${BRIGHT_RED}This action cannot be undone.${RESET}" "N"; then
		# Check if trash-cli exists...
		# https://github.com/andreafrancia/trash-cli
		if cmd-exists --strict trash-empty; then
			trash-empty
		# Check if rem exists...
		# Link: https://github.com/quackduck/rem
		elif cmd-exists --strict rem; then
			rem --empty
		# Check if gio trash exists (glib2)...
		# Link: https://wiki.archlinux.org/title/Trash-cli#gio_trash
		elif cmd-exists --strict gio; then
			gio trash --empty
		# Check if kioclient5 exists (kde-cli-tools)...
		# Link: https://wiki.archlinux.org/title/Trash-cli#kioclient5
		elif cmd-exists --strict kioclient5; then
			kioclient5 empty trash:/
		# Check for alternative trash directories and delete files
		elif [[ -d ${HOME}/.local/share/Trash/files ]]; then
			rm -rf ${HOME}/.local/share/Trash/files/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d ${HOME}/.local/share/trash/files ]]; then
			rm -rf ${HOME}/.local/share/trash/files/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d ${HOME}/.Trash ]]; then
			rm -rf ${HOME}/.Trash/{..?*,.[!.]*,*} 2>/dev/null
		elif [[ -d ${HOME}/.trash ]]; then
			rm -rf ${HOME}/.trash/{..?*,.[!.]*,*} 2>/dev/null
		else
			# No supported method found for emptying trash
			echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}No trash directory or supported application found${RESET}"
		fi
	else
		# Operation was cancelled by the user
		echo -e "${BRIGHT_RED}Operation cancelled.${RESET}"
	fi
}

# Restore the trash only is trash-cli is installed
# trash-cli - Command Line Interface to FreeDesktop.org Trash
# Link: https://github.com/andreafrancia/trash-cli
if cmd-exists --strict restore-trash; then
	alias trashrestore='restore-trash'
elif cmd-exists --strict trash-restore; then
	alias trashrestore='trash-restore'
fi
# Searches for filenames (can use wildcards)
alias findfile="f"
function f() {
	# Initialize the sudo prefix for running commands with elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# Check if any filename or pattern is specified; if not, show help text
	if [[ -z "$1" ]]; then
		echo -e "${BRIGHT_WHITE}findfile:${RESET} Searches for filenames recursively"
		echo -e "To use elevated permissions include the ${BRIGHT_YELLOW}--sudo${RESET} option"
		echo -e "${BRIGHT_WHITE}Usage:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_YELLOW}[file_name_pattern]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_YELLOW}'file.txt'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findfile${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'config'${RESET}  ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}using sudo${BRIGHT_BLUE})${RESET}"
		return 1  # Exit with a non-zero status
	fi

	# Use fdfind if installed, else use fd or find as fallback
	if cmd-exists --strict fdfind; then
		# fdfind command options
		# --type 'file' : Only search for files (not directories)
		# --ignore-case : Perform a case-insensitive search
		# --no-ignore   : Do not respect .gitignore and .ignore files
		# --hidden      : Include hidden files in the search results
		# --follow      : Follow symlinks (WARNING: can get into an endless loop)
		echo "${SUDO_PREFIX}fdfind --type 'file' --ignore-case --no-ignore --hidden '$1' ."
		${SUDO_PREFIX}fdfind --type 'file' --ignore-case --no-ignore --hidden "$1" .

	elif cmd-exists --strict fd; then
		echo "${SUDO_PREFIX}fd --type 'file' --ignore-case --no-ignore --hidden '$1' ."
		${SUDO_PREFIX}fd --type 'file' --ignore-case --no-ignore --hidden "$1" .

	else  # Use find command as a last resort
		# find command options
		# -type f : Search for files only, not directories
		# -iname  : Perform a case-insensitive search
		# -follow : Dereference symlinks (follow them to their targets)
		echo "${SUDO_PREFIX}find . -type f -iname '$1'"
		${SUDO_PREFIX}find . -type f -iname "$1"
	fi
}

# Searches for text in source code files located in the current path
# Supported languages: Ada, Assembly, AWK, Batch, C, COBOL, Config, C++,
# C#(CS), CSS, Dart, Emacs Lisp, Erlang, Elixir, Fortran(90, 95, older), Go,
# Groovy, Header(C, C++), HTML, Haxe, Include, INI, Arduino, Java, JavaScript,
# JSON, Kotlin, Library, Lua, M4, Objective-C, MATLAB, Makefiles, Nim, Nix,
# Pascal, PHP, Perl, Python, R, Ruby, Racket, Rust, Scala, SASS/SCSS, Shell,
# Standard ML, SQL, Swift, TCL, Templates, LaTeX, TypeScript, VB, VBA, VBS,
# VHDL, Wren, XML, YAML, Zig
function findcode() {
	# Local constant for maximum line length cut-off
	# NOTE: This is necessary for certain files like minified javascript
	local -r LINE_LENGTH_CUTOFF=1000

	# The prefix to prepend to search commands for elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# If no parameter is specified, show help text
	if [ -z "$1" ]; then
		echo -e "${BRIGHT_WHITE}findcode:${RESET} Searches for code text in source files recursively"
		echo -e "You can use both ${BRIGHT_YELLOW}plain text${RESET} and ${BRIGHT_YELLOW}regular expressions${RESET} for searching"
		echo -e "To use elevated permissions include the ${BRIGHT_YELLOW}--sudo${RESET} option"
		echo -e "${BRIGHT_WHITE}Usage:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_YELLOW}[search_text]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_YELLOW}'function_name'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_YELLOW}'console\.log\('${RESET} ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}using regex${BRIGHT_BLUE})${RESET}"
		echo -e "  ${BRIGHT_CYAN}findcode${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'todo'${RESET}    ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}using sudo${BRIGHT_BLUE})${RESET}"
		return 1
	fi

	# If ripgrep is installed, use that
	# Link: https://github.com/BurntSushi/ripgrep
	if cmd-exists --strict rg; then
		${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty "${@}" -g '!*.min.*' \
			-g '*.{ada,asm,awk,bat,c,cbl,conf,cpp,cpy,cs,css,dart,el,erl,ex,f90,f95,f,for,go,groovy,h,hpp,hrl,htm,html,hx,hxsl,inc,ini,ino,java,js,json,kt,lib,lua,m4,m,mat,mk,nim,nix,pascal,php,pl,plx,py,r,rb,rkt,rlib,rs,sc,scala,scss,sh,sml,sql,swift,tcl,template,tpl,tex,ts,vb,vba,vbs,vhd,vhdl,wren,xml,yaml,yml,zig}' | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# If The Silver Searcher is installed, use that
	# Link: https://github.com/ggreer/the_silver_searcher
	# Hint: You can use --ignore "dir/or/file"
	elif cmd-exists --strict ag; then
		${SUDO_PREFIX}ag --color             \
			--smart-case       \
			--hidden           \
			--literal          \
			--ignore "*.min.*" \
			--file-search-regex ".*\.(ada|asm|awk|bat|c|cbl|conf|cpp|cpy|cs|css|dart|el|erl|ex|f90|f95|f|for|go|groovy|h|hpp|hrl|htm|html|hx|hxsl|inc|ini|ino|java|js|json|kt|lib|lua|m4|m|mat|mk|nim|nix|pascal|php|pl|plx|py|r|rb|rkt|rlib|rs|sc|scala|scss|sh|sml|sql|swift|tcl|template|tpl|tex|ts|vb|vba|vbs|vhd|vhdl|wren|xml|yaml|yml|zig)" \
			"${@}"             \
			2> /dev/null       \
			| awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# Use grep (see findtext function for options explanation)
	# Hint: You can use --exclude='/dir/or/file'
	else
		${SUDO_PREFIX}grep --color=always --recursive --ignore-case --binary-files=without-match --with-filename --line-number \
			--include=*.ada \
			--include=*.asm \
			--include=*.awk \
			--include=*.bat \
			--include=*.c \
			--include=*.cbl \
			--include=*.conf \
			--include=*.cpp \
			--include=*.cpy \
			--include=*.cs \
			--include=*.css \
			--include=*.dart \
			--include=*.el \
			--include=*.erl \
			--include=*.ex \
			--include=*.f90 \
			--include=*.f95 \
			--include=*.f \
			--include=*.for \
			--include=*.go \
			--include=*.groovy \
			--include=*.h \
			--include=*.hpp \
			--include=*.hrl \
			--include=*.htm \
			--include=*.html \
			--include=*.hx \
			--include=*.hxsl \
			--include=*.inc \
			--include=*.ini \
			--include=*.ino \
			--include=*.java \
			--include=*.js \
			--include=*.json \
			--include=*.kt \
			--include=*.lib \
			--include=*.lua \
			--include=*.m4 \
			--include=*.m \
			--include=*.mat \
			--include=*.mk \
			--include=*.nim \
			--include=*.nix \
			--include=*.pascal \
			--include=*.php \
			--include=*.pl \
			--include=*.plx \
			--include=*.py \
			--include=*.r \
			--include=*.rb \
			--include=*.rkt \
			--include=*.rlib \
			--include=*.rs \
			--include=*.sc \
			--include=*.scala \
			--include=*.scss \
			--include=*.sh \
			--include=*.sml \
			--include=*.sql \
			--include=*.swift \
			--include=*.tcl \
			--include=*.template \
			--include=*.tpl \
			--include=*.tex \
			--include=*.ts \
			--include=*.vb \
			--include=*.vba \
			--include=*.vbs \
			--include=*.vhd \
			--include=*.vhdl \
			--include=*.wren \
			--include=*.xml \
			--include=*.yaml \
			--include=*.yml \
			--include=*.zig \
			--exclude='*.min.*' \
			"${@}" \
			| awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'
	fi
}

# Searches for text in all files in the current folder
function findtext() {
	# Local constant for maximum line length cut-off
	# NOTE: This is necessary for certain files like binaries
	local -r LINE_LENGTH_CUTOFF=1000

	# The prefix to prepend to search commands for elevated permissions
	local SUDO_PREFIX=""

	# Check for --sudo flag and remove it from arguments if present
	if [[ "$1" == "--sudo" ]]; then
		SUDO_PREFIX="sudo "
		shift
	fi

	# If no search text is specified, show help text
	if [ -z "$1" ]; then
		echo -e "${BRIGHT_WHITE}findtext:${RESET} Searches for text in all files recursively"
		echo -e "You can use both ${BRIGHT_YELLOW}plain text${RESET} and ${BRIGHT_YELLOW}regular expressions${RESET} for searching"
		echo -e "To use elevated permissions include the ${BRIGHT_YELLOW}--sudo${RESET} option"
		echo -e "${BRIGHT_WHITE}Usage:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_YELLOW}[search_text]${RESET}"
		echo -e "${BRIGHT_WHITE}Examples:${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_YELLOW}'example text'${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_YELLOW}'Hello\\s+world\\.'${RESET} ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}using regex${BRIGHT_BLUE})${RESET}"
		echo -e "  ${BRIGHT_CYAN}findtext${RESET} ${BRIGHT_GREEN}--sudo${RESET} ${BRIGHT_YELLOW}'todo'${RESET}     ${BRIGHT_BLUE}(${BRIGHT_MAGENTA}using sudo${BRIGHT_BLUE})${RESET}"
		return 1
	fi

	# If ripgrep is installed, use that
	# Link: https://github.com/BurntSushi/ripgrep
	if cmd-exists --strict rg; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}ripgrep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty '$@' ."
		${SUDO_PREFIX}rg --smart-case --no-ignore --hidden --pretty "$@" .  | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	# If The Silver Searcher is installed, use that
	# Link: https://github.com/ggreer/the_silver_searcher
	# Hint: You can use --ignore "dir/or/file"
	elif cmd-exists --strict ag; then
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}The Silver Searcher${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}ag --color --smart-case --hidden --literal '$@'"
		${SUDO_PREFIX}ag --color --smart-case --hidden --literal "$@" 2> /dev/null | \
			awk -v len=$LINE_LENGTH_CUTOFF '{ $0=substr($0, 1, len); print $0 }'

	else # Use grep
		# Link: https://www.howtogeek.com/496056/how-to-use-the-grep-command-on-linux/
		# Hint: You can use --exclude='/dir/or/file'
		# --ignore-case (-i)        : Makes the search case-insensitive
		# --binary-files=without-match (-I) : Ignores binary files
		# --with-filename (-H)      : Displays the filename along with the matching line
		# --recursive (-r)          : Searches through all subdirectories recursively
		# --line-number (-n)        : Adds the line number to the output
		# Optional:
		# --fixed-strings (-F)      : Treats the search term as a fixed string (not a regular expression)
		# --files-with-matches (-l) : Only outputs the filenames that contain a match (e.g., grep -irl "$@" *)
		echo -e "${BRIGHT_CYAN}Search using ${BRIGHT_YELLOW}grep${BRIGHT_CYAN}:${RESET}"
		echo "${SUDO_PREFIX}grep --color=always --recursive --ignore-case --binary-files=without-match --with-filename --line-number '$@'"
		${SUDO_PREFIX}grep \
			--color=always \
			--recursive \
			--ignore-case \
			--binary-files=without-match \
			--with-filename \
			--line-number \
			"${@}" \
		| awk -v len=${LINE_LENGTH_CUTOFF} '{ $0=substr($0, 1, len); print $0 }'
	fi
}
# Creates a menu for selecting an item from a list from either piped in
# multi-line text or command line arguments. Use --picker=app to force a picker
# Example: ls -1 ~ | createmenu
# Example: echo -e "Jen\nTom\nJoe Bob\nAmy\nPat" | sort | createmenu
# Example: cat "menuitems.txt" | createmenu
# Example: _TMUX_SESSION="$(tmux ls -F "#{session_name}" 2> /dev/null | createmenu)"
# Example: createmenu 'Option 1' 'Option 2' 'Option 3'
function createmenu() {
	# Valid pickers to detect and automatically used in order
	local _VALID_PICKERS="${_PREFERRED_PICKER} fzy sk fzf peco percol pick icepick selecta sentaku zf dmenu rofi wofi"

	# Check if command line arguments are provided and if input is piped in
	if [ "$#" -eq 0 ] && [ -t 0 ]; then
		echo -e "${BRIGHT_WHITE}createmenu:${RESET} Creates a menu for selecting an item from a list"
		echo -e "${BRIGHT_WHITE}It takes input from either piped in multi-line text or command line arguments${RESET}"
		echo -e "${BRIGHT_WHITE}Supported optional pickers are:${RESET}"
		echo -e "  ${BRIGHT_GREEN}fzy, sk (skim), fzf, peco, percol, pick, icepick, selecta, sentaku, zf, dmenu, rofi, wofi${RESET}"
		echo -e "${BRIGHT_WHITE}Usage examples:${RESET}"
		echo -e "  With piped input:"
		echo -e "    ${BRIGHT_YELLOW}ls${BRIGHT_CYAN} -1 ~ | ${BRIGHT_MAGENTA}createmenu${RESET}"
		echo -e "    ${BRIGHT_CYAN}echo -e ${BRIGHT_YELLOW}\"Jen\\\\nTom\\\\nJoe Bob\\\\nAmy\\\\nPat\"${BRIGHT_CYAN} | sort | ${BRIGHT_MAGENTA}createmenu${RESET}"
		echo -e "    ${BRIGHT_CYAN}cat ${BRIGHT_YELLOW}'menuitems.txt'${BRIGHT_CYAN} | ${BRIGHT_MAGENTA}createmenu${RESET}"
		echo -e "    ${BRIGHT_CYAN}_TMUX_SESSION=\"\$(${BRIGHT_YELLOW}tmux ls -F '#{session_name}' 2> /dev/null${BRIGHT_CYAN} | ${BRIGHT_MAGENTA}createmenu${BRIGHT_CYAN})\"${RESET}"
		echo -e "  With command line arguments:"
		echo -e "    ${BRIGHT_MAGENTA}createmenu ${BRIGHT_YELLOW}'Option 1' 'Option 2' 'Option 3'${RESET}"
		echo -e "  With a specified picker:"
		echo -e "    ${BRIGHT_MAGENTA}createmenu ${BRIGHT_CYAN}--picker=${BRIGHT_GREEN}rofi ${BRIGHT_YELLOW}\"Option 1\" \"Option 2\" \"Option 3\"${RESET}"
		echo -e "    ${BRIGHT_CYAN}echo -e ${BRIGHT_YELLOW}\"Red\\\\nGreen\\\\nBlue\"${BRIGHT_CYAN} | ${BRIGHT_MAGENTA}createmenu${BRIGHT_CYAN} --picker=${BRIGHT_GREEN}dmenu${RESET}"
		return 1
	fi

	# Check for --picker parameter and remove it from arguments
	local _PICKER
	local _FOUND_PICKER=false
	local NEW_ARGS=()
	for ARG in "$@"; do
		if [[ "$ARG" == --picker=* ]]; then
			_PICKER="${ARG#*=}"
			if cmd-exists "${_PICKER}"; then
				_FOUND_PICKER=true
			else
				echo -e "${BRIGHT_RED}Error: ${BRIGHT_CYAN}The picker ${BRIGHT_YELLOW}${_PICKER}${BRIGHT_CYAN} is not available or installed${RESET}"
				return 1
			fi
		else
			NEW_ARGS+=("$ARG")
		fi
	done
	set -- "${NEW_ARGS[@]}"

	# If no specific picker is provided or the picker is not valid...
	if [ "$_FOUND_PICKER" == false ]; then
		# Loop through the list and see if one of them is installed
		for _PICKER in $_VALID_PICKERS; do
			if cmd-exists $_PICKER; then
				_FOUND_PICKER=true
				break
			fi
		done
	fi

	# Check if command line arguments are provided
	if [ "$#" -gt 0 ]; then
		local _INPUT=""
		local _COUNT=0
		for arg in "$@"; do
			# Increase count for each argument
			((_COUNT++))

			# Add newline after each argument except the last
			if [ $_COUNT -lt $# ]; then
				_INPUT+="${arg}"$'\n'
			else
				_INPUT+="${arg}"
			fi
		done
	else
		# Get the piped in multiple lines of text
		local _INPUT="$(</dev/stdin)"
		# Count the lines of text
		local _COUNT=$(echo "${_INPUT}" | wc -l)
	fi

	# If there is no input, just exit with an error
	if [ -z "${_INPUT}" ]; then
		return 1

	# If there is only one line (or one argument), no choice is needed
	elif [ ${_COUNT} -eq 1 ]; then
		echo "${_INPUT}"
		return 0
	fi

	# If we found a picker, use it
	if [ "$_FOUND_PICKER" == true ]; then
		# echo -e "${BRIGHT_MAGENTA}The picker is: ${BRIGHT_GREEN}$_PICKER${RESET}"
		case $_PICKER in
			dmenu)
				echo "${_INPUT}" | dmenu -l 10
				;;
			rofi)
				echo "${_INPUT}" | rofi -dmenu -i -no-custom -no-fixed-num-lines -p "Choose:"
				;;
			wofi)
				echo "${_INPUT}" | wofi --show dmenu --insensitive --prompt "Choose:"
				;;
			*)
				echo "${_INPUT}" | $_PICKER
				;;
		esac

	# Use Bash's built in select option
	else
		# Parse only on new lines
		local _IFS_OLD="${IFS}"
		IFS=$'\n'

		# Turn off globbing filename generation
		set -f

		# Show a list to pick an item from
		select RESULT in ${_INPUT}; do
			if [ -n "${RESULT}" ]; then
				echo "${RESULT}"
				break
			fi
		done < /dev/tty

		# Restore settings
		IFS="${_IFS_OLD}"
		set +f
	fi
}
# List and sort all function names from code files (with line numbers)
function get-functions() {
	# Check if a filename is provided
	if [[ -z "${1}" ]]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}get-functions${RESET} ${BRIGHT_GREEN}[filename]${RESET}"
		return 1
	fi

	# Perform a grep to find function names and include line numbers
	# Use awk for formatting, filtering comments, and cleaning up
	# Further filter with awk to exclude names that start with '_'
	# Remove leading spaces and sort by function name and then by line number, while also removing duplicates
	grep -n -E '(function[[:space:]]+\w+)|(def[[:space:]]+\w+)|(public[[:space:]]+static[[:space:]]+void[[:space:]]+\w+)|(public[[:space:]]+function[[:space:]]+\w+)' "${1}" | \
	awk -F: '$2 !~ /^[[:space:]]*(#|\/\/)/ { gsub(/^[[:space:]]+/, "", $2); print $1 ":\t" $2 }' | \
	sed -E 's/(function|def|public static void|public function)[[:space:]]+//' | \
	awk -F ':\t' '$2 !~ /^_/ {print $1 ":\t" $2}' | \
	sort -k2,2 -k1,1n | \
	uniq -f 1
}

# Function to copy a file or directory with a progress bar
function cpp() {
	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination path is not specified."
		return 1
	fi
	if [[ ! -d "${2}" ]]; then
		echo "Destination is not a directory."
		return 1
	fi

	# Check if rsync is available
	if cmd-exists --strict rsync; then
		# Use rsync with archive mode and overall progress bar
		rsync -ah --info=progress2 "${1}" "${2}"
	else
		# If rsync is not available, use strace with cp to show progress
		set -e
		strace -q -ewrite cp -- "${1}" "${2}" 2>&1 \
		| awk '{
		count += $NF
		if (count % 10 == 0) {
			percent = int(count / total_size * 100)
			printf "%3d%% [", percent
			for (i = 0; i <= percent; i++)
				printf "="
				printf ">"
				for (i = percent; i < 100; i++)
					printf " "
					printf "]\r"
				}
			}
		END { print "" }' total_size=$(stat -c '%s' "${1}") count=0
	fi
}

# Function to copy a file and optionally go to the directory
function cpg() {
	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination is not specified."
		return 1
	fi
	if [[ -d "${2}" ]]; then
		# Destination is a directory, copy the file and go to the directory
		cp "${1}" "${2}" && cd "${2}"
	else
		# Destination is not a directory, just copy the file
		cp "${1}" "${2}"
	fi
}

# Function to move a file or directory and optionally go to the directory
function mvg() {
	# Check the parameters
	if [[ -z "${1}" ]]; then
		echo "Source is not specified."
		return 1
	fi
	if [[ -z "${2}" ]]; then
		echo "Destination path is not specified."
		return 1
	fi

	if [[ -d "${2}" ]]; then
		# Destination is a directory, move the file and go to the directory
		mv "${1}" "${2}" && cd "${2}"
	else
		# Destination is not a directory, just move the file
		mv "${1}" "${2}"
	fi
}
# Prints random height bars across the width of the screen
# (great with lolcat application on new terminal windows)
function sparkbars() {
	columns=$(tput cols)
	chars=▁▂▃▄▅▆▇█
	for ((i = 1; i <= $columns; i++))
	do
		echo -n "${chars:RANDOM%${#chars}:1}"
	done
	echo
}
# Interactively create, configure, and test a new Linux user
function createuser() {
	sudo true
	local username

	# Check if a username was passed as a parameter
	if [ "$#" -eq 1 ]; then
		username="$1"
	else
		read -r -p $'${BRIGHT_CYAN}Enter the username for the new user:${RESET} ' username
	fi

	# Check if the user already exists
	if id "${username}" &>/dev/null; then
		echo -e "${BRIGHT_RED}User ${username} already exists. Aborting.${RESET}"
		return 1
	fi

	# Confirm if the user should be created with a home directory
	if ask "${BRIGHT_GREEN}Create a new user with a home folder?${RESET}" N; then
		sudo useradd -m "${username}"
	else
		echo -e "${BRIGHT_RED}User creation aborted.${RESET}"
		return 1
	fi

	# Set the user's password
	echo -e "${BRIGHT_YELLOW}\nSet the user's password:${RESET}"
	sudo passwd "${username}"

	# Ask if the user should change their password upon next login
	if ask "${BRIGHT_GREEN}Force user to change password on next login?${RESET}" N; then
		sudo passwd -e "${username}"
	else
		echo -e "${BRIGHT_YELLOW}No change password enforced.${RESET}"
	fi

	# Ask if the user should have root (sudo) access
	if ask "${BRIGHT_MAGENTA}⚠️ Give user root access? ⚠️${RESET}" N; then
		sudo usermod -a -G sudo "${username}"
	else
		echo -e "${BRIGHT_YELLOW}No root access granted.${RESET}"
	fi

	# Change the user's login shell to bash
	echo -e "${BRIGHT_CYAN}\nChange user’s login shell to bash${RESET}"
	sudo usermod --shell /bin/bash "${username}"

	# Verify the user's settings
	echo -e "${BRIGHT_YELLOW}\nVerifying user settings:${RESET}"
	sudo grep "${username}" /etc/passwd

	# Ask if you should copy over the local .bashrc to the new user
	if ask "${BRIGHT_GREEN}Copy over your local .bashrc?${RESET}" N; then
		sudo cp ~/.bashrc /home/"${username}"/
		sudo chown "${username}":"${username}" /home/"${username}"/.bashrc
		sudo chmod 644 /home/"${username}"/.bashrc
	else
		echo -e "${BRIGHT_YELLOW}No .bashrc copy.${RESET}"
	fi

	# Test login with the new user
	if ask "${BRIGHT_GREEN}⚠️ Test a login as this user? ⚠️${RESET}" N; then
		echo -e "${BRIGHT_CYAN}\nTesting: Logging in as ${username}${RESET}"
		sudo su - "${username}"
	fi
}

# Remove a user from the system
alias deleteuser='sudo userdel'
function wipeuser() {
	local username="$1"

	# If username is not provided, get the list of users and use createmenu
	if [[ -z "${username}" ]]; then
		echo -e "${BRIGHT_CYAN}Select a user to delete:${RESET}"
		username=$(sudo awk -F: '$3 >= 1000 && $3 < 65534 {print $1}' /etc/passwd | createmenu)
	fi

	# If username is still empty (e.g. if the user cancels the menu selection), exit
	if [[ -z "${username}" ]]; then
		echo -e "${BRIGHT_RED}No user selected. Aborting.${RESET}"
		return 1

	# Check against this being the current user
	elif [[ "${username}" == "${USER}" ]]; then
		echo -e "${BRIGHT_RED}You cannot remove the currently logged-in user. Aborting.${RESET}"
		return 1
	fi

	# Check if the user exists
	if id "${username}" &>/dev/null; then

		# Confirm deletion
		if ask "${BRIGHT_RED}⚠️ Are you sure you want to delete user ${username} and all their data? ⚠️ This action cannot be undone! ⚠️${RESET}" N; then

			# Kill all processes by the user
			sudo pkill -U "${username}"

			# Remove the user and their home directory
			sudo userdel -rf "${username}"

			# Remove the user from any additional groups
			sudo delgroup "${username}" &>/dev/null

			echo -e "${BRIGHT_GREEN}User ${username} and their home directory have been deleted.${RESET}"
		else
			echo -e "${BRIGHT_YELLOW}User deletion aborted.${RESET}"
		fi
	else
		echo -e "${BRIGHT_RED}User ${username} does not exist.${RESET}"
	fi
}
#######################################################
# Set the ultimate amazing command prompt
#######################################################

alias hug="hugo server -F --bind=10.0.0.97 --baseURL=http://10.0.0.97"

# Check if the shell is interactive
if [[ $- == *i* ]]; then
    # Bind Ctrl+f to insert 'zi' followed by a newline
    bind '"\C-f":"zi\n"'
fi

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

eval "$(starship init bash)"
eval "$(zoxide init bash)"