# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::clean::branches()
#
#>
#/ Synopsis
#/    Deletes local branches that have been merged or deleted on remote
#/
######################################################################
p6df::modules::github::ext::clean::branches() {

    gh clean-branches

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::clean::branches::dry()
#
#>
#/ Synopsis
#/    Shows which local branches would be deleted (dry run)
#/
######################################################################
p6df::modules::github::ext::clean::branches::dry() {

    gh clean-branches --dry-run

    p6_return_void
}
