# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::actions::status()
#
#>
#/ Synopsis
#/    Shows status of GitHub Actions workflows in the current repository
#/
######################################################################
p6df::modules::github::ext::actions::status() {

    gh actions-status

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::actions::status::watch()
#
#>
#/ Synopsis
#/    Watches GitHub Actions workflow status with live updates
#/
######################################################################
p6df::modules::github::ext::actions::status::watch() {

    gh actions-status --watch

    p6_return_void
}
