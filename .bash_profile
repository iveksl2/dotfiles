export PATH="/Users/igor.veksler/Desktop/chromedriver:$PATH"
export PATH="/usr/local/bin/python3:$PATH"
export PATH="/usr/local/bin/jupyter:$PATH"
export PATH="/library/texbin/:$PATH"
#export PATH="/usr/local/bin/:$PATH"

# aliases
alias todo='vim ~/Desktop/todo.txt'
alias calendar='open https://calendar.google.com'
alias cal='open https://calendar.google.com'
alias slack='open https://slack.com/signin'
alias mail='open https://mail.google.com/'
alias gdrive='open https://drive.google.com/'
alias drive=gdrive
alias timer='open https://tomato-timer.com'
alias yelp='open https://www.yelp.com'
alias datarobot='open https://app.datarobot.com/'
alias dr=datarobot
alias drdocs='open https://app.datarobot.com/docs/'
alias nba='open http://www.espn.com/nba/scores'
alias pandora='open https://www.pandora.com/music/classical/classical'
alias pandora2='open https://www.pandora.com/station/play/3466458669562850606'
alias webex='open https://datarobot.webex.com/mw3100/mywebex/default.do?siteurl=datarobot'
alias eats='open https://www.ubereats.com/'
alias salesforce='open https://datarobot.my.salesforce.com/home/home.jsp'
alias tracker='open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit'
alias goals='open https://docs.google.com/document/d/1wTcu2-DG8MzSTf7kmP_6_mmu5MyW1GzZosbAkSOPboA/edit'
alias toggl='open https://toggl.com/app/timer'
alias confluence='open https://datarobot.atlassian.net/wiki/'
alias confluence2='open https://datarobot.atlassian.net/wiki/spaces/CFDS/overview'
alias admin_dashboard='open https://chartio.com/datarobot/admin-dashboard-gourab/?DROPDOWN=Alison+Gudmundsen&DROPDOWN=Duncan+Renfrow-Symon&DROPDOWN=Eric+Nussbaumer&DROPDOWN=Vijay+Rajan&DROPDOWN=Chad+Harness&DROPDOWN=Nick+Hamwey&DROPDOWN=Igor+Veksler&DROPDOWN=Cory+Kind&DROPDOWN=Jake+Snyder'
alias admin_all='open https://chartio.com/datarobot/admin-dashboard-gourab/?DROPDOWN=Alison+Gudmundsen&DROPDOWN=Eric+Nussbaumer&DROPDOWN=Jake+Snyder&DROPDOWN=Duncan+Renfrow-Symon&DROPDOWN=Vijay+Rajan&DROPDOWN=Igor+Veksler&DROPDOWN=Chad+Harness&DROPDOWN=Nick+Hamwey&DROPDOWN=Cory+Kind'
alias people='open https://drive.google.com/drive/u/0/folders/1Ll2eN8p5LXpYg3wvNRQMExnAhPOpv6cN'
alias notes='cd /Users/iveksl2/dev/notes/'
alias workflowy='open https://workflowy.com/'
alias highspot='open https://datarobot.highspot.com/'
alias spotify='open https://open.spotify.com/'

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
   open https://campus.datacamp.com/courses/software-engineering-for-data-scientists-in-python/software-engineering-data-science
   open https://www.coursera.org/learn/slides/lecture/nAlje/trailer
}


weekly_review() {
    goals
    toggl
    habits
    open https://todoist.com/productivity-methods/weekly-review
}

dating() {
    open http://www.match.com
    open http://www.okcupid.com
    open https://www.seeking.com/member
}

# manually source zshell plugins
#source ~/.oh-my-zsh/custom/plugins/git-it-on/git-it-on.plugin.zsh
# source ~/.oh-my-zsh/custom/plugins/send/send.plugin.zsh
# source ~/.oh-my-zsh/custom/plugins/git-aliases/git-aliases.plugin.zsh

export github_pat='f49392806206497f60521fbe5255e80b7fe75896'

