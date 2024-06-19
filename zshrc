# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundle esc/conda-zsh-completion
antigen bundle git
antigen bundle git-auto-fetch
antigen bundle vi-mode
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle popstas/zsh-command-time

antigen theme romkatv/powerlevel10k
antigen apply

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# Add local binaries
export PATH=$HOME/.local/bin:$PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($HOME/miniconda3/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load environment variables if exist
[[ -f $HOME/.environment ]] && . $HOME/.environment

alias vim=nvim
export EDITOR=nvim
export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
alias gd="git diff "
alias gds="git diff --staged"
alias gbc="git branch --create "
alias gl="git pull --ff-only "
alias gl!="git pull "
alias dp="dvc push "
alias dl="dvc pull "
alias dr="dvc repro "
alias drd="dvc repro --dry "
alias dst="dvc status "
alias sshold="/usr/bin/ssh"
if (( $+commands[kitten] )); then
	alias ssh="kitty +kitten ssh"
fi
alias gbDal="git fetch -p && git branch -vv | grep gone | cut -d' ' -f 3 | grep . | xargs git branch -D"
alias gbdal="git fetch -p && git branch -vv | grep gone | cut -d' ' -f 3 | grep . | xargs git branch -d"
eval $(thefuck --alias)

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k.zsh.
[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh
