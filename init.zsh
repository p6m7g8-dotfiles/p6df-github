######################################################################
#<
#
# Function: p6df::modules::github::deps()
#
#>
######################################################################
p6df::modules::github::deps() {
  ModuleDeps=(
    p6m7g8/p6github
    p6m7g8/p6df-git
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
  code --install-extension GitHub.vscode-codeql
  code --install-extension GitHub.vscode-pull-request-github
}

######################################################################
#<
#
# Function: p6df::modules::github::external::yum()
#
#>
######################################################################
p6df::modules::github::external::yum() {

  wget https://github.com/cli/cli/releases/download/v1.8.0/gh_1.8.0_linux_amd64.tar.gz -O - | tar xz
  sudo mv gh_1.8.0_linux_amd64/bin/gh /usr/bin/gh
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
}

######################################################################
#<
#
# Function: p6df::modules::github::langs()
#
#>
######################################################################
p6df::modules::github::langs() {

  #environments f jira pr-dtaft repo-collab repo-topic

  local extensions=(
		dlvhdr/gh-prs
		yusukebe/gh-markdown-preview
		korosuke613/gh-user-stars
		vilmibm/gh-user-status
		meiji163/gh-notify
		matt-bartel/gh-clone-org
		heaths/gh-label
		mislav/gh-delete-repo
		kentaro-m/gh-lspr
		yuler/gh-download
		mislav/gh-repo-collab
		YuG1224/gh-lgtmoon
		sachaos/gh-stars
		ericwb/gh-alerts
		gitpod-io/gh-gp
		daido1976/gh-default-branch
		HaywardMorihara/gh-tidy
		cschleiden/gh-actionlint
		andyfeller/gh-dependency-report
		mislav/gh-repo-topic
		owenvoke/gh-gpg-key
		einride/gh-dependabot
		chelnak/gh-environments
		k1LoW/gh-star-history
		yuri-1987/gh-deploy
		jnmiller-va/gh-project-manager
		geoffreywiseman/gh-actuse
		mtoohey31/gh-foreach
		meiji163/gh-search
		jkeech/gh-shell
	)

  local ext
  foreach ext in $extensions; do
    gh extension install $ext
  done
}

######################################################################
#<
#
# Function: p6df::modules::github::init()
#
#>
######################################################################
p6df::modules::github::init() {

  p6df::modules::github::aliases::init
}

######################################################################
#<
#
# Function: p6df::modules::github::aliases::init()
#
#>
######################################################################
p6df::modules::github::aliases::init() {

  alias p6df_ghs="p6_github_gh_pr_submit"
  alias p6df_ghpl="p6_github_gh_pr_list"
  alias p6df_ghpc="p6_github_gh_pr_checkout"
  alias p6df_ghpC="p6_github_gh_pr_comment"
  alias p6df_ghpm="p6_github_gh_pr_merge"

  alias ghl=p6df_ghpl
  alias ghc=p6df_ghpc
  alias ghC=p6df_ghpC
  alias ghm=p6df_ghmp
}

######################################################################
#<
#
# Function: p6df::modules::github::prompt::line()
#
#>
######################################################################
p6df::modules::github::prompt::line() {
  p6_github_prompt_info
}

######################################################################
#<
#
# Function: str str = p6_github_prompt_info()
#
#  Returns:
#	str - str
#
#>
######################################################################
p6_github_prompt_info() {

  if p6_git_inside_tree; then
    local pr
    local title
    local count

    pr=$(gh pr list -q "." --json number | jq -r ".[0].number")
    title=$(gh pr list -q "." --json title | jq -r ".[0].title")
    count=$(gh pr list | wc -l | sed -e 's, *,,g')

    local str
    str="github:\t  c:$count pr:$pr t:{$title}"

    p6_return_str "$str"
   fi
}
