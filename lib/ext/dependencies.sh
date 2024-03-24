######################################################################
#<
#
# Function: p6df::modules::github::ext::dependences::report(org_repo)
#
#  Args:
#	org_repo -
#
#>
######################################################################
p6df::modules::github::ext::dependences::report() {
    local org_repo="$1"

    local org=$(p6_echo "$org_repo" | cut -f 1 -d /)
    local repo=$(p6_echo "$org_repo" | cut -f 2 -d /)

    gh dependency-report -d "$org" "$repo"

    p6_return_void
}

