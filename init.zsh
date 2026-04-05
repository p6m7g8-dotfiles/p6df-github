# shellcheck shell=bash
######################################################################
p6df::modules::github::deps() {

  # shellcheck disable=2034
  ModuleDeps=(
    p6m7g8-dotfiles/p6github
    p6m7g8-dotfiles/p6df-git
    ahmedasmar/devops-claude-skills:ci-cd
  )
}

######################################################################
p6df::modules::github::aliases::init() {

  local _module="$1"
  local _dir="$2"
  p6_alias "ghpS"  "p6df::modules::github::util::pr::submit"
  p6_alias "ghpMl" "p6_github_util_pr_merge_last"
  p6_alias "ghpMo" "p6_github_util_pr_merge_oldest"
  p6_alias "ghpl"  "p6_github_cli_pr_list"
  p6_alias "ghpc"  "p6_github_cli_pr_checkout"
  p6_alias "ghpv"  "p6df::modules::github::util::pr::last::view"
  p6_alias "ghplc" "p6df::modules::github::util::pr::last::checkout"

  # p6m7g8/gh-parallel
  p6_alias "ghePc"  "p6df::modules::github::ext::parallel::clone"      # 1=org 2=dir

  # p6m7g8/gh-ruleset-branch
  p6_alias "gherb"   "p6df::modules::github::ext::ruleset::branch"      # varying args

  # actions/gh-actions-cache
  p6_alias "gheacl" "p6df::modules::github::ext::actions::cache::list" # in dir

  # andyfeller/gh-dependency-report
  p6_alias "ghedr"  "p6df::modules::github::ext::dependencies::report" # 1=org_repo

  # chelnak/gh-environments
  p6_alias "gheel"  "p6df::modules::github::ext::environments::list"   # in dir
  p6_alias "gheec"  "p6df::modules::github::ext::environments::create" # 1=name
  p6_alias "gheed"  "p6df::modules::github::ext::environments::delete" # 1=name

  # cschleiden/gh-actionlint
  p6_alias "gheal"  "p6df::modules::github::ext::action::lint"         # in dir

  # davidraviv/gh-clean-branches
  p6_alias "ghecb"  "p6df::modules::github::ext::clean::branches"      # in dir
  p6_alias "ghecbd" "p6df::modules::github::ext::clean::branches::dry" # in dir

  # ericwb/gh-alerts
  p6_alias "gheAbd" "p6df::modules::github::ext::alerts::by::dep"      # 1=org
  p6_alias "gheAbf" "p6df::modules::github::ext::alerts::by::file"     # 1=org
  p6_alias "gheAbs" "p6df::modules::github::ext::alerts::by::severity" # 1=org
  p6_alias "gheAby" "p6df::modules::github::ext::alerts::by::repo"     # 1=org

  # gitpod-io/gh-gp
  p6_alias "ghegpl" "p6df::modules::github::ext::gitpod::launch"       # in dir

  # HaywardMorihara/gh-tidy
  p6_alias "gheta"  "p6df::modules::github::ext::tidy::all"            # in dir

  # mislav/gh-repo-collab
  p6_alias "ghepl"  "p6df::modules::github::ext::permissions::list"    # in dir

  # mislav/gh-repo-topic
  p6_alias "ghetl"  "p6df::modules::github::ext::topics::list"         # in dir

  # rsese/gh-actions-status
  p6_alias "gheas"  "p6df::modules::github::ext::actions::status"      # in dir
  p6_alias "gheasw" "p6df::modules::github::ext::actions::status::watch" # in dir

  # srz-zumix/gh-team-kit
  p6_alias "ghetktl" "p6df::modules::github::ext::team::list"          # 1=org
  p6_alias "ghetktm" "p6df::modules::github::ext::team::members"       # 1=org 2=team

  p6_return_void
}

