# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::deps()
#
#>
######################################################################
p6df::modules::github::deps() {

  # shellcheck disable=2034
  ModuleDeps=(
    p6m7g8-dotfiles/p6github
    p6m7g8-dotfiles/p6df-git
  )
}

######################################################################
#<
#
# Function: p6df::modules::github::vscodes()
#
#>
######################################################################
p6df::modules::github::vscodes() {

  code --install-extension eamodio.gitlens
  code --install-extension github.vscode-pull-request-github
  code --install-extension github.vscode-github-actions
  code --install-extension github.vscode-codeql
  code --install-extension github.copilot

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::external::yum()
#
#>
######################################################################
p6df::modules::github::external::yum() {

  wget https://github.com/cli/cli/releases/download/v2.45.0/gh_2.45.0_linux_amd64.tar.gz
  sudo mv gh_2.45.0_linux_amd64/bin/gh /usr/bin/gh

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::external::brew()
#
#>
######################################################################
p6df::modules::github::external::brew() {

  p6df::modules::homebrew::cli::brew::install gh
  p6df::modules::homebrew::cli::brew::install act

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::langs::extensions()
#
#>
######################################################################
p6df::modules::github::langs::extensions() {

  local -a extensions=(
    actions/gh-actions-cache        # manage gh action cache
    andyfeller/gh-dependency-report # Tell me about dependencies and licenses
    chelnak/gh-environments         # crud
    cschleiden/gh-actionlint        # Link .github/workflows/
    ericwb/gh-alerts                # gh alerts -o $org | awk '{print $3}' | sort | uniq -c | sort -nr
    gitpod-io/gh-gp                 # gh gp to open .gitpod.yaml
    HaywardMorihara/gh-tidy         # clean up safely
    heaths/gh-label                 # label crud
    mislav/gh-repo-collab           # permissions, teams
    mislav/gh-repo-topic            # crud topics
    p6m7g8/gh-parallel              # mine
    p6m7g8/gh-ruleset-branch        # mine
    rsese/gh-actions-status         # stuff
    vilmibm/gh-user-status          # status aim crud
  )

  local ext
  for ext in "${extensions[@]}"; do
    gh extension install "$ext" || p6_echo "failed: $ext"
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::langs()
#
#>
######################################################################
p6df::modules::github::langs() {

  p6df::modules::github::langs::extensions

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::home::symlink()
#
#  Environment:	 GH_TOKEN P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
p6df::modules::github::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-github/conf/gh" ".config/gh"

  p6_file_copy ".config/gh/hosts.yml.in" ".config/gh/hosts.yml"
  perl -pi -e "s,GH_TOKEN,$GH_TOKEN, ; s,GH_USER,$GH_USER," .config/gh/hosts.yml

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-github/share/.actrc" ".actrc"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::aliases::init()
#
#>
######################################################################
p6df::modules::github::aliases::init() {

  p6_alias "ghpS" "p6df::modules::github::util::pr::submit"
  p6_alias "ghpMl" "p6_github_util_pr_merge_last"
  p6_alias "ghpl" "p6_github_cli_pr_list"
  p6_alias "ghpc" "p6_github_cli_pr_checkout"
  p6_alias "ghpv" "p6df::modules::github::util::pr::last::view"
  p6_alias "ghplc" "p6df::modules::github::util::pr::last::checkout"

  # extensions
  p6_alias "gheAbd" "p6df::modules::github::ext::alerts::by::dep"      # 1=org
  p6_alias "gheAbf" "p6df::modules::github::ext::alerts::by::file"     # 1=org
  p6_alias "gheAbs" "p6df::modules::github::ext::alerts::by::severity" # 1=org
  p6_alias "gheAby" "p6df::modules::github::ext::alerts::by::repo"     # 1=org
  p6_alias "gheacl" "p6df::modules::github::ext::actions::cache::list" # in dir
  p6_alias "gheal" "p6df::modules::github::ext::action::lint"          # 1=org
  p6_alias "ghedr" "p6df::modules::github::ext::dependencies::report"  # 1=org_repo
  p6_alias "ghegpl" "p6df::modules::github::ext::gitpod::launch"       # in dir
  p6_alias "ghell" "p6df::modules::github::ext::label::list"           # in dir
  p6_alias "ghePc" "p6df::modules::github::ext::parallel::clone"       # 1=org 2=dir
  p6_alias "ghrb" "p6df::modules::github::ext::ruleset::branch"        # varying args
  p6_alias "ghepl" "p6df::modules::github::ext::permissions::list"     # in dir
  p6_alias "gheta" "p6df::modules::github::ext::tidy::all"             # in dir
  p6_alias "ghetl" "p6df::modules::github::ext::topics::list"          # in dir

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::init(_module, dir)
#
#  Args:
#	_module -
#	dir -
#
#>
######################################################################
p6df::modules::github::init() {
  local _module="$1"
  local dir="$2"

  p6_bootstrap "$dir"

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::github::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 GH_USER P6_DFZ_GITHUB_PROMPT P6_DFZ_PROFILE_GITHUB
#>
######################################################################
p6df::modules::github::prompt::mod() {

  local str
  if ! p6_string_blank "$P6_DFZ_PROFILE_GITHUB"; then
    str="github:\t\t  $P6_DFZ_PROFILE_GITHUB:"
    if ! p6_string_blank "$GH_USER"; then
      str=$(p6_string_append "$str" "$GH_USER" " ")
      if p6_git_util_inside_tree; then
        if ! p6_string_blank "$P6_DFZ_GITHUB_PROMPT"; then
          str=$(p6_string_append "$str" "- $P6_DFZ_GITHUB_PROMPT" " ")
        fi
      fi
    fi
  fi

  p6_return_str "$str"
}
