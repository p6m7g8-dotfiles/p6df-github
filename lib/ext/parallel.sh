# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::parallel::clone(org, dir)
#
#  Args:
#	org - organization name
#	dir - target directory
#
#>
#/ Synopsis
#/    Clones all repositories from an organization in parallel to a directory
#/
######################################################################
p6df::modules::github::ext::parallel::clone() {
    local org="$1" # organization name
    local dir="$2" # target directory

    gh parallel clone "$org" "$dir"

    p6_return_void
}

