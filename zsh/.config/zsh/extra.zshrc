echo 'extra.zshrc'
export PATH="$PATH:${HOME}/.local/share/gem/ruby/3.4.0/bin"
export PATH=$HOME/.istioctl/bin:$PATH
export THIS_S_TMP=$(mktemp --tmpdir='/tmp' --directory --suffix '.tmp' s.$USER.XXXXXXX)
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
export PATH="/usr/bin/vendor_perl/:$PATH"
source=$HOME/.ssh/.env

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"


# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

  #gpg-agent
  #keychain
export GPG_ID=C1F7EB1BDA1B9C8B
export GPG_TTY=$(tty)
eval $(keychain --nogui --eval id_ed25519 id_rsa $GPG_ID)
#zstyle :omz:plugins:keychain agents gpg,ssh
#zstyle :omz:plugins:keychain identities id_dsa id_ecdsa id_ed25519 id_rsa C1F7EB1BDA1B9C8B
#zstyle :omz:plugins:keychain identities id_dsa id_ecdsa id_ed25519 id_rsa C1F7EB1BDA1B9C8B


if [[ -x $HOME/.config/zsh/zshrc_hooks ]]; then . $HOME/.config/zsh/.zshrc_hooks; fi

#echo blech | gpg --no-options --use-agent --no-tty --sign --local-user $GPG__ID -o- >/dev/null 2>&1
#eval $(keychain --agents gpg,ssh --nogui --eval id_ed25519 id_rsa $GPG_ID)
#gpg --no-options --use-agent --sign --local-user $GPG_ID

#eval $(keychain --agents gpg,ssh --nogui --eval --quiet id_ed25519 40637AEA4089529B5187C8E073066CFE979E9AEB)
#eval $(keychain --agents gpg,ssh --nogui --eval id_ed25519 40637AEA4089529B5187C8E073066CFE979E9AEB)
#echo blech | gpg --no-options --use-agent --no-tty --sign --local-user $GPG__ID -o- >/dev/null 2>&1
#eval $(keychain --agents gpg,ssh --nogui --eval id_ed25519 $GPG_ID)
#eval `keychain --eval id_rsa id_dsa id_ecdsa`

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export EDITOR=nvim
alias vi=$EDITOR
alias vim=$EDITOR
alias lg=lazygit
# Caleb
alias ls=exa
alias fabric=fabric-ai
alias cat=bat
alias boostrun='powerprofilesctl launch -p performance'
alias goboost='(set -x; powerprofilesctl set performance; sudo cpupower frequency-set -g ondemand >&/dev/null;)'
alias gonormal='(set -x; powerprofilesctl set balanced; sudo cpupower frequency-set -g schedutil >&/dev/null;)'
alias gosilent='(set -x; powerprofilesctl set power-saver; sudo cpupower frequency-set -g schedutil >&/dev/null;)'

source ~/.profile

source ~/.bin/tmuxinator.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER=firefox
export PATH="${HOME}/bin:$PATH"
export PATH="${HOME}/.cargo/bin:$PATH"

export PATH="${HOME}/.bin:$PATH"
export GOPATH="${HOME}/.go"
export PATH="${HOME}/.go/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH=~/.meteor:$PATH
export PATH=${HOME}/.r8s/bin:$PATH
export PATH=${HOME}/.m8s/bin:$PATH
#export PATH=${HOME}/anaconda3/bin:$PATH

# added by travis gem
[ -f ${HOME}/.travis/travis.sh ] && source ${HOME}/.travis/travis.sh

