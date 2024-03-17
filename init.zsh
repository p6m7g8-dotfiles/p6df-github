# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::deps()
#
#>
######################################################################
p6df::modules::github::deps() {
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

  # vc/github/git
  code --install-extension eamodio.gitlens
  code --install-extension gimenete.github-linker
  code --install-extension GitHub.vscode-codeql
  code --install-extension GitHub.vscode-pull-request-github
  code --install-extension github.vscode-github-actions
  code --install-extension GitHub.copilot

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

  wget https://github.com/cli/cli/releases/download/v2.6.0/gh_2.6.0_linux_amd64.tar.gz
  sudo mv gh_2.6.0_linux_amd64/bin/gh /usr/bin/gh

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

  brew install gh
  brew install act

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::langs()
#
#  Environment:	 G1224
#>
######################################################################
p6df::modules::github::langs() {

  # environments f jira pr-dtaft repo-collab repo-topic

  local extensions=(
    andyfeller/gh-dependency-report
    chelnak/gh-environments
    cschleiden/gh-actionlint
    daido1976/gh-default-branch
    dlvhdr/gh-prs
    einride/gh-dependabot
    ericwb/gh-alerts
    geoffreywiseman/gh-actuse
    gitpod-io/gh-gp
    HaywardMorihara/gh-tidy
    heaths/gh-label
    jkeech/gh-shell
    jnmiller-va/gh-project-manager
    k1LoW/gh-star-history
    kentaro-m/gh-lspr
    korosuke613/gh-user-stars
    matt-bartel/gh-clone-org
    meiji163/gh-notify
    meiji163/gh-search
    mislav/gh-delete-repo
    mislav/gh-repo-collab
    mislav/gh-repo-topic
    mtoohey31/gh-foreach
    p6m7g8/gh-parallel
    sachaos/gh-stars
    vilmibm/gh-user-status
    YuG1224/gh-lgtmoon
    yuler/gh-download
    yuri-1987/gh-deploy
    yusukebe/gh-markdown-preview
  )

  local ext
  for ext in $extensions; do
    gh extension install $ext
  done

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

  alias ghpS="p6df::modules::github::pr::submit"
  alias ghpMl="p6_github_util_pr_merge_last"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::pr::submit(msg, [pr_num=])
#
#  Args:
#	msg -
#	OPTIONAL pr_num - []
#
#  Environment:	 EDITOR
#>
######################################################################
p6df::modules::github::pr::submit() {
  local msg="$1"
  local pr_num="${2:-}"

  p6_github_util_pr_submit "$EDITOR" "$USER" "$P6_DFZ_GITHUB_BRANCH_TMPL" "$P6_DFZ_GITHUB_REVIEWER" "$msg" "$pr_num"
}

######################################################################
#<
#
# Function: str str = p6df::modules::github::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 P6_DFZ_GITHUB_PROMPT
#>
######################################################################
p6df::modules::github::prompt::line() {

  local str
  if p6_git_util_inside_tree; then
    if ! p6_string_blank "$P6_DFZ_GITHUB_PROMPT"; then
      str="github:\t  "
    fi
  fi

  p6_return_str "$str"
}
