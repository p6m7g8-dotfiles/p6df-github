# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::api::ruleset::branch::default::delete()
#
#>
#/ Synopsis
#/    Deletes the default branch ruleset for the current repository
#/
######################################################################
p6df::modules::github::api::ruleset::branch::default::delete() {

  p6df::modules::github::ext::ruleset::branch delete default

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::api::ruleset::branch::default::create()
#
#>
#/ Synopsis
#/    Creates the default branch ruleset for the current repository
#/
######################################################################
p6df::modules::github::api::ruleset::branch::default::create() {

  p6df::modules::github::ext::ruleset::branch create default

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::api::ruleset::branch::mine()
#
#>
#/ Synopsis
#/    Applies custom branch ruleset configuration with merge queue, PR requirements, and Copilot code review
#/
######################################################################
p6df::modules::github::api::ruleset::branch::mine() {

  p6df::modules::github::ext::ruleset::branch update default \
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
