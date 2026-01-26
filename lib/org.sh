# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::org::archive(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Archives all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::archive() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_api_repo_archive
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::unarchive(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Unarchives all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::unarchive() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_api_repo_unarchive
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::workflow::upgrade_main::run(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Runs the upgrade-main workflow on all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::workflow::upgrade_main::run() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_api_repo_workflow_upgrade_main_run
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::admin::show(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Shows admin status for all repositories in an organization directory (checkout, pull, status, diff, PRs)
#/
######################################################################
p6df::modules::github::org::admin::show() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" _admin_show
  done

  p6_return_void
}

######################################################################
#<
#
# Function: _admin_show()
#
#>
#/ Synopsis
#/    Internal helper that performs git checkout, pull, status, diff, and lists PRs
#/
######################################################################
_admin_show() {

    p6_git_cli_checkout
    p6_git_cli_pull_rebase_autostash_ff_only
    p6_git_cli_status_s
    p6_git_cli_diff
    p6_github_cli_pr_list

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::name::sanity(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Strips leading underscores from all repository names in an organization
#/
######################################################################
p6df::modules::github::org::name::sanity() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_github_api_repo_rename_strip_leading_underscores "$org/$repo"
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::ruleset::branch::default::activate(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Activates the default branch ruleset for all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::ruleset::branch::default::activate() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_api_ruleset_branch_activate
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::ruleset::branch::mine(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Applies custom branch ruleset configuration to all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::ruleset::branch::mine() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github::api::ruleset::branch::mine
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::ruleset::branch::default::delete(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Deletes the default branch ruleset for all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::ruleset::branch::default::delete() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github::api::ruleset::branch::default::delete
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::org::ruleset::branch::default::create(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#>
#/ Synopsis
#/    Creates the default branch ruleset for all repositories in an organization directory
#/
######################################################################
p6df::modules::github::org::ruleset::branch::default::create() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github::api::ruleset::branch::default::create
  done

  p6_return_void
}
