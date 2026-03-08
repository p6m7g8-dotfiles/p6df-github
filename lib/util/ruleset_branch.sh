# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::default::delete()
#
#>
#/ Synopsis
#/    Deletes the default branch ruleset for the current repository
#/
######################################################################
p6df::modules::github::util::ruleset::branch::default::delete() {

  p6df::modules::github::ext::ruleset::branch delete default

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::default::create()
#
#>
#/ Synopsis
#/    Creates the default branch ruleset for the current repository
#/
######################################################################
p6df::modules::github::util::ruleset::branch::default::create() {

  p6df::modules::github::ext::ruleset::branch create default

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::util::ruleset::branch::mine()
#
#>
#/ Synopsis
#/    Applies custom branch ruleset configuration with merge queue, required status checks (build, claude-review, codex-review, Lint PR title), and PR requirements
#/
######################################################################
p6df::modules::github::util::ruleset::branch::mine() {

  p6df::modules::github::ext::ruleset::branch update default \
    deletion=enabled \
    non_fast_forward=enabled \
    required_linear_history=enabled \
    required_signatures=enabled \
    required_status_checks=enabled \
    required_status_checks.strict_required_status_checks_policy=true \
    required_status_checks.do_not_enforce_on_create=false \
    required_status_checks.context="build" \
    required_status_checks.context="claude-review" \
    required_status_checks.context="codex-review" \
    required_status_checks.context="Lint PR title" \
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
    copilot_code_review=disabled \
    conditions.include="~DEFAULT_BRANCH" \
    conditions.exclude=""

  p6_return_void
}
