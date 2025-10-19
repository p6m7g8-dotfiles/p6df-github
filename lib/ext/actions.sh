# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::actions::cache::list()
#
#>
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
######################################################################
p6df::modules::github::ext::action::lint() {

    gh actionlint -color -oneline

    p6_return_void
}
