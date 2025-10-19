# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::permissions::list(org_repo)
#
#  Args:
#	org_repo -
#
#>
######################################################################
p6df::modules::github::ext::permissions::list() {
    local org_repo="$1"

    gh repo-collab list "$org_repo"

    p6_return_void
}
