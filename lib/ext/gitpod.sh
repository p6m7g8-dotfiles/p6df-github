# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::gitpod::launch()
#
#>
#/ Synopsis
#/    Launches a Gitpod workspace for the current repository
#/
######################################################################
p6df::modules::github::ext::gitpod::launch() {

    gh gp

    p6_return_void
}

