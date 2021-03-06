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
export PATH="/usr/local/lib/python3.9/site-packages/jupytext/:$PATH"
export PATH=/usr/local/opt/python3/libexec/bin:$PATH

# aliases
alias calendar='open https://calendar.google.com'
alias cal='open https://calendar.google.com'
alias slack='open https://app.slack.com/client/T02SCLWEU/unreads'
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
alias confluence3='open https://datarobot.atlassian.net/wiki/spaces/PM/overview'
alias workflowy='open https://workflowy.com/'
alias highspot='open https://datarobot.highspot.com/'
alias spotify='open https://open.spotify.com/'
alias notes='open https://keep.google.com/u/0/'
alias worldometer='open https://www.worldometers.info/coronavirus/'
alias myo='open https://docs.google.com/spreadsheets/d/1UFgv1LyP0rzcZ8XHaaQ8TKs3M-tJW4yM/edit#gid=277373036'
# https://stuff-things.net/2015/02/17/open-github-repos-from-the-command-line/
alias gitopen=$'open `git config --get remote.origin.url | awk -F: \'{ print "https://github.com/"$2}\'`'
alias colab='open https://colab.research.google.com/drive/'
alias transition='open https://docs.google.com/document/u/1/d/1oyoaLqU-bDm_E8FwG1_sdXC2X8NBiJCucxQ9R7Vok9c/edit'
alias okta='open https://datarobot.okta.com/app/UserHome'
alias phttps://www.evernote.com/client/webb='open https://datarobot.productboard.com/'
alias jira_example='open https://datarobot.atlassian.net/browse/PBMP-3018'
alias evernote='open https://www.evernote.com/client/web'
alias whimsical='open https://whimsical.com/loan-default-example-XkY5JAgUsweRTdEZLG1MVQ'
alias pb='open https://datarobot.productboard.com/feature-board/1693278-business-ops'
alias staging='open https://staging.datarobot.com/'
alias decisions_slack='open https://app.slack.com/client/T02SCLWEU/C014A4XQ414'
alias cave='open https://app.slack.com/client/T02SCLWEU/C021E7PC85R'
alias zepl='open https://app.zepl.com/ODFHKV0LJ?afterLogin=true'

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
  open https://www.coursera.org/learn/uva-darden-digital-product-management
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
    open https://twitter.com/COVID19Tracking
    open https://twitter.com/fredtrotter
    open https://github.com/CareSet/COVID_Hospital_PUF
}

habits() {
    open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit#gid=1634401545 
}

covid_proj() {
    open https://report-engine.prod.aiapps.datarobot.com/engine/ 
    cd /Users/igor.veksler/dev/covid_report_engine
    docker-compose up -d db
    source .envrc
    open /Applications/PyCharm.app
    notes
    open https://github.com/datarobot/covid_report_engine
    open https://www.okta.com/
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

function unzip_and_rezip() {
    unzip $1
    new_f=$(ls *.csv | head -1)
    csv_no_ws=$(echo "$new_f" | tr ' ' '_') # fucking whitespace in filenames
    mv $new_f $csv_no_ws
    # https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
    eval "zip ${csv_no_ws%.*}.zip $csv_no_ws"  
    rm $csv_no_ws
    rm $1 # remove original since we changed the filename to remove whitespace
}

# Useful startup articles
# https://dev.to/malwarebo/how-to-set-python3-as-a-default-python-version-on-mac-4jjf

