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
# Function: p6df::modules::github::util::org::name::sanity(dir)
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

######################################################################
#<
#
# Function: p6df::modules::github::util::org::ruleset::branch::default::activate(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::ruleset::branch::default::activate() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6_github_util_ruleset_branch_activate
  done

  p6_return_void
}

# shellcheck disable=2329
######################################################################
#<
#
# Function: p6df::modules::github::util::org::ruleset::branch::mine(dir, dir)
#
#  Args:
#	dir - dir MUST also be the org name
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::ruleset::branch::mine() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github:::util::ruleset::branch::mine
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::ruleset::branch::mine(dir, dir)
#
#  Args:
#	dir - dir MUST also be the org name
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::ruleset::branch::mine() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github:::util::ruleset::branch::mine
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::ruleset::branch::default::delete(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::ruleset::branch::default::delete() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github::util::ruleset::branch::default::delete
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::org::ruleset::branch::default::create(dir)
#
#  Args:
#	dir - dir MUST also be the org name
#
#  Environment:	 MUST
#>
######################################################################
p6df::modules::github::util::org::ruleset::branch::default::create() {
  local dir="$1" # dir MUST also be the org name

  local org="$dir"

  local repo
  for repo in $(p6_dir_list "$dir"); do
    p6_h1 "$dir/$repo"
    p6_run_dir "$dir/$repo" p6df::modules::github::util::ruleset::branch::default::create
  done

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::default::delete()
#
#>
######################################################################
p6df::modules::github::util::ruleset::branch::default::delete() {

  p6_github_util_ruleset_branch_delete "default"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::default::create()
#
#>
######################################################################
p6df::modules::github::util::ruleset::branch::default::create() {

  p6_github_util_ruleset_branch_create "default"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::mine()
#
#  Environment:	 ALLGREEN DEFAULT_BRANCH SQUASH
#>
######################################################################
p6df::modules::github::util::ruleset::branch::mine() {

  p6_github_util_ruleset_branch_update default \
    deletion=enabled \
    non_fast_forward=enabled \
    required_linear_history=enabled \
    merge_queue=enabled \
    merge_queue.merge_method=SQUASH \
    merge_queue.max_entries_to_build=5 \
    merge_queue.min_entries_to_merge=1 \
    merge_queue.max_entries_to_merge=5 \
    merge_queue.min_entries_to_merge_wait_minutes=5 \
    merge_queue.grouping_strategy=ALLGREEN \
    merge_queue.check_response_timeout_minutes=7 \
    pull_request=enabled \
    pull_request.required_approving_review_count=1 \
    pull_request.dismiss_stale_reviews_on_push=false \
    pull_request.require_code_owner_review=false \
    pull_request.require_last_push_approval=false \
    pull_request.required_review_thread_resolution=true \
    pull_request.allowed_merge_methods=squash \
    copilot_code_review=enabled \
    copilot_code_review.review_on_push=true \
    copilot_code_review.review_draft_pull_requests=true \
    conditions.include="~DEFAULT_BRANCH" \
    conditions.exclude=""

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::pr::last::view()
#
#>
######################################################################
p6df::modules::github::util::pr::last::view() {

  local pr
  pr=$(p6_github_util_pr_last)

  p6_github_cli_pr_view_web "$pr"

  p6_return_void
}
