export PATH="/Users/igor.veksler/Desktop/chromedriver:$PATH"
export PATH="/usr/local/bin/python3:$PATH"
export PATH="/usr/local/bin/jupyter:$PATH"

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
alias bball_git='open https://github.com/iveksl2/bball'
alias bball_ref='open http://www.basketball-reference.com/'
alias fiver='open https://www.fiverr.com/'
alias laff='open https://courses.edx.org/courses/course-v1:UTAustinX+UT.5.05x+1T2017/info'
alias matlab='open https://matlab.mathworks.com/'
alias tracker='open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit'
alias goals='open https://docs.google.com/document/d/1wTcu2-DG8MzSTf7kmP_6_mmu5MyW1GzZosbAkSOPboA/edit'
alias toggl='open https://toggl.com/app/timer'
alias confluence='open https://datarobot.atlassian.net/wiki/'

# workflow shortcuts
dr_workflow() {
    dr
    pandora2
    cal
    salesforce
    gdrive  
    omni
}

bball_workflow() {
   bball_git 
   bball_ref 
   fiver
}

class() {
    laff
    matlab
}

weekly_review() {
    tracker
    goals
    mint
    toggl
    omni
}

# manually source zshell plugins
source ~/.oh-my-zsh/custom/plugins/git-it-on/git-it-on.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/send/send.plugin.zsh
source ~/.oh-my-zsh/custom/plugins/git-aliases/git-aliases.plugin.zsh


