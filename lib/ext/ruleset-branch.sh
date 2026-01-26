# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::ruleset::branch(...)
#
#  Args:
#	... - arguments passed to gh ruleset-branch
#
#>
#/ Synopsis
#/    Pass-through wrapper to gh ruleset-branch extension with all arguments
#/
######################################################################
p6df::modules::github::ext::ruleset::branch() {
    shift 0

    gh ruleset-branch "$@"

    p6_return_void
}

