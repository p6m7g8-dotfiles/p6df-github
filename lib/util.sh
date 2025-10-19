# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::util::pr::submit(msg, [pr_num=], [editor=$EDITOR])
#
#  Args:
#	msg -
#	OPTIONAL pr_num - []
#	OPTIONAL editor - [$EDITOR]
#
#  Environment:	 EDITOR USER
#>
######################################################################
p6df::modules::github::util::pr::submit() {
  local msg="$1"
  local pr_num="${2:-}"
  local editor="${3:-$EDITOR}"

  p6_github_util_pr_submit "$editor" "$USER" "$P6_DFZ_GITHUB_BRANCH_TMPL" "$P6_DFZ_GITHUB_REVIEWER" "$msg" "$pr_num"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::name::sanity(dir, dir)
#
#  Args:
#	dir - dir MUST also be the org name
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
# shellcheck disable=2329
p6df::modules::github::util::org::name::sanity() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_github_util_repo_rename_strip_leading_underscores "$org/$repo"
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::archive(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::archive() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_util_repo_archive
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::unarchive(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::unarchive() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_util_repo_unarchive
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::workflow::upgrade-main::run(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::workflow::upgrade-main::run() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_util_repo_workflow_upgrade_main_run
  done

  p6_return_void

}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::admin::show(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::admin::show() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" _admin_show
  done

  p6_return_void
}

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
# Function: p6df::modules::github::util::org::name::sanity(dir, dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::name::sanity() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_github_util_repo_rename_strip_leading_underscores "$org/$repo"
  done

  p6_return_void
}
