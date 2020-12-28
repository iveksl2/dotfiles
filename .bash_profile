# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.ba:q
uhrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -x $HOME/bin/diagnostics ]; then
    $HOME/bin/diagnostics login || true
fi

export PATH="/usr/local/bin/python3:$PATH"
export PATH="/library/textbin/:$PATH"
export PATH="/Library/TeX/texbin:$PATH"

export PATH="/Users/igor.veksler/Desktop/chromedriver:$PATH"
export PATH="/usr/local/bin/python3:$PATH"
export PATH="/usr/local/bin/jupyter:$PATH"
export PATH="/library/texbin/:$PATH"
#export PATH="/usr/local/bin/:$PATH"

# aliases
alias calendar='open https://calendar.google.com'
alias cal='open https://calendar.google.com'
alias slack='open https://slack.com/signin'
alias mail='open https://mail.google.com/'
alias gdrive='open https://drive.google.com/'
alias drive=gdrive
alias timer='open https://tomato-timer.com'
alias datarobot='open https://app.datarobot.com/'
alias dr=datarobot
alias drdocs='open https://app.datarobot.com/docs/'
alias eats='open https://www.ubereats.com/'
alias salesforce='open https://datarobot.my.salesforce.com/home/home.jsp'
alias tracker='open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit'
alias toggl='open https://toggl.com/app/timer'
alias confluence='open https://datarobot.atlassian.net/wiki/'
alias confluence2='open https://datarobot.atlassian.net/wiki/spaces/CFDS/overview'
alias workflowy='open https://workflowy.com/'
alias highspot='open https://datarobot.highspot.com/'
alias spotify='open https://open.spotify.com/'
alias notes='open https://keep.google.com/u/0/'
alias worldometer='open https://www.worldometers.info/coronavirus/'
alias myo='open https://docs.google.com/spreadsheets/d/1-V4J4GuDSQN31__SA3NQCaJGOjBicIiJ/edit#gid=2109539794'
# https://stuff-things.net/2015/02/17/open-github-repos-from-the-command-line/
alias gitopen=$'open `git config --get remote.origin.url | awk -F: \'{ print "https://github.com/"$2}\'`'


# workflow shortcuts
dr_workflow() {
    dr
    cal
    salesforce
    gdrive  
    workflowy
    open /Applications/Spotify.app/
}

class() {
   open https://www.coursera.org/learn/slides/lecture/nAlje/trailer
}


weekly_review() {
    open https://track.toggl.com/timer 
    workflowy
    open https://www.coach.me/dashboard
    open https://todoist.com/productivity-methods/weekly-review
}

dating() {
    open http://www.match.com
    open http://www.okcupid.com
    open https://www.seeking.com/member
}

corona() {
    open https://twitter.com/EricTopol
    open https://www.bing.com/covid
    open https://www.worldometers.info/coronavirus/
    open https://twitter.com/florian_krammer
    open https://twitter.com/mlipsitch
    open https://twitter.com/nataliexdean
    open https://twitter.com/reichlab
    open https://twitter.com/scottgottliebmd
    open https://twitter.com/edyong209
    open https://twitter.com/COVID19Tracking
    open https://twitter.com/fredtrotter
}

habits() {
    open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit#gid=1634401545 
}

covid_proj() {
    open https://report-engine.prod.aiapps.datarobot.com/engine/ 
    cd /Users/igor.veksler/dev/covid_report_engine
    docker-compose up -d db
    source .env
    open /Applications/PyCharm.app
    notes
    open https://github.com/datarobot/covid_report_engine
    poetry run jupyter lab
}

# https://stackoverflow.com/questions/19595067/git-add-commit-and-push-commands-in-one
function send() {
    git add .
    git commit -a -m "$1"
    git push
}

# https://jasonneylon.wordpress.com/2011/04/22/opening-github-in-your-browser-from-the-terminal/
# Opens the github page for the current git repo/branch in your browser
function gitit() {
  giturl=$(git config –get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl
}

