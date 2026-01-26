# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::api::pr::submit(msg, [pr_num=], [editor=$EDITOR])
#
#  Args:
#	msg - commit message
#	OPTIONAL pr_num - pull request number []
#	OPTIONAL editor - editor to use [$EDITOR]
#
#  Environment:	 EDITOR P6_DFZ_GITHUB_BRANCH_TMPL P6_DFZ_GITHUB_REVIEWER USER
#>
#/ Synopsis
#/    Submits a pull request with the specified message using configured defaults
#/
######################################################################
p6df::modules::github::api::pr::submit() {
  local msg="$1"       # commit message
  local pr_num="${2:-}" # pull request number
  local editor="${3:-$EDITOR}" # editor to use

  p6_github_api_pr_submit "$editor" "$USER" "$P6_DFZ_GITHUB_BRANCH_TMPL" "$P6_DFZ_GITHUB_REVIEWER" "$msg" "$pr_num"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::api::pr::last::view()
#
#>
#/ Synopsis
#/    Opens the last pull request in the web browser
#/
######################################################################
p6df::modules::github::api::pr::last::view() {

  local pr
  pr=$(p6_github_api_pr_last)

  p6_github_cli_pr_view_web "$pr"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::api::pr::last::checkout()
#
#>
#/ Synopsis
#/    Checks out the branch for the last pull request
#/
######################################################################
p6df::modules::github::api::pr::last::checkout() {

  local pr
  pr=$(p6_github_api_pr_last)

  p6_github_cli_pr_checkout "$pr"

  p6_return_void
}
