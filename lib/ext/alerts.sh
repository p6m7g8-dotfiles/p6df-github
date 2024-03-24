# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::alerts() {
    local org="$1"

    gh alerts -o "$org"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::repo(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::alerts::by::repo() {
    local org="$1"

    p6df::modules::github::ext::alerts "$org" | awk '{print $1}' | sort | uniq -c | sort -nr

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::dep(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::alerts::by::dep() {
    local org="$1"

    p6df::modules::github::ext::alerts "$org" | awk '{print $2}' | sort | uniq -c | sort -nr

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::severity(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::alerts::by::severity() {
    local org="$1"

    p6df::modules::github::ext::alerts "$org" | awk '{print $3}' | sort | uniq -c | sort -nr

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::file(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::alerts::by::file() {
    local org="$1"

    p6df::modules::github::ext::alerts "$org" | awk '{print $5}' | sort | uniq -c | sort -nr

    p6_return_void
}
