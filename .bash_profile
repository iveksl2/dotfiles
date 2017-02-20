# added by Anaconda3 4.2.0 installer
#export PATH="/Users/igor.veksler/anaconda/bin:$PATH"
export PATH="/Users/igor.veksler/Desktop/chromedriver:$PATH"

# aliases
alias todo='vim ~/Desktop/todo.txt'
alias omni='open /Applications/OmniFocus.app/'
alias calendar='open https://calendar.google.com'
alias cal='open https://calendar.google.com'
alias slack='open /Applications/Slack.app'
alias mail='open https://mail.google.com/'
alias gdrive='open https://drive.google.com/'
alias drive=gdrive
alias timer='open https://tomato-timer.com'
alias yelp='open https://www.yelp.com'
alias datarobot='open https://app.datarobot.com/'
alias dr=datarobot
alias nba='open http://www.espn.com/nba/scores'
alias pandora='open https://www.pandora.com/music/classical/classical'
alias pandora2='open https://www.pandora.com/station/play/3466458669562850606'
alias webex='open https://datarobot.webex.com/mw3100/mywebex/default.do?siteurl=datarobot'
alias eats='open https://www.ubereats.com/'
alias salesforce='open https://datarobot.my.salesforce.com/home/home.jsp'
alias bball='open https://github.com/iveksl2/bball'
alias bball_ref='open http://www.basketball-reference.com/'
alias fiver='open https://www.fiverr.com/'
alias laff='open https://courses.edx.org/courses/course-v1:UTAustinX+UT.5.05x+1T2017/info'
alias matlab='open https://matlab.mathworks.com/'

# workflow shortcuts
dr_work() {
    dr
    pandora
    cal
    salesforce
    gdrive  
}

bball_work() {
   bball 
   bball_ref 
   fiver
}

class() {
    laff
    matlab
}

# manually source zshell plugins
source ~/.oh-my-zsh/custom/plugins/git-it-on/git-it-on.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/send/send.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/git-aliases/git-aliases.plugin.zsh


