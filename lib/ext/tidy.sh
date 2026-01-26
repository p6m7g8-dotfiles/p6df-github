# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::tidy::all()
#
#>
#/ Synopsis
#/    Tidies up branches by rebasing all branches on the trunk branch
#/
######################################################################
p6df::modules::github::ext::tidy::all() {

    local trunk
    trunk=$(p6_git_branch_base_get)

    gh tidy --skip-update-check --rebase-all --trunk "$trunk"

    p6_return_void
}

