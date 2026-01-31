# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::team::list(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Lists all teams in an organization
#/
######################################################################
p6df::modules::github::ext::team::list() {
    local org="$1" # organization name

    gh team-kit list "$org"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::team::members(org, team)
#
#  Args:
#	org - organization name
#	team - team name
#
#>
#/ Synopsis
#/    Lists members of a team in an organization
#/
######################################################################
p6df::modules::github::ext::team::members() {
    local org="$1"  # organization name
    local team="$2" # team name

    gh team-kit members "$org" "$team"

    p6_return_void
}
