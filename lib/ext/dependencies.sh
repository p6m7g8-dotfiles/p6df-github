# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::dependencies::report(org_repo)
#
#  Args:
#	org_repo - organization/repository name
#
#>
#/ Synopsis
#/    Generates a dependency report for a repository
#/
######################################################################
p6df::modules::github::ext::dependencies::report() {
    local org_repo="$1" # organization/repository name

    local org
    org=$(p6_echo "$org_repo" | p6_filter_column_pluck 1 "/")
    local repo
    repo=$(p6_echo "$org_repo" | p6_filter_column_pluck 2 "/")

    gh dependency-report -d "$org" "$repo"

    p6_return_void
}
