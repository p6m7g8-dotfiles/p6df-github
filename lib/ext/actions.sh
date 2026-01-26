# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::actions::cache::list()
#
#>
#/ Synopsis
#/    Lists GitHub Actions cache entries (limit 100)
#/
######################################################################
p6df::modules::github::ext::actions::cache::list() {

    gh actions-cache list --limit 100

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::action::lint()
#
#>
#/ Synopsis
#/    Runs actionlint to validate GitHub Actions workflow files with color output
#/
######################################################################
p6df::modules::github::ext::action::lint() {

    gh actionlint -color -oneline

    p6_return_void
}