# Virtual Environment Wrapper
#source /usr/local/bin/virtualenvwrapper.sh
#export PATH=/mnt/unreal/anaconda3/bin/:$PATH
export PATH="${HOME}/.local/bin/:$PATH"
###############GPRS CSDTK#############
#alias work='source ${HOME}/git/CSDTK/cygenv.sh'
#export GPRS_PROJ_ROOT=${HOME}/git/GPRS_C_SDK
#export PATH=$PATH:${HOME}/git/CSDTK/bin:${HOME}/git/CSDTK/mingw32/usr/bin:${HOME}/git/CSDTK/mips-rda-elf/bin:${HOME}/git/CSDTK/rv32-elf/bin
#export PATH=$PATH:${HOME}/git/CSDTK/cooltools
#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${HOME}/git/CSDTK/lib:${HOME}/git/CSDTK/mingw32/usr/lib
############GPRS CSDTK END############
export ARDUINO_DIR=/usr/share/arduino
export ARDMK_DIR=/mnt/unreal/git/Arduino-Makefile
export AVR_TOOLS_DIR=/usr
export AVRDUDE_CONF=/etc/avrdude.conf
export PATH="${HOME}/esp/xtensa-esp32-elf/bin:$PATH"
export PATH="${HOME}/.kubash/bin:${HOME}/.local/bin:$PATH"
export PATH=${HOME}/esp/xtensa-esp32-elf/bin:$PATH

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/nvidia_icd.json

if [ -f "${HOME}/.local/bin/thefuck" ]; then
  eval $(thefuck --alias)
fi

export PATH="${KREW_ROOT:-${HOME}/.krew}/bin:$PATH"
export ANSIBLE_NOCOWS=1

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
fpath=($fpath "${HOME}/.zfunctions")

#TYPEWRITTEN_PROMPT_LAYOUT="pure"
#eval `keychain --eval id_rsa id_dsa id_ecdsa`

export TF_WORKSPACE=minio-deployment-testing

export PATH=$PATH:${HOME}/bin
export PACMAN_LOOPER=true
# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/google-cloud-sdk/path.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/google-cloud-sdk/completion.zsh.inc' ]; then . '${HOME}/google-cloud-sdk/completion.zsh.inc'; fi

#source '${HOME}/lib/azure-cli/az.completion'

PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;
export XENVIRONMENT="${HOME}/.Xresources"
#export PYENV_ROOT="${HOME}/.pyenv"
#command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
#[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init - zsh)"
#eval "$(pyenv virtualenv-init - zsh)"
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
export PATH="/usr/lib/distcc/bin:$PATH"
export PATH="${HOME}/.npm-global/bin:$PATH"
export PATH="${HOME}/.gem/ruby/3.0.0/bin:$PATH"
#export FASTBUILD_WORKERS="10.11.5.66;10.11.5.67;10.11.5.11;10.11.5.18"
export MCFLY_KEY_SCHEME=vim
export MCFLY_FUZZY=5
export MCFLY_RESULTS=50
export MCFLY_HISTORY_LIMIT=5000
export MCFLY_INTERFACE_VIEW=BOTTOM
eval "$(mcfly init zsh)"
export GREP_COLORS='mt=1;33'
alias gitr="git clone --depth=1"
eval "$(zoxide init zsh)"
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
eval $(thefuck --alias)
[[ -e "${HOME}/lib/oracle-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "${HOME}/lib/oracle-cli/lib/python3.11/site-packages/oci_cli/bin/oci_autocomplete.sh"
eval "$(uv generate-shell-completion bash)"
# Added by `rbenv init` on Sat Nov  9 09:10:05 PM CST 2024
#eval "$(~/.rbenv/bin/rbenv init - --no-rehash zsh)"
eval "$(rbenv init - --no-rehash zsh)"
# assuming that rbenv was installed to `~/.rbenv`
FPATH=~/.rbenv/completions:"$FPATH"

autoload -U compinit
compinit

autoload -U add-zsh-hook

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
export UNREAL_ENGINE_PATH='/unreal/UnrealEngine/Engine'
export TI89_PORT=8989
export K8S_TYPE=kind
export SHELL=/usr/bin/zsh
export FETCHR_CACHE=/mnt/xfs_backup/git/

# pnpm
export PNPM_HOME="${HOME}/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source <(katenary completion zsh)
source <(velero completion zsh)
complete -F __start_velero velero
complete -F __start_velero v

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
source "${HOME}/.local/share/dorothy/init.sh" # Dorothy

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
export PATH="/opt/himax/arm-gnu-toolchain-13.2.Rel1-x86_64-arm-none-eabi/bin:$PATH"

fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select

# opencode
export PATH=/home/thoth/.opencode/bin:$PATH
export PATH=$HOME/.istioctl/bin:$PATH
