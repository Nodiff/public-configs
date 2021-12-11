
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump)

source ~/.bash_profile
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
#source ~/.bash_profile
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias code='/Applications/Visual\ Studio\ Code\ 3.app/Contents/Resources/app/bin/code'
alias atom='/Applications/Atom.app/Contents/MacOS/Atom'
alias ts='ts-node'
alias __gethd='git symbolic-ref --short -q HEAD'
alias gcm='git commit -m '
alias gpo='git push origin `__gethd`'
alias gad='git add '
alias greset='git reset --hard HEAD'
alias gfp='git fetch && git pull'
alias gft='git fetch'
alias gpl='git pull'
alias gcob='git checkout -b'
alias gbu='git branch --set-upstream-to=origin/`__gethd` `__gethd`'
alias gac='func(){gad $1;gcm $2;};func'
alias gacp='func(){gad $1;gcm $2;gpo;};func'
alias gpick='git cherry-pick '
alias gdiff='git icdiff '
alias gmg='git merge'
alias gtag='func(){git tag $1;git push origin $1;};func'
alias gbl='git branch --list'
alias gls='git branch --list'
alias gct='git ls-files -u  | cut -f 2 | sort -u'
alias gdelb='func(){git branch -D $1;};func'
alias gdelt='func(){git tag -d $1;};func'
alias gdelr='func(){git push origin :$1;};func'
alias gdelball='func(){gdelb $1 && gdelr $1;};func'
alias gdeltall='func(){gdelt $1 && gdelr $1;};func'
alias bat='func(){for tg in $1;do echo $tg;done};func'
# alias testb='echo `git tag | grep 202108`'
# for tg in `git tag | grep 202108`;do echo $tg;done
# for tg in `git tag | grep 202107`;do gdeltall $tg;done

# 代码统计
alias _thisWeek='date -r $((`date '+%s'` - (`date +%w`) * 86400)) "+%Y-%m-%d 00:00:00"'
alias _thisMonth='date -r $((`date '+%s'` - (`date +%d` - 1) * 86400)) "+%Y-%m-%d 00:00:00"'
alias _todayEnd='date "+%Y-%m-%d 23:59:59"'
alias codeLine="func(){git log --author=\$1 --after=\$2 --before=\$3 --pretty=tformat: --numstat | grep -v 'static' | awk '{ add += \$1 ; subs += \$2 ; loc += \$1 + \$2 } END { print \"新增代码数:\" add, \"删除代码数:\" subs, \"合计:\" loc }';};func"
alias cl='codeLine'
alias codeLineW='cl "`git config user.name`" "`_thisWeek`" "`_todayEnd`"'
alias codeLineM='cl "`git config user.name`" "`_thisMonth`" "`_todayEnd`"'
alias codeLineLW='cl "`git config user.name`" "2021-08-15 00:00:00" "2021-08-21 23:59:59"'
alias codeLineWWho='func(){cl "$1" "`_thisWeek`" "`_todayEnd`"};func'
alias codeLineMWho='func(){cl "$1" "`_thisMonth`" "`_todayEnd`"};func'
alias _clw='codeLineW'
alias _clm='codeLineM'


# 代码统计全部
alias thisWeek='date -r $((`date '+%s'` - (`date +%w` - 1) * 86400)) "+%Y-%m-%d"'
alias thisMonth='date -r $((`date '+%s'` - (`date +%d` - 1) * 86400)) "+%Y-%m-%d"'
alias tomorrow='date -r $((`date '+%s'` + 86400)) "+%Y-%m-%d"'
alias clw='curl -X POST 10.8.110.111:8001/gitCommitInfo -H "key: PMO" -H "Content-Type: application/json" --data-raw "{\"realName\": \"`git config user.name`\",\"startDate\": \"`thisWeek`\",\"endDate\": \"`tomorrow`\"}"'
alias clm='curl -X POST 10.8.110.111:8001/gitCommitInfo -H "key: PMO" -H "Content-Type: application/json" --data-raw "{\"realName\": \"`git config user.name`\",\"startDate\": \"`thisMonth`\",\"endDate\": \"`tomorrow`\"}"'

alias dk='docker'
alias dki='dk image'
alias dkc='dk container'
alias dks='func(){sudo docker commit -m $1 -a $2 $3 $4;};func'
alias dkrec='func(){docker container start $1 && docker container attach $1;};func'

alias fssh='/Users/Roy/scripts/common/auto-login.sh '
alias fwin='fssh roy@10.107.77.44 Aaaa1111 22'
alias roylinux='/Users/Roy/scripts/common/auto-login.sh roy@localhost 123456 2222'
alias sshz='/Users/Roy/scripts/common/auto-login.sh '
alias javacc='/Users/Roy/scripts/auto-java/auto-java.sh '

#======= goto dir ========
alias goto-work='cd /Users/Roy/Documents/vipshop/vip-work'
alias goto-static='cd /Users/Roy/Documents/vipshop/vip-work/mjr-static'
alias goto-pt='cd /Users/Roy/Documents/vipshop/vip-work/front-end/vue-v2/pingtuan'
alias goto-mjr='cd /Users/Roy/Documents/vipshop/vip-work/mjr'
alias goto-earn='cd /Users/Roy/Documents/vipshop/vip-work/front-end/vue-v2/enterearn'
alias goto-admin='cd /Users/Roy/Documents/vipshop/vip-work/jrapp-admin-frontend'
alias goto-fe='cd /Users/Roy/Documents/vipshop/vip-work/front-end/vue-v2'
alias goto-dev='cd /Users/Roy/dev'
alias goto-df='cd /Users/Roy/dev'

