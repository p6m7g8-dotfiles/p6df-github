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

  wget https://github.com/cli/cli/releases/download/v2.6.0/gh_2.6.0_linux_amd64.tar.gz
  sudo mv gh_2.6.0_linux_amd64/bin/gh /usr/bin/gh
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
# Function: p6df::modules::github::home::symlink()
#
#  Environment:	 GH_TOKEN P6_DFZ_SRC_P6M7G8_DIR
#>
######################################################################
p6df::modules::github::home::symlink() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-github/conf/gh" ".config/gh"
  (
    p6_dir_cd ".config/gh"
    p6_file_copy "hosts.yml.in" "hosts.yml"
    perl -pi -e "s,GH_TOKEN,$GH_TOKEN, ; s,GH_USER,$GH_USER," hosts.yml
  )
}

######################################################################
#<
#
# Function: p6df::modules::github::aliases::init()
#
#>
######################################################################
p6df::modules::github::aliases::init() {

  alias p6_ghpl="p6df::modules::github::gh::pr::list"
  alias p6_ghpll="p6df::modules::github::gh::pr::last"
  alias p6_ghpml="p6df::modules::github::gh::pr::merge::last"
  alias p6_ghs="p6df::modules::github::gh::submit"
  alias p6_ght="p6df::modules::github::gh::tidy"

  alias ghs=p6_ghs
  alias ghpml=p6_ghpml
}

p6df::modules::github::gh::pr::list() {

  p6_run_code "gh pr list"

  p6_return_void
}

p6df::modules::github::gh::tidy() {

  p6_run_code "gh tidy"

  p6_return_void
}

p6df::modules::github::gh::pr::last() {

  # Prior PR
  local pr_id
  pr_id=$(p6_run_code "gh pr list | awk '/OPEN/ {print \$1}'")

  p6_return_int "$pr_id"
}

p6df::modules::github::gh::pr::merge::last() {

  # Prior PR
  local pr_id
  pr_id=$(p6df::modules::github::gh::pr::last)

  # Merge, Squash, Delete Branch
  p6_run_code "gh pr merge -d -s \"$pr_id\""

  # Pull (already on main)
  p6_git_p6_pull

  p6_return_void
}

p6df::modules::github::gh::submit() {
  local msg="$*"

  # Step 1: Show current state
  p6_git_p6_status

  # Step 2: Show diff
  p6_git_p6_diff

  # Step 3: Checkout a branch
  local branch
  branch=$(p6_github_branch_transliterate "$msg")
  p6_git_p6_branch_create "$branch"

  # Step 4: Add
  p6_git_p6_add_all

  # Step 5: Commit
  p6_git_p6_commit "$msg"

  # Step 6: Push
  p6_git_p6_push

  # Step 7: Create PR
  gh pr create -a $USER -f

  # Step 8: Back to default
  p6_git_p6_checkout_default

  p6_return_void
}

p6_github_branch_transliterate() {
  local msg="$1"

  local branch
  branch=$(p6_string_replace "$msg" ":" "#")
  branch=$(p6_string_replace "$branch" " " "_")
  branch=$(p6_string_replace "$branch" "[^A-Za-z0-9_#]" "")

  p6_return_str "$branch"
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
