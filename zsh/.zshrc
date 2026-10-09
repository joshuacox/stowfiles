[[ -f $HOME/.config/zsh/.zshrc ]] && source $HOME/.config/zsh/.zshrc


# Added by Antigravity CLI installer
export PATH="/home/djehauti/.local/bin:$PATH"
export PATH=$HOME/.istioctl/bin:$PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/djehauti/google-cloud-sdk/path.zsh.inc' ]; then . '/home/djehauti/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/djehauti/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/djehauti/google-cloud-sdk/completion.zsh.inc'; fi
