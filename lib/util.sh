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
