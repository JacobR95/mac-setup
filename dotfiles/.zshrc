# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

export PATH=$PATH:/Users/jacobrobinson/.local/bin
export PATH=$PATH:/Users/jacobrobinson/.cargo/bin

export ZSH="$HOME/.oh-my-zsh"
export DISPLAY=:0

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

alias vi="nvim"
alias lg="lazygit"

alias dc='docker compose'

alias major="echo '![](https://img.shields.io/badge/major-red)' | pbcopy"
alias minor="echo '![](https://img.shields.io/badge/minor-yellow)' | pbcopy"
alias question="echo '![](https://img.shields.io/badge/question-blue)' | pbcopy"
alias statement="echo '![](https://img.shields.io/badge/statement-green)' | pbcopy"

alias reload='source ~/.zshrc'

alias brew-dump='rm -rf ~/setup/homebrew/Brewfile && brew bundle dump --file=~/setup/homebrew/Brewfile'

alias gradle-start="gradle bootRun --args='--spring.profiles.active=local'"

#
# aPriori aliases.
#
alias ats-api='cd ~/projects/apriori-ats-api && pwd'
alias ats-app='cd ~/projects/apriori-ats-app && pwd'
alias bcs-api='cd ~/projects/apriori-bcs-api && pwd'
alias cas-app='cd ~/projects/apriori-cas-app && pwd'
alias cds-api='cd ~/projects/apriori-cds-api && pwd'
alias cic-agt='cd ~/projects/apriori-cic-agt && pwd'
alias cic-app='cd ~/projects/apriori-cic-app && pwd'
alias cid-api='cd ~/projects/apriori-cid-api && pwd'
alias cid-app='cd ~/projects/apriori-cid-app && pwd'
alias cis-api='cd ~/projects/apriori-cis-api && pwd'
alias cis-app='cd ~/projects/apriori-cis-app && pwd'
alias cso-api='cd ~/projects/apriori-cso-api && pwd'
alias cso-app='cd ~/projects/apriori-cso-app && pwd'
alias css-api='cd ~/projects/apriori-css-api && pwd'
alias sds-api='cd ~/projects/apriori-sds-api && pwd'
alias vds-api='cd ~/projects/apriori-vds-api && pwd'
alias dev-stacks='cd ~/projects/apriori-dev-stacks/compose && pwd'
alias edc-api='cd ~/projects/apriori-edc-api && pwd'
alias edc-app='cd ~/projects/apriori-edc-app && pwd'
alias etl-svc='cd ~/projects/apriori-etl-svc && pwd'
alias cpl-svc='cd ~/projects/apriori-cpl-svc && pwd'
alias fms-api='cd ~/projects/apriori-fms-api && pwd'
alias nts-api='cd ~/projects/apriori-nts-api && pwd'
alias qds-api='cd ~/projects/apriori-qds-api && pwd'
alias common='cd ~/projects/apriori-common && pwd'
alias rc='cd ~/projects/apriori-react-common && pwd'
alias setup='cd ~/setup && pwd'
alias nvim-config='cd ~/setup/nvim && pwd'
alias homebrew-config='cd ~/setup/homebrew && pwd'
# EC2
alias ec2-dev='cd ~/projects/devops-ec2-connect/environments/development && pwd'
alias ec2-qa='cd ~/projects/devops-ec2-connect/environments/qa-test && pwd'
alias ec2-prod='cd ~/projects/devops-ec2-connect/environments/production && pwd'
alias ec2-stage='cd ~/projects/devops-ec2-connect/environments/staging && pwd'

# Docker
alias dc-ps='docker-compose ps'
alias dc-ach='docker-compose --profile apriori-cloud-home'
alias dc-core='docker-compose --profile core-services'
alias dc-cid='docker-compose --profile cost-insight-design'
alias dc-cig='docker-compose --profile cost-insight-generate'
alias dc-cis='docker-compose --profile cost-insight-source'
alias dc-cas='docker-compose --profile customer-admin-service'
alias dc-edc='docker-compose --profile electronics-data-collection'
alias dc-persist='docker-compose --profile persistence'
alias dc-provision='docker-compose --profile provisioning up --build'
alias dc-up='docker-compose docker-compose --profile persistence up -d && docker-compose --profile core-services up -d && docker-compose --profile cost-insight-design up -d cid-api && docker-compose --profile cost-insight-source up -d cis-api'
alias rmi-ach-api='docker rmi -f docker.apriori.com/apriori-ach-api:1.1.0-snapshot'
alias rmi-ach-app='docker rmi -f docker.apriori.com/apriori-ach-app:1.1.0-snapshot'
alias rmi-ats-api='docker rmi -f docker.apriori.com/apriori-ats-api:2.0.0-snapshot'
alias rmi-cds-api='docker rmi -f docker.apriori.com/apriori-cds-api:2.0.0-snapshot'
alias rmi-cid-api='docker rmi -f docker.apriori.com/apriori-cid-api:1.0.0-snapshot'
alias rmi-cid-app='docker rmi -f docker.apriori.com/apriori-cid-app:1.0.0-snapshot'
alias rmi-cid-api='docker rmi -f docker.apriori.com/apriori-cid-api:1.0.0-snapshot'
alias rmi-cis-api='docker rmi -f docker.apriori.com/apriori-cis-api:1.2.0-snapshot'
alias rmi-css-api='docker rmi -f docker.apriori.com/apriori-css-api:1.0.0-snapshot'
alias rmi-edc-app='docker rmi -f docker.apriori.com/apriori-edc-app:1.3.0-snapshot'
alias rmi-nts-api='docker rmi -f docker.apriori.com/apriori-edc-api:1.3.0-snapshot'
alias rmi-sds-api='docker rmi -f docker.apriori.com/apriori-sds-api:1.0.0-snapshot'
alias rmi-vds-api='docker rmi -f docker.apriori.com/apriori-vds-api:1.0.0-snapshot'
alias rmi-mongo='docker rmi -f mongo:4.2.0'
alias rmi-mysql='docker rmi -f mysql:5.7'
alias rmi-postgres='docker rmi -f postgres:12.4'
alias rmi-redis='docker rmi -f redis:alpine'lias react-common='cd ~/projects/apriori-react-common && pwd'

alias deploy-sds='
  aws ecs update-service --cluster development-production --service sds --force-new-deployment &&
  aws ecs update-service --cluster development-production --service sds-http-mig --force-new-deployment &&
  aws ecs update-service --cluster development-production --service sds-msg-low --force-new-deployment &&
  aws ecs update-service --cluster development-production --service sds-msg-high --force-new-deployment &&
  aws ecs update-service --cluster development-production --service sds-search --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service sds --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service sds-http-mig --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service sds-msg-low --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service sds-msg-high --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service sds-search --force-new-deployment
'
alias deploy-vds='
  aws ecs update-service --cluster development-production --service vds --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service vds --force-new-deployment
'
alias deploy-gcd='
  aws ecs update-service --cluster development-production --service gcd --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service gcd --force-new-deployment
'
alias deploy-cmp='
  aws ecs update-service --cluster development-production --service cmp --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service cmp --force-new-deployment
'
alias deploy-css='
  aws ecs update-service --cluster development-production --service css --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service css --force-new-deployment
'
alias deploy-cid-api='
  aws ecs update-service --cluster development-production --service cid-api --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service cid-api --force-new-deployment
'
alias deploy-cid-app='
  aws ecs update-service --cluster development-production --service ci-design --force-new-deployment &&
  aws ecs update-service --cluster development-sandbox --service ci-design --force-new-deployment
'

#
# Oh My Zsh
#

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/opt/homebrew/opt/gradle@6/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
