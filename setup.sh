#!/bin/bash
######## FIRST CHECK ########
# Must be root to install
echo ":::"
if [[ $EUID -eq 0 ]];then
    echo "::: You are root."
else
    echo "::: sudo will be used for the install."
    # Check if it is actually installed
    # If it isn't, exit because the install cannot complete
    if [[ $(dpkg-query -s sudo) ]];then
        export SUDO="sudo"
        export SUDOE="sudo -E"
    else
        echo "::: Please install sudo or run this as root."
        exit 1
    fi
fi

RC='\e[0m'
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'

command_exists() {
    command -v $1 >/dev/null 2>&1
}

checkEnv() {
    ## Check for requirements.
    REQUIREMENTS='curl groups sudo'
    if ! command_exists ${REQUIREMENTS}; then
        echo -e "${RED}To run me, you need: ${REQUIREMENTS}${RC}"
        exit 1
    fi

    ## Check Package Handeler
    PACKAGEMANAGER='apt yum dnf pacman zypper'
    for pgm in ${PACKAGEMANAGER}; do
        if command_exists ${pgm}; then
            PACKAGER=${pgm}
            echo -e "Using ${pgm}"
        fi
    done

    if [ -z "${PACKAGER}" ]; then
        echo -e "${RED}Can't find a supported package manager"
        exit 1
    fi

    ## Check if the current directory is writable.
    GITPATH="$(dirname "$(realpath "$0")")"
    if [[ ! -w ${GITPATH} ]]; then
        echo -e "${RED}Can't write to ${GITPATH}${RC}"
        exit 1
    fi

    ## Check SuperUser Group
    SUPERUSERGROUP='wheel sudo root'
    for sug in ${SUPERUSERGROUP}; do
        if groups | grep ${sug}; then
            SUGROUP=${sug}
            echo -e "Super user group ${SUGROUP}"
        fi
    done

    ## Check if member of the sudo group.
    if ! groups | grep ${SUGROUP} >/dev/null; then
        echo -e "${RED}You need to be a member of the sudo group to run me!"
        exit 1
    fi

}
nano_settings() {
    # Step 1: Run the curl command to download and run the install script
    curl https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh | sh

# Step 2: Append a line to ~/.nanorc to include the nanorc files
#install_path="$HOME/.nano"  # Default install path
    echo "include $install_path/*.nanorc" >> ~/.nanorc

# Step 3: Add a # to the beginning of line 26 in the nanorc file
    sed -i '26s/^/#/' "/home/dnakeys/.nano/nanorc.nanorc"

# Step 4: Insert set linenumbers as the first line of ~/.nanorc
    sed -i '1s/^/set linenumbers\n/' ~/.nanorc   
}

installDepend() {
    ## Check for dependencies.
    DEPENDENCIES='autojump bash bash-completion tar neovim bat nano unzip'
    echo -e "${YELLOW}Installing dependencies...${RC}"
    if [[ $PACKAGER == "pacman" ]]; then
        if ! command_exists yay; then
            echo "Installing yay..."
            sudo ${PACKAGER} --noconfirm -S base-devel
            $(cd /opt && sudo git clone https://aur.archlinux.org/yay-git.git && sudo chown -R ${USER}:${USER} ./yay-git && cd yay-git && makepkg --noconfirm -si)
        else
            echo "Command yay already installed"
        fi
        yay --noconfirm -S ${DEPENDENCIES}
    else
        sudo ${PACKAGER} install -yq ${DEPENDENCIES}
    fi
}

installStarship() {
    if command_exists starship; then
        echo "Starship already installed"
        return
    fi

    if ! curl -sS https://starship.rs/install.sh | sh; then
        echo -e "${RED}Something went wrong during starship install!${RC}"
        exit 1
    fi
    if command_exists fzf; then
        echo "Fzf already installed"
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
    fi
}

installZoxide() {
    if command_exists zoxide; then
        echo "Zoxide already installed"
        return
    fi

    if ! curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh; then
        echo -e "${RED}Something went wrong during zoxide install!${RC}"; 
     else 
        sudo apt install zoxide;
        exit 1
    fi
}

install_additional_dependencies() {
   sudo apt update
   sudo apt install -y trash-cli bat meld jpico
   sudo apt install -y nala
   sudo nala install tldr
   tldr -u
install_additional_dependencies() {
    case $(command -v apt || command -v zypper || command -v dnf || command -v pacman) in
        *apt)
            sudo apt update
            sudo apt install -y neovim bat
            ;;
        *zypper)
            sudo zypper refresh
            sudo zypper install -y neovim bat
            ;;
        *dnf)
            sudo dnf check-update
            sudo dnf install -y neovim bat
            ;;
        *pacman)
            sudo pacman -Syu
            sudo pacman -S --noconfirm neovim bat
            ;;
        *)
            echo "No supported package manager found. Please install neovim and bat manually."
            exit 1
            ;;
    esac
}

linkConfig() {
    ## Get the correct user home directory.
    USER_HOME=$(getent passwd ${SUDO_USER:-$USER} | cut -d: -f6)
    ## Check if a bashrc file is already there.
    OLD_BASHRC="${USER_HOME}/.bashrc"
    if [[ -e ${OLD_BASHRC} ]]; then
        echo -e "${YELLOW}Moving old bash config file to ${USER_HOME}/.bashrc.bak${RC}"
        if ! mv ${OLD_BASHRC} ${USER_HOME}/.bashrc.bak; then
            echo -e "${RED}Can't move the old bash config file!${RC}"
            exit 1
        fi
    fi

    echo -e "${YELLOW}Linking new bash config file...${RC}"
    ## Make symbolic link.
    sudo mkdir ${USER_HOME}/.config/
    ln -svf ${GITPATH}/.bashrc ${USER_HOME}/.bashrc
    ln -svf ${GITPATH}/starship.toml ${USER_HOME}/.config/starship.toml
}

checkEnv
installDepend
installStarship
installZoxide
install_additional_dependencies
installNala
installTldr
/ ~/.bashrc
install_bashrc_support
getbash
nano_settings

if linkConfig; then
    echo -e "${GREEN}Done!\nrestart your shell to see the changes.${RC}"
else
    echo -e "${RED}Something went wrong!${RC}"
fi