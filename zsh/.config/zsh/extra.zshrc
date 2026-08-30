echo 'loading extra.zshrc'
export PATH="$PATH:${HOME}/.local/share/gem/ruby/3.4.0/bin"
export PATH=$HOME/.istioctl/bin:$PATH
export PAGER="bat --paging=always"
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

# User configuration
export GPG_TTY=$(tty)

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


source ~/.profile

source ~/.bin/tmuxinator.zsh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export BROWSER=vivaldi
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
#complete -F __start_velero velero
#complete -F __start_velero v


zstyle ':completion:*' menu select

# opencode
export PATH=/home/thoth/.opencode/bin:$PATH
export PATH=$HOME/.istioctl/bin:$PATH
export PATH="${HOME}/bin:$PATH"
export K9S_SKIN=thoth
export PATH="/mnt/unreal/UE/Engine/Binaries/Linux:$PATH"


