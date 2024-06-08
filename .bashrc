#!/bin/bash
iatest=$(expr index "$-" i)
## downlaod and replace .bashrc or use alias gtbrc##
 function getbash {
 	sudo curl -sSL https://raw.githubusercontent.com/dnakeys/mybash/main/.bashrc --output $HOME/.bashrc | . ~/.bashrc
 }
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

# Don't put duplicate lines in the history and do not add lines that start with a space
export HISTCONTROL=erasedups:ignoredups:ignorespace

# Check the window size after each command and, if necessary, update the values of LINES and COLUMNS
shopt -s checkwinsize

# Causes bash to append to history instead of overwriting it so if you start a new terminal, you have old session history
shopt -s histappend
PROMPT_COMMAND='history -a'

# Allow ctrl-S for history navigation (with ctrl-R)
#[[ $- == *i* ]] && stty -ixon
#
# Ignore case on auto-completion
# Note: bind used instead of sticking these in .inputrc
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi

# Show auto-completion list automatically, without double tab
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Set the default editor
export EDITOR=nano
export VISUAL=nano
# alias pico='edit'
# alias spico='sedit'
# alias nano='edit'
# alias snano='sedit'
# alias vim='nvim'
# Set some defaults for nano
# NOTE: Depending on the version of nano you have, --linenumbers and --suspend is helpful
if cmd-exists --strict nano; then
	alias {n,nano}='nano --smarthome --multibuffer --const --autoindent'
fi

# Replace batcat with cat on Fedora as batcat is not available as a RPM in any form
if command -v lsb_release >/dev/null; then
	DISTRIBUTION=$(lsb_release -si)

	if [ "$DISTRIBUTION" = "Fedora" ] || [ "$DISTRIBUTION" = "Arch" ]; then
		alias cat='bat'
	else
		alias cat='batcat'
	fi
fi

# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Edit this .bashrc file
alias ebrc='edit ~/.bashrc'
alias rbrc='. ~/.bashrc'
alias gtbrc='sudo curl -sSL https://raw.githubusercontent.com/dnakeys/mybash/main/.bashrc --output $HOME/.bashrc | . ~/.bashrc'

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
#alias upmyshit='sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y'
alias upmyshit='sudo apt update -y && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y'
alias upnala='sudo nala update -y && sudo nala upgrade -y && sudo nala autopurge -y && sudo nala autoremove -y && sudo nala clean -y'
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
alias lc='ls -lcrh'               # sort by change time
alias lu='ls -lurh'               # sort by access time
alias lr='ls -lRh'                # recursive ls
alias lt='ls -ltrh'               # sort by date
alias lm='ls -alh |more'          # pipe through 'more'
alias lw='ls -xAh'                # wide listing format
alias ll='ls -Fls'                # long listing format
alias labc='ls -lap'              #alphabetical sort
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

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
distribution ()
{
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
			arch)
				dtype="arch"
				;;
			slackware)
				dtype="slackware"
				;;
			*)
				# If ID is not recognized, keep dtype as unknown
				;;
		esac
	fi

	echo $dtype
}

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
function whatsmyip ()
{
	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show eth0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig eth00 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
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
netinfo() {
    sparkbars
	echo "--------------- Network Information ---------------"
	ip a | awk '/^[0-9]+:/{gsub(/:/,"",$2); device=$2} /^[[:space:]]*inet /{print "Device: " device "  IP: " $2}' # shows all devices with ip's
	echo "---------------------------------------------------"
	sparkbars
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
# Confirm/Ask a question - See 'killps' for example of use
# General-purpose function to ask Yes/No questions in Bash,
# either with or without a default answer.
# It keeps repeating the question until it gets a valid answer.
# Link: https://gist.github.com/davejamesmiller/1965569
# Example Usage:
#   if ask "Do you want to do such-and-such?"; then
# Default to Yes if the user presses enter without giving an answer:
#   if ask "Do you want to do such-and-such?" Y; then
# Default to No if the user presses enter without giving an answer:
#   if ask "Do you want to do such-and-such?" N; then
# Or if you prefer the shorter version:
#   ask "Do you want to do such-and-such?" && said_yes
#   ask "Do you want to do such-and-such?" || said_no
function ask() {
	# Initialize local variables
	local prompt default reply

	# Determine the prompt and default based on the second parameter
	if [[ ${2:-} = 'Y' ]]; then
		prompt='Y/n'
		default='Y'
	elif [[ ${2:-} = 'N' ]]; then
		prompt='y/N'
		default='N'
	else
		prompt='y/n'
		default=''
	fi

	# Loop until a valid answer is given
	while true; do
		# Ask the question (not using "read -p" as it uses stderr not stdout)
		echo -ne "$1 [$prompt] "

		# Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
		read -r reply </dev/tty

		# Set reply to default if it is empty
		[[ -z $reply ]] && reply=$default

		# Check if the reply is valid
		case "$reply" in
			Y*|y*) return 0 ;;
			N*|n*) return 1 ;;
		esac
	done
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
# This function automates the process of executing a command and providing visual feedback
# It displays an hourglass symbol next to the provided description while the command is running
# Upon successful execution, the hourglass is replaced with a green checkmark
# If the command fails, a red cross symbol is displayed instead
# Parameters:
# 	$1: Text description to display while the command is running
# 	$2: The command to execute
function run-with-feedback() {
	# Check if both parameters are provided
	if [ -z "${1}" ] || [ -z "${2}" ]; then
		echo -e "${BRIGHT_WHITE}Usage: ${BRIGHT_CYAN}run-with-feedback${RESET} ${BRIGHT_GREEN}[description] [command]${RESET}"
		return 1
	fi

	# Local variables for special characters with color codes
	local hourglass="${BRIGHT_YELLOW}⌛${RESET}"   # Yellow Hourglass
	local checkmark="\r${BRIGHT_GREEN}✓${RESET}"  # Green Checkmark
	local cross="\r${BRIGHT_RED}X${RESET}"      # Red Error Cross

	# Display the hourglass and message
	echo -ne "${hourglass} ${1}"

	# Execute the command
	if eval "${2}"; then
		# If successful, display a green checkmark
		echo -e "${checkmark} ${1} "
	else
		# If failed, display a red cross
		echo -e "${cross} ${1} "
	fi
}
# Fixes permissions in a user's home folder
# If no user is specified, the current user is selected
function fixuserhome() {
	# Validate input parameters
	if [[ -z "${@}" ]]; then
		local _username="$(whoami)"
	else
		local _username="${@}"
	fi

	# Verify if the home folder exists
	if [ ! -d "/home/${_username}" ]; then
		echo "Error: User ${_username} does not have a home folder."
		return 1
	fi

	# Confirm with the user
	if ask "${BRIGHT_RED}WARNING:${RESET} Change all permissions for user ${BRIGHT_CYAN}${_username}${RESET}'s home folder?" N; then
		# Elevate privileges to root
		sudo true

		if ask "Reset group ownership permissions to ${BRIGHT_CYAN}${_username}${RESET}?" Y; then
			run-with-feedback \
				"Set the owner and group as ${_username}" \
				"sudo chown -R ${_username}:${_username} /home/${_username}"
		else
			run-with-feedback \
				"Set the owner and group as ${_username}" \
				"sudo chown -R ${_username} /home/${_username}"
		fi

		run-with-feedback \
			"Make sure we have read and write access" \
			"chmod -R u+rw /home/${_username}"

		run-with-feedback \
			"Remove write access from group" \
			"chmod -R g-w /home/${_username}"

		run-with-feedback \
			"Remove all access from others" \
			"chmod -R o-rwx /home/${_username}"

		run-with-feedback \
			"Make .sh shell script files executable" \
			"find /home/${_username} -type f \( -name \"*.sh\" -o -name \".*.sh\" \) -exec chmod ug+x {} \;"

		run-with-feedback \
			"Make sure all directories have execute permissions" \
			"chmod -R ug+X /home/${_username}"

		# Remove group permissions for directories without group read
		run-with-feedback \
			"Remove group permissions for directories without group read" \
			"find /home/${_username} -type d ! -perm -g+r -execdir chmod g-wx {} \;"

		if [[ -d "/home/${_username}/.local/share/kwalletd" ]]; then
			run-with-feedback \
				"User only access to KDE Wallet keyring" \
				"chmod -R go-rwx /home/${_username}/.local/share/kwalletd"
		fi

		# If there is a ~/.local/share/keyrings directory...
		if [[ -d "/home/${_username}/.local/share/keyrings" ]]; then
			run-with-feedback \
				"User only access to GNOME keyring" \
				"chmod -R go-rwx /home/${_username}/.local/share/keyrings"
		fi

		# If there is an .ssh directory...
		if [[ -d "/home/${_username}/.ssh" ]]; then
			# Setting ownership for .ssh directory and files
			run-with-feedback \
				"Setting ownership for .ssh directory and files" \
				"chown -R ${_username}:${_username} /home/${_username}/.ssh"

			# Setting strict permissions for .ssh and private keys
			run-with-feedback \
				"User only access to .ssh and private keys" \
				"chmod -R go-rwx /home/${_username}/.ssh"
		fi

		# If there is a .putty directory...
		if [[ -d "/home/${_username}/.putty" ]]; then
			run-with-feedback \
				"User only access to .putty and ssh keys" \
				"chmod -R go-rwx /home/${_username}/.putty"
		fi

		# If there is a .pki directory...
		if [[ -d "/home/${_username}/.pki" ]]; then
			run-with-feedback \
				"User only access to .pki keys and certificates" \
				"chmod -R go-rwx /home/${_username}/.pki"
		fi

		# If there is a .gnupg directory...
		if [[ -d "/home/${_username}/.gnupg" ]]; then
			run-with-feedback \
				"User only access to .gnupg and private keys" \
				"chmod -R go-rwx /home/${_username}/.gnupg"
		fi

		# If KeePassXC/KeePass/KeeWeb is installed...
		if cmd-exists --strict keepassxc || cmd-exists --strict keepass || cmd-exists --strict keeweb; then
			run-with-feedback \
				"User only access to KeePassXC/KeePass/KeeWeb .kdbx files" \
				"find /home/${_username} -type f \( -name '*.kdbx' -o -name '.*.kdbx' \) -exec chmod go-rwx {} \;"
		fi

		# If there is a pass directory...
		if [[ -d "/home/${_username}/.password-store" ]]; then
			run-with-feedback \
				"User only access to pass data" \
				"chmod -R go-rwx /home/${_username}/.password-store"
		fi

		# If there is a Bitwarden directory...
		if [[ -d "/home/${_username}/.config/Bitwarden" ]]; then
			run-with-feedback \
				"User only access to Bitwarden data" \
				"chmod -R go-rwx /home/${_username}/.config/Bitwarden"
		fi
		if [[ -d "/home/${_username}/.var/app/com.bitwarden.desktop" ]]; then
			run-with-feedback \
				"User only access to Bitwarden data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/com.bitwarden.desktop"
		fi

		# Check for Tor settings
		if [[ -d "/home/${_username}/.local/share/torbrowser" ]]; then
			run-with-feedback \
				"User only access to Tor browser data" \
				"chmod -R go-rwx /home/${_username}/.local/share/torbrowser"
		fi
		if [[ -d "/home/${_username}/.var/app/com.github.micahflee.torbrowser-launcher" ]]; then
			run-with-feedback \
				"User only access to Tor browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/com.github.micahflee.torbrowser-launcher"
		fi

		# Check for Brave settings
		if [[ -d "/home/${_username}/.config/BraveSoftware" ]]; then
			run-with-feedback \
				"User only access to Brave browser data" \
				"chmod -R go-rwx /home/${_username}/.config/BraveSoftware"
		fi
		if [[ -d "/home/${_username}/.var/app/com.brave.Browser" ]]; then
			run-with-feedback \
				"User only access to Brave browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/com.brave.Browser"
		fi

		# Check for Chrome settings
		if [[ -d "/home/${_username}/.config/google-chrome" ]]; then
			run-with-feedback \
				"User only access to Chrome browser data" \
				"chmod -R go-rwx /home/${_username}/.config/google-chrome"
		fi
		if [[ -d "/home/${_username}/.var/app/com.google.Chrome" ]]; then
			run-with-feedback \
				"User only access to Chrome browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/com.google.Chrome"
		fi

		# Check for Chromium settings
		if [[ -d "/home/${_username}/.config/chromium" ]]; then
			run-with-feedback \
				"User only access to Chromium browser data" \
				"chmod -R go-rwx /home/${_username}/.config/chromium"
		fi
		if [[ -d "/home/${_username}/.var/app/org.chromium.Chromium" ]]; then
			run-with-feedback \
				"User only access to Chromium browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.chromium.Chromium"
		fi
		if [[ -d "/home/${_username}/.var/app/net.sourceforge.chromium-bsu" ]]; then
			run-with-feedback \
				"User only access to Ungoogled Chromium browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/net.sourceforge.chromium-bsu"
		fi

		# Check for Firefox settings
		if [[ -d "/home/${_username}/.mozilla" ]]; then
			run-with-feedback \
				"User only access to Firefox browser data" \
				"chmod -R go-rwx /home/${_username}/.mozilla"
		fi
		if [[ -d "/home/${_username}/.var/app/org.mozilla.firefox" ]]; then
			run-with-feedback \
				"User only access to Firefox browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.mozilla.firefox"
		fi

		# Check for LibreWolf settings
		if [[ -d "/home/${_username}/.librewolf" ]]; then
			run-with-feedback \
				"User only access to LibreWolf browser data" \
				"chmod -R go-rwx /home/${_username}/.librewolf"
		fi
		if [[ -d "/home/${_username}/.var/app/io.gitlab.librewolf-community" ]]; then
			run-with-feedback \
				"User only access to LibreWolf browser data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/io.gitlab.librewolf-community"
		fi

		# Check for Opera settings
		if [[ -d "/home/${_username}/.config/opera" ]]; then
			run-with-feedback \
				"User only access to Opera browser data" \
				"chmod -R go-rwx /home/${_username}/.config/opera"
		fi

		# Check for Vivaldi settings
		if [[ -d "/home/${_username}/.config/vivaldi" ]]; then
			run-with-feedback \
				"User only access to Vivaldi browser data" \
				"chmod -R go-rwx /home/${_username}/.config/vivaldi"
		fi

		# Check for Evolution settings
		if [[ -d "/home/${_username}/.config/evolution" ]]; then
			run-with-feedback \
				"User only access to Evolution email data" \
				"chmod -R go-rwx /home/${_username}/.config/evolution"
		fi
		if [[ -d "/home/${_username}/.var/app/org.gnome.Evolution" ]]; then
			run-with-feedback \
				"User only access to Evolution email data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.gnome.Evolution"
		fi

		# Check for Geary settings
		if [[ -d "/home/${_username}/.local/share/geary" ]]; then
			run-with-feedback \
				"User only access to Geary email data" \
				"chmod -R go-rwx /home/${_username}/.local/share/geary"
		fi
		if [[ -d "/home/${_username}/.var/app/org.gnome.Geary" ]]; then
			run-with-feedback \
				"User only access to Geary email data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.gnome.Geary"
		fi

		# Check for Thunderbird settings
		if [[ -d "/home/${_username}/.thunderbird" ]]; then
			run-with-feedback \
				"User only access to Thunderbird email data" \
				"chmod -R go-rwx /home/${_username}/.thunderbird"
		fi
		if [[ -d "/home/${_username}/.var/app/org.mozilla.Thunderbird" ]]; then
			run-with-feedback \
				"User only access to Thunderbird email data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.mozilla.Thunderbird"
		fi

		# Check for Element settings
		if [[ -d "/home/${_username}/.config/Element" ]]; then
			run-with-feedback \
				"User only access to Element chat data" \
				"chmod -R go-rwx /home/${_username}/.config/Element"
		fi
		if [[ -d "/home/${_username}/.var/app/im.riot.Riot" ]]; then
			run-with-feedback \
				"User only access to Element chat data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/im.riot.Riot"
		fi

		# Check for Signal settings
		if [[ -d "/home/${_username}/.config/Signal" ]]; then
			run-with-feedback \
				"User only access to Signal chat data" \
				"chmod -R go-rwx /home/${_username}/.config/Signal"
		fi
		if [[ -d "/home/${_username}/.var/app/org.signal.Signal" ]]; then
			run-with-feedback \
				"User only access to Signal chat data (Flatpak)" \
				"chmod -R go-rwx /home/${_username}/.var/app/org.signal.Signal"
		fi

		if [[ -f "/home/${_username}/.config/birthdays.csv" ]]; then
			run-with-feedback \
				"User only access to birthday/anniversary reminder data" \
				"chmod 600 /home/${_username}/.config/birthdays.csv"
		elif [[ -f "${_BDAY_FILE}" ]]; then
			run-with-feedback \
				"User only access to birthday/anniversary reminder data (from variable)" \
				"chmod 600 \"${_BDAY_FILE}\""
		fi

		# [OPTIONAL] Copy group permissions to other
		#run-with-feedback \
		#	"Copy group permissions to other" \
		#	"chmod -R o=g /home/${_username}"

		# [OPTIONAL] Copy user permissions to group
		#run-with-feedback \
		#	"Copy user permissions to group" \
		#	"chmod -R g=u /home/${_username}"

		# Set the setgid bit, so that files/folder under the directory
		# will be created with the same group as <directory>
		run-with-feedback \
			"Set the setgid bit to inherit folder permissions" \
			"chmod g+s /home/${_username}"

		# If Access Control Lists (ACL) is installed...
		# To "activate" ACL, you have to remount the drive with the "acl" option
		# NOTE: Btrfs and Xfs filesystem use the ACL mount option by default
		# Example /etc/fstab Entry:
		# UUID=abc123def456 / ext4 defaults,acl 0 1
		# Type "man acl" for more information
		if cmd-exists --strict setfacl; then
			# Use getfacl [directory] to check ACL for these directories
			run-with-feedback \
				"Set user default ACL entries" \
				"setfacl -d -m u::rwx /home/${_username}"
			run-with-feedback \
				"Set group default ACL entries" \
				"setfacl -d -m g::rx /home/${_username}"
			run-with-feedback \
				"Set others default ACL entries" \
				"setfacl -d -m o::X /home/${_username}"
		fi

		echo "Done!"
	else
		return 0
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
#Remove a user from the system
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
bind '"\C-f":"zi\n"'

export PATH=$PATH:"$HOME/.local/bin:$HOME/.cargo/bin:/var/lib/flatpak/exports/bin:/.local/share/flatpak/exports/bin"

# Install Starship - curl -sS https://starship.rs/install.sh | sh
eval "$(starship init bash)"
eval "$(zoxide init bash)"