# https://github.com/robertzk/send.zsh/blob/master/send.plugin.zsh
pull() {
  if [ $# -eq 2 ]; then
    git pull --rebase -q $2 "$(git rev-parse --abbrev-ref HEAD)"
  else
    git pull --rebase -q origin "$(git rev-parse --abbrev-ref HEAD)"
  fi
}

push() {
  if [ $# -eq 2 ]; then
    git push -q $2 "$(git rev-parse --abbrev-ref HEAD)"
  else
    git push -q origin "$(git rev-parse --abbrev-ref HEAD)"
  fi
}

send() {
  git add "$(git rev-parse --show-toplevel)"
  if [ $# -eq 1 ]; then
    git commit -a -m "$1"
  else
    git commit -a -m "I'm too lazy to write a commit message."
  fi
  pull
  push
}
#!/bin/zsh
__open() {
  if [ "$(uname -s)" = "Darwin" ]; then
    open "$1" 2> /dev/null
  else
    xdg-open "$1" &> /dev/null
  fi
}

__set_remote_branch() {
    branch=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2> /dev/null)
    if [ $? -eq 0 ]; then
        branch="${branch/origin\//}"
    else
        false
    fi
}
__set_local_branch() {
    branch=$(git rev-parse --abbrev-ref HEAD)
}

# check if local branch is tracked upstream;
# if not, set $branch to first remote branch (probably master from origin/master)
__fix_local_untracked_branch() {
  for line in $(git rev-parse --abbrev-ref --remotes); do
    if [[ "$branch" == ${line/*\//} ]]; then return true; fi
  done

  local _branch=$(git rev-parse --abbrev-ref --remotes | head -n1)
  branch=${_branch/*\//}
}

git_set_repo() {
  repo_url=$(git config --get remote.origin.url)
  if ! __set_remote_branch; then __set_local_branch; fi
  __fix_local_untracked_branch
  url="${repo_url/git/https}"
  url="${url/httpshub/github}"
  url="${url/.git/}"
  url="${url/https@/https://}"
  url="${url/com:/com/}"
  url="${url/edu:/edu/}"
  url="${url/org:/org/}"
  url="${url/ssh:\/\/}"
}


git_open_file() {
  file_path="$1"
  git_set_repo
  if [ ! -f $file_path ] && [ ! -d $file_path ]; then
    echo "$file_path does not exist"; echo ""; git_help
    return
  fi

  if [ "$#" -eq 2 ]; then branch="$2"; fi
  if [ -d $1 ]; then
    local cdtohere=$1
    local zone='tree'
  else
    local cdtohere="."
    local zone='blob'
  fi

  local file=$(echo "$(cd $cdtohere; pwd)" | cut -c "$((1+${#$(git rev-parse --show-toplevel)}))-")
  url="$url/$zone/$branch$file"

  if [ -d $1 ]; then
    url=$url
  else
    url="$url/$1"
  fi

  __open $url
}


git_open_compare() {
  git_set_repo
  if [ "$#" -ne 0 ]; then
    branch="$1"
  fi
  __open "$url/compare/$branch"
}


git_open_commits() {
  git_set_repo
  if [ "$#" -ne 0 ]; then
    branch="$1"
  fi
  __open "$url/commits/$branch"
}


git_open_history() {
  file_name="$1"
  git_set_repo
  if [ "$#" -eq 2 ]; then
    branch="$2"
  fi
  __open "$url/commits/$branch/$file_name"
}


git_open_branch() {
  branch_name="$1"
  git_set_repo
  if [ "$#" -eq 0 ]; then
    git_open_file
  else
    __open "$url/tree/$branch_name"
  fi
}


git_branches() {
  git_set_repo
  if [ "$#" -eq 0 ]; then
    local loc="active"
  elif [ "$1" = "mine" ]; then
    local loc="yours"
  else
    local loc=$1  # active, stale, all
  fi
  __open "$url/branches/$loc"
}


git_open_pulls() {
  git_set_repo
  shift
  if [ "$#" -eq 0 ]; then
    __open "$url/pulls"
  elif [ $1 -ge 0 2>/dev/null ]; then
    __open "$url/pull/$1"
  else
    __open "$url/pulls?q=$@"
  fi
}

git_open_issues() {
  git_set_repo
  shift
  if [ "$#" -eq 0 ]; then
    __open "$url/issues"
  elif [ $1 -ge 0 2>/dev/null ]; then
    __open "$url/issues/$1"
  else
    __open "$url/issues?q=$@"
  fi
}

git_grep() {
  git_set_repo
  if [[ "${2}" == "${2% *}" ]]; then
    shift
    url="$url/search?q=$@"
  else
    url="$url/search?q=\"$2\""
  fi
  __open $url
}


git_ctrlp() {
  git_set_repo
  if [ "$#" -eq 0 ]; then
    branch="master"
  else
    branch=$1
  fi
  __open "$url/find/$branch"
}


git_open_repo() {
  if [ "$#" -eq 2 ]; then
    username="$1"
    reponame="$2"
    __open "http://www.github.com/$username/$reponame"
  else
    git_open_file $1
  fi
}

gitlab_open_compare() {
	git_set_repo
	shift
	if [ "$#" -eq 0 ]; then
		src="$(git rev-parse --abbrev-ref HEAD)"
		target="master"
	elif [ "$#" -eq 1 ]; then
		src="$(git rev-parse --abbrev-ref HEAD)"
		target="$1"
	else
		src="$2"
		target="$1"
	fi
	__open "$url/compare/$target...$src"
}

gitlab_open_branches() {
  git_set_repo
  __open "$url/branches"
}

gitlab_open_network() {
	git_set_repo
	local branch="$(git rev-parse --abbrev-ref HEAD)"
	__open "$url/network/$branch"
}

gitlab_ctrlp() {
  git_set_repo
  if [ "$#" -eq 0 ]; then
    branch="master"
  else
    branch=$1
  fi
  __open "$url/find_file/$branch"
}

gitlab_open_merges() {
  git_set_repo
  shift
  if [ "$#" -eq 0 ]; then
    __open "$url/merge_requests"
  elif [ $1 -ge 0 2>/dev/null ]; then
    __open "$url/merge_requests/$1"
  else
    __open "$url/merge_requests?scope=all&utf8=✓&state=opened&search=$@"
  fi
}

git_help() {
  echo 'GIT IT ON'
  echo '============='
  echo '* `gitit` -- open your current folder, on your current branch, in GitHub or GitLab.'
  echo '* `gitit <folder or file>` -- open that folder in your current branch (paths are relative).'
  echo '* For more, visit https://github.com/peterhurford/git-it-on.zsh or type `gitit repo peterhurford git-it-on.zsh`'
  echo ''
  echo 'Available first arguments for GitHub repos:'
  echo -e '\tcompare, commits, history, branch, branches, pulls, issues, grep, ctrlp, repo, help'
  echo 'For GitLab repos:'
  echo -e '\tglcompare|glcm, glcommits|glco, glhistory|glh, glbranches|glb, glmerges|glm, glissues|gli, glctrlp|glcr, glnetwork|gln, help'
}


gitit() {
  gitit_command="$1"
  if [ $# -eq 0 ]; then git_open_file

  # github commands
  elif [ $gitit_command = "compare" ]; then git_open_compare $2
  elif [ $gitit_command = "commits" ]; then git_open_commits $2
  elif [ $gitit_command = "history" ]; then git_open_history $2 $3
  elif [ $gitit_command = "branch" ]; then git_open_branch $2
  elif [ $gitit_command = "branches" ]; then git_branches $2
  elif [ $gitit_command = "pulls" ]; then git_open_pulls $@
  elif [ $gitit_command = "issues" ]; then git_open_issues $@
  elif [ $gitit_command = "grep" ]; then git_grep $@
  elif [ $gitit_command = "ctrlp" ]; then git_ctrlp $2
  elif [ $gitit_command = "repo" ]; then git_open_repo $2 $3

  # gitlab commands
  elif [ $gitit_command = "glcompare" ]  || [ $gitit_command = "glcm" ]; then gitlab_open_compare $@
  elif [ $gitit_command = "glcommits" ]  || [ $gitit_command = "glco" ]; then git_open_commits $2
  elif [ $gitit_command = "glhistory" ]  || [ $gitit_command = "glh" ]; then git_open_history $2 $3
  elif [ $gitit_command = "glbranches" ] || [ $gitit_command = "glb" ]; then gitlab_open_branches
  elif [ $gitit_command = "glmerges" ]   || [ $gitit_command = "glm" ]; then gitlab_open_merges $@
  elif [ $gitit_command = "glissues" ]   || [ $gitit_command = "gli" ]; then git_open_issues $@
  elif [ $gitit_command = "glctrlp" ]    || [ $gitit_command = "glcr" ]; then gitlab_ctrlp $2
  elif [ $gitit_command = "glnetwork" ]  || [ $gitit_command = "gln" ]; then gitlab_open_network

  elif [ $gitit_command = "help" ]; then git_help
  else git_open_file $1 $2
  fi
}

corona() {
    open https://www.bing.com/covid
    open https://www.worldometers.info/coronavirus/
    open https://twitter.com/florian_krammer
    open https://twitter.com/mlipsitch
    open https://twitter.com/nataliexdean
    open https://twitter.com/reichlab
    open https://twitter.com/scottgottliebmd
}


habits() {
    open https://docs.google.com/spreadsheets/d/1C8scKXJSrYqobvAsuOSLn9fdi2ZeTf958qebshyQai4/edit#gid=1634401545 
}

covid_proj() {
    open https://docs.google.com/document/d/14ooui2AV1AKqrtsC_mhIPBumWYLwJXzN59spjHGodpI/edit?ts=5ed54821
    open https://docs.google.com/spreadsheets/d/1fjL9rruQiQNmmWxlMBBdV6KOJrd3wMl8LkFel26kQTg/edit#gid=56252838
    open https://chartio.com/datarobot/covid-simulator-results-geo-agnostic/
    open https://www.worldometers.info/coronavirus/
    open https://jenkins.hq.datarobot.com/view/Covid%20Hackathon/view/Simulator/view/Runners/job/Covid_Simulator_production_Pipeline/build?delay=0sec
    open http://10.221.230.69/
    open https://covid-19.apps.datarobot.com/overview
    open https://docs.google.com/document/d/1MJFjCEBMjdW_SeT1FYvU_1VALCv05t70WPMhbZ7P_N0/edit?ts=5ef4d744#heading=h.jy0cn1l7muvu
    open https://viz.covid19forecasthub.org/
    open https://covid19-projections.com/
    open https://docs.google.com/document/d/1pyaOB6ybuvWrr1bU2HYjlvHyAkLrcP0NgbywPAE9Uv4/edit?ts=5efdca2a#heading=h.b5dnlm9g61d5
    cd /Users/iveksl2/Desktop/covid/covid-simulator/scripts
}


