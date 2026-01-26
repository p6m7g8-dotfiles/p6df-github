# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::topics::list()
#
#>
#/ Synopsis
#/    Lists all topics for the current repository
#/
######################################################################
p6df::modules::github::ext::topics::list() {

    gh repo-topic list

    p6_return_void
}
