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
export PATH="/usr/local/lib/python3.9/site-packages/jupytext/:$PATH"
export PATH=/usr/local/opt/python3/libexec/bin:$PATH
export PATH=$USER/.local/bin:$PATH
export PATH="/Users/iveksl2/Library/Python/3.8/bin/wandb:$PATH"

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
alias salesforce='open https://wandb.my.salesforce.com/'
alias tracker='open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit'
alias toggl='open https://toggl.com/app/timer'
alias workflowy='open https://workflowy.com/'
alias highspot='open https://datarobot.highspot.com/'
alias spotify='open https://open.spotify.com/'
alias notes='open https://keep.google.com/u/0/'
alias worldometer='open https://www.worldometers.info/coronavirus/'
alias myo='open https://www.udemy.com/course/myofunctional-therapy-for-obstructive-sleep-apnea/'
# https://stuff-things.net/2015/02/17/open-github-repos-from-the-command-line/
alias gitopen=$'open `git config --get remote.origin.url | awk -F: \'{ print "https://github.com/"$2}\'`'
alias colab='open https://colab.research.google.com/drive/'
alias transition='open https://docs.google.com/document/u/1/d/1oyoaLqU-bDm_E8FwG1_sdXC2X8NBiJCucxQ9R7Vok9c/edit'
alias okta='open https://datarobot.okta.com/app/UserHome'
alias jira_example='open https://datarobot.atlassian.net/browse/PBMP-3018'
alias evernote='open https://www.evernote.com/client/web'
alias whimsical='open https://whimsical.com/loan-default-example-XkY5JAgUsweRTdEZLG1MVQ'
alias pb='open https://wandb.productboard.com/feature-board/5191870-sweeps'
alias staging='open https://staging.datarobot.com/'
alias daily_review='open https://docs.google.com/document/d/1MJWZZWYUf458i-rOTByEfxMGU0z_MDqXtmzwNWWtDqM/edit'
alias habit_log='open https://docs.google.com/spreadsheets/d/1lx30t0jTl7HB7D6EPabL8mR7VOxl4Qg78uhU8eVtG74/edit#gid=0'
alias wnb='open https://wandb.ai/home'
alias notion='open https://www.notion.so/wandbai/' 
alias metaculus='open https://www.metaculus.com/questions/'
alias jira='open https://wandb.atlassian.net/jira/software/c/projects/WB/boards/62'
alias mode='open https://app.mode.com/wandb/spaces/48c2f82c10d1'
alias mixpanel='open https://mixpanel.com/project/2536428/view/3076760/app/dashboards#id=3213147'
alias intercom='open https://app.intercom.com/'
alias docs='open https://docs.wandb.ai/'# left off on hyper-parameter tuning 
alias gitbook='open https://app.gitbook.com/o/-Lr2SEfv2R3GSuF1kZCt/s/-Lqya5RvLedGEWPhtkjU-1972196547/'
alias udemy='open https://www.udemy.com/'
alias sheets='open https://www.google.com/sheets/about/'
alias figma='open https://www.figma.com/'
alias chorus='open https://chorus.ai/dashboard'
alias gitbook='open https://app.gitbook.com/o/-Lr2SEfv2R3GSuF1kZCt/s/-Lqya5RvLedGEWPhtkjU-1972196547/'
alias workout="open http://www.youtube.com/watch?v=w-G6NKP-fe8&t=168s"
alias docsedit='open https://app.gitbook.com/'


# workflow shortcuts

daily() {
  habit_log 
  workflowy
}

social() {
  open https://docs.google.com/document/d/1EIagE85wyUOv-SAZ7ADqZbqfF3thMHEG2H3OzA6Kypo/edit 
}

sleep() {
  open https://docs.google.com/document/d/1OKvPdIN2OuKcCvDx--zFRoJPvia3L5K4ycRGALyd3_c/edit
}

food() {
  open https://docs.google.com/document/d/122wDR3NTpJyRT0NPqpBwEqdtQviNOSsj3WeMbFPkfNo/edit
  open https://docs.google.com/spreadsheets/d/1lx30t0jTl7HB7D6EPabL8mR7VOxl4Qg78uhU8eVtG74/edit#gid=0 
}


