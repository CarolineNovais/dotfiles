# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

echo 'Loading zshrc...'

# Path to your oh-my-zsh installation.
export ZSH="/home/sierra/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  composer
  # docker
  # docker-compose
  git 
  # git-extras
  # git-flow
  vscode
  # web-search
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

######################################################
######################################################
################ INICIO DOTFILES #####################
######################################################
######################################################

# Simulando o shopt no zsh
alias shopt='/home/sierra/.dotfiles/dependency/shopt'
# Load Bash RC Common Source
source $HOME/.commonrc

# FixBugs
# local ZSH_DEBUG_CMD

#src
src 00_dotfiles
src 01_console
src 01_exports
src 01_path
# src 01_prompt
src 10_editor
# src 10_powerline
# src 10_tmux
src 20_system
# src 30_connection
src 30_docker
# src 50_aws
src 50_clipboard
src 50_developer
src 50_docker_programs
#src 50_file
src 50_history
# src 50_misc
src 50_net
src 50_node
# src 50_osx
# src 50_pebble
# src 50_prompt
# src 50_ruby
src 50_search
src 50_security
src 50_system
src 50_ubuntu_desktop
src 50_ubuntu
src 50_developer
src 50_vcs
src 50_web
# src 60_windows

# Deu problema pra rodar isso aqui
# @todo _zsh_highlight:33: scalar parameter ZSH_DEBUG_CMD created globally in function _zsh_highlight
# Load the shell complete
#for file in ~/.completion/.*[^~]; do
#	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
#done

######################################################
######################################################
################ FINAL DOTFILES ######################
######################################################
######################################################

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  env TERM=screen-256color tmux attach -t default || env TERM=screen-256color tmux new -s default
fi