#======= pm2 command ===========
alias pls='pm2 ls'
alias plg='pm2 logs'
alias pstart='pm2 start'
alias pstop='pm2 stop'
alias prestart='pm2 restart'
alias psave='pm2 save'
alias precover='pm2 resurrect'
# 停止所有pm2进程
alias pm2-stop-all='pm2 stop all'
# 杀死所有pm2进程
alias pm2-kill-all='pm2 delete all'
alias pm2-killall='pm2 delete all'
alias pdel='pm2 delete'
alias pd='pdel'
alias pmn='func(){pm2 -n $1 start npm -- run $2;};func'


#========eslint=========
alias e='eslint'
alias ef='eslint --fix'

#======== other command ========
alias mkcd='func(){mkdir $1 && cd $1;};func'
alias p2='python'
alias p3='python3'

# ======admin area========
# vue新版admin
alias goto-admin-vue='cd /Users/Roy/Documents/vipshop/vip-work/jrapp-admin-frontend/vue-v2/app-admin'
# angular 4版admin
alias goto-admin-ng='cd /Users/Roy/Documents/vipshop/vip-work/jrapp-admin-frontend-new'
# 旧版admin
alias goto-admin='cd /Users/Roy/Documents/vipshop/vip-work/jrapp-admin'
# admin静态资源
alias goto-admin-static='cd /Users/Roy/Documents/vipshop/vip-work/jrapp-vpjr-static'

#=======其他 alias=======
alias goto-md='cd /Users/Roy/Documents/markdown'
alias goto-action='cd /Users/Roy/Documents/work/study/actions' 
alias goto-private='cd /Users/Roy/Documents/privatework'
alias goto-mall='cd /Users/Roy/Documents/privatework/stb/fe-mall'

# #====== shot ======
# alias run-admin='pm2-kill-all && pm2-admin-vue && pm2 logs'

alias pret='npx prettier --write'

alias dn='deno run'
alias tsr='deno run'

# #Auto command list area========================++++++++++++++++++++++++++++++++================
# alias xfd='/Users/Roy/scripts/auto-work/action.sh'
# alias xfdend='/Users/Roy/scripts/auto-work/action-end.sh'
# alias xfdcfg='/Users/Roy/scripts/auto-work/action-cfg.sh '

# alias account='/Users/Roy/scripts/auto-work/account.sh'
# alias accountend='/Users/Roy/scripts/auto-work/account-end.sh'

# # alias opendev='vim /Users/Roy/work-doc/开发功能文档.md'
# # alias opencfg='vim /Users/Roy/work-doc/开发说明文档.md'
# # alias opentest='vim /Users/Roy/work-doc/开发测试文档.md'

alias vimz='vim ~/.zshrc'
alias srcz='source ~/.zshrc'
alias m='cmatrix'
alias findip='ifconfig | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -voE "255|\.0\."'
alias ip='findip'
alias v='vim'

alias ta='tmux a'

alias hi='echo macbook'
#Auto command list area========================++++++++++++++++++++++++++++++++================
#
#
#
#alias exists command area========================++++++++++++++++++++++++++++++++================
alias rmr='rm -r'
#
#alias exists command area========================++++++++++++++++++++++++++++++++================
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export MAGICK_HOME="/fitness/serve/ImageMagick"



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export ANDROID_HOME=/Users/Roy/env/Android/android-sdk-macosx
export PATH="$PATH:/Users/Roy/env/Android/android-sdk-macosx/tools:/Library/dart-sdk/bin"
export PATH="$MAGICK_HOME/bin:$PATH"
[[ -s $(brew --prefix)/usr/local/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/usr/local/etc/profile.d/autojump.sh

# LD_LIBRARY_PATH="${LD_LIBRARY_PATH:+$LD_LIBRARY_PATH:}$MAGICK_HOME/lib"
# export LD_LIBRARY_PATH
eval $(thefuck --alias)
# export JAVA_OPTS="-Dspring.profiles.active=development -Dasgard.profile=staging -Dfile.encoding=UTF-8 -DVIP_CFGCENTER_ZK_CONNECTION=10.199.241.136:2181,10.199.239.169:2181,10.199.217.209:2181 -Dosp.static.route='com.vip.finance.fund.service:.*:.*=10.107.76.51:1080' -DVIP_CFGCENTER_PARTITION=default -DVMS_ENV=STAGING"
# export JAVA_OPTS="-Dspring.profiles.active=development -Dasgard.profile=staging -Dfile.encoding=UTF-8 -Dosp.static.route='com.vip.xfd.osp.account.service.*:.*:.*=10.107.103.151:1080;' -DVIP_CFGCENTER_PARTITION=default -DVMS_ENV=STAGING"
# export VMS_ENV="staging"
# export VMS_DOMAIN="xg-open-account.api.vip.com"
# export ASGARD_PROFILE="staging"

export VMS_ENV=DEV
export VMS_DOMAIN=osp-finance-fund.api.vip.com
export APP_NAME=osp-finance-fund.api.vip.com
export ASGARD_PROFILE=dev