llass() {
    open https://www.coursera.org/learn/experimentation/home/
    open https://wandb.ai/site/tutorials
    open /Users/iveksl2/Downloads/NNFS.pdf # 335 
    open https://fullstackdeeplearning.com/course/2022/
    open https://github.com/full-stack-deep-learning/fsdl-text-recognizer-2022-labs
    open https://drive.google.com/drive/u/0/my-drive
    open https://campus.datacamp.com/courses/monte-carlo-simulations-in-python/
    open https://blog.dataiku.com/how-to-perform-basic-ml-training-with-scikit-learn-docker-and-kubernetes
    open https://blog.dataiku.com/how-to-perform-basic-ml-serving-with-python-docker-kubernetes
    cd /Users/iveksl2/dev/nn_from_scratch
    code .
}

finance() {
    open https://docs.google.com/spreadsheets/d/1KjhfhhdLs1v-f_w6BGCKR8LxGWEOz3wMffX4_pMxbB4/edit#gid=0 
    open https://docs.google.com/document/d/16I47Y1j3_AandbcAIClulEV4FZ3aRAEjfqPOKQ2j5Uk/edit #"trading signal library"
}

weekly_review() {
    open https://track.toggl.com/timer 
    workflowy
    open https://www.asianefficiency.com/start-here/
    habit_log
    open https://docs.google.com/document/d/1nfnMY_sWiy-GZNOM3kWHXTDXPDTKeb-k08QD4TPlNQI/edit
    open https://docs.google.com/document/d/1OKvPdIN2OuKcCvDx--zFRoJPvia3L5K4ycRGALyd3_c/edit
    open https://docs.google.com/document/d/1EIagE85wyUOv-SAZ7ADqZbqfF3thMHEG2H3OzA6Kypo/edit
    open https://track.toggl.com/timer?utm_source=toggl-button&utm_medium=referral
}

dating() {
    open http://www.match.com
    open https://docs.google.com/document/d/1EIagE85wyUOv-SAZ7ADqZbqfF3thMHEG2H3OzA6Kypo/edit
}

habits() {
    habit_log 
}

pm() {
    workflowy 
    notion
    mode
    wnb
    mixpanel
    open https://app.fullstory.com/
    open https://www.notion.so/wandbai/Data-Primer-Product-8c32c130390c48658acc35ffff730c4c 
    open https://app.mode.com/wandb/reports/48f1302d2f51
}

beta_customers() {
    open https://www.notion.so/wandbai/Red-Bull-Beta-Clips-404938fa3976453280f305b5ccd7e1d7 
    open https://www.notion.so/wandbai/Gong-Beta-Clips-c11dd08218c44f6f8246740cd277208a
    open https://www.notion.so/wandbai/Humane-Beta-Clips-443f6c603fe1488b8895bf8072811256
}

webinar() {
    open https://docs.google.com/presentation/d/1xIBwuKahDkyCDE-5S3bEwvne71xQjB8-p9fomBOKeXA/edit#slide=id.g1546c866baf_0_275 
    cd /Users/iveksl2/dev/examples/
    open https://www.notion.so/wandbai/Jobs-vs-Runs-FAQ-0f7bfc9b8c2f4cf0b60369fdad04ca12    
    open https://docs.wandb.ai/guides/launch#launch-quickstart
    open https://www.notion.so/wandbai/Demo-for-Webinar-b8fa4e6c0cf84f8982b7478f97ef181d
    open https://beta.wandb.ai/home
}



class() {
    open https://www.udemy.com/course/hyperparameter-optimization-for-machine-learning/learn/lecture/26286796#overview
    open https://www.clearerthinking.org/tools-and-mini-courses
    open https://www.kaggle.com/learn/advanced-sql 
    open https://academy.productboard.com/set-up-your-jira-integration
    open "https://campus.datacamp.com/courses/mlops-concepts/design-and-development?ex=9"
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

exercise() {
  open https://www.youtube.com/watch?v=0xfDmrcI7OI        
}
