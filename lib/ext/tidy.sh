######################################################################
#<
#
# Function: p6df::modules::github::ext::tidy::all()
#
#>
######################################################################
p6df::modules::github::ext::tidy::all() {

    local trunk=$(p6_git_branch_base_get)

    gh tidy --rebase-all --trunk "$trunk"

    p6_return_void
}