######################################################################
p6df::modules::github::home::symlinks() {

  p6_file_symlink "$P6_DFZ_SRC_P6M7G8_DOTFILES_DIR/p6df-github/share/.actrc" "$HOME/.actrc"

  p6_file_symlink "$P6_DFZ_SRC_DIR/ahmedasmar/devops-claude-skills/ci-cd"                                                    "$HOME/.claude/skills/ci-cd"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/github-actions-generator"          "$HOME/.claude/skills/github-actions-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/github-actions-validator"          "$HOME/.claude/skills/github-actions-validator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/gitlab-ci-generator"               "$HOME/.claude/skills/gitlab-ci-generator"
  p6_file_symlink "$P6_DFZ_SRC_DIR/akin-ozer/cc-devops-skills/devops-skills-plugin/skills/gitlab-ci-validator"               "$HOME/.claude/skills/gitlab-ci-validator"

  p6_return_void
}

######################################################################
p6df::modules::github::external::brews() {

  p6df::core::homebrew::cli::brew::install gh
  p6df::core::homebrew::cli::brew::install act

  p6_return_void
}

######################################################################
p6df::modules::github::langs() {

  p6df::modules::github::langs::extensions

  p6_return_void
}

######################################################################
p6df::modules::github::mcp() {

  p6_js_npm_global_install "@modelcontextprotocol/server-github"

  p6_return_void
}

######################################################################
p6df::modules::github::vscodes() {

  p6df::modules::vscode::extension::install eamodio.gitlens
  p6df::modules::vscode::extension::install github.vscode-pull-request-github
  p6df::modules::vscode::extension::install github.vscode-github-actions
  p6df::modules::vscode::extension::install github.vscode-codeql

  p6_return_void
}

######################################################################
p6df::modules::github::vscodes::config() {

  cat <<'EOF'
  "githubPullRequests.pullBranch": "never",
  "githubPullRequests.quickDiff": true,
  "gitlens.codeLens.enabled": false,
  "gitlens.currentLine.enabled": false,
  "gitlens.blame.heatmap.enabled": false
EOF

  p6_return_void
}

######################################################################
p6df::modules::github::profile::mod() {

  p6_return_words 'github' '$GH_HOST'
}

######################################################################
#<
#
# Function: p6df::modules::github::deps()
#
#>
######################################################################
#<
#
# Function: p6df::modules::github::vscodes()
#
#>
######################################################################
#<
#
# Function: p6df::modules::github::vscodes::config()
#
#>
######################################################################
#<
#
# Function: p6df::modules::github::external::brews()
#
#>
######################################################################
#<
#
# Function: p6df::modules::github::langs::extensions()
#
#>
######################################################################
p6df::modules::github::langs::extensions() {

  local -a extensions=(
    # p6m7g8/gh-parallel              # mine
    # p6m7g8/gh-repo-mgmt             # mine
    # p6m7g8/gh-ruleset-branch        # mine
    actions/gh-actions-cache        # manage gh action cache
    andyfeller/gh-dependency-report # Tell me about dependencies and licenses
    chelnak/gh-environments         # crud
    cschleiden/gh-actionlint        # Lint .github/workflows/
    davidraviv/gh-clean-branches    # delete local branches
    ericwb/gh-alerts                # gh alerts -o $org | awk '{print $3}' | sort | uniq -c | sort -nr
    gitpod-io/gh-gp                 # gh gp to open .gitpod.yaml
    HaywardMorihara/gh-tidy         # clean up safely
    mislav/gh-repo-collab           # permissions, teams
    mislav/gh-repo-topic            # crud topics
    rsese/gh-actions-status         # stuff
    srz-zumix/gh-team-kit           # teams
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
#<
#
# Function: p6df::modules::github::home::symlinks()
#
#  Environment:	 HOME P6_DFZ_SRC_DIR P6_DFZ_SRC_P6M7G8_DOTFILES_DIR
#>
######################################################################
#<
#
# Function: p6df::modules::github::aliases::init()
#
#>
######################################################################
#<
#
# Function: p6df::modules::github::mcp()
#
#>
######################################################################
#<
#
# Function: words github $GH_HOST = p6df::modules::github::profile::mod()
#
#  Returns:
#	words - github $GH_HOST
#
#  Environment:	 GH_HOST
#>
