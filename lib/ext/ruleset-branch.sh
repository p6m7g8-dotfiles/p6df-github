# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::ruleset::branch(...)
#
#  Args:
#	... - 
#
#>
######################################################################
p6df::modules::github::ext::ruleset::branch() {
    shift 0

    gh ruleset-branch "$@"

    p6_return_void
}

