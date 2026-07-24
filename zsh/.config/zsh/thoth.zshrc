source $ZSH/oh-my-zsh.sh
#Kubash
export KEYS_TO_ADD='ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBInEjsi6ZeqX3JdtdxB9XwYgO0VQha0pKxZSr1yhECYrS6a4yZ9eSKRjS/oMmbD2aYYo0MRKc1yGeyW9sXDuK7s= bob@stealth'
export KEYS_URL='https://raw.githubusercontent.com/WebHostingCoopTeam/keys/master/keys'
export my_DOMAIN=oltorf.net
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/unreal/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/unreal/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/unreal/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/unreal/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export JIRA_API_TOKEN=Y3J5PPKQVrtWqaSWyODLA8C7

export DISTCC_HOSTS="10.11.5.18,cpp,lzo 10.11.5.66,cpp,lzo 10.11.5.67/15"
export FASTBUILD_BROKERAGE_PATH="/unreal/FASTBUILD_BROKERAGE"
export FASTBUILD_CACHE_MODE="rw"
export FASTBUILD_CACHE_PATH="/unreal/FASTBUILD_CACHE/cache"
export FASTBUILD_CACHE_PATH_MOUNT_POINT="/unreal/FASTBUILD_CACHE"
mkdir -p /tmp/FASTBUILD_TEMP
chmod 777 /tmp/FASTBUILD_TEMP
export FASTBUILD_TEMP_PATH="/tmp/FASTBUILD_TEMP"

export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

export DOCKER_BUILDKIT=1
export PATH=/opt/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/opt/cuda/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export CUDACXX=/opt/cuda/bin/nvcc

export LANGCHAIN_TRACING_V2="true"
export CRT_MGR_VERSION=v1.14.5
export IP_OF_LINUX_NODE=10.11.5.246
export OLLAMA_API_BASE=http://10.64.201.1:11434
export OLLAMA_HOST=${OLLAMA_API_BASE}
export OLLAMA_API_BASE2=http://10.64.200.1:11434
export OLLAMA_HOST2=${OLLAMA_API_BASE}
