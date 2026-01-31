# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::environments::list()
#
#>
#/ Synopsis
#/    Lists all environments for the current repository
#/
######################################################################
p6df::modules::github::ext::environments::list() {

    gh environments list

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::environments::create(name)
#
#  Args:
#	name - environment name
#
#>
#/ Synopsis
#/    Creates a new environment in the current repository
#/
######################################################################
p6df::modules::github::ext::environments::create() {
    local name="$1" # environment name

    gh environments create "$name"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::environments::delete(name)
#
#  Args:
#	name - environment name
#
#>
#/ Synopsis
#/    Deletes an environment from the current repository
#/
######################################################################
p6df::modules::github::ext::environments::delete() {
    local name="$1" # environment name

    gh environments delete "$name"

    p6_return_void
}
