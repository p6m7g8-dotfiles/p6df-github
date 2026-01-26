# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Lists all security alerts for an organization
#/
######################################################################
p6df::modules::github::ext::alerts() {
    local org="$1" # organization name

    gh alerts -o "$org"

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::repo(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Aggregates security alerts by repository and sorts by count
#/
######################################################################
p6df::modules::github::ext::alerts::by::repo() {
    local org="$1" # organization name

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 1 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::dep(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Aggregates security alerts by dependency and sorts by count
#/
######################################################################
p6df::modules::github::ext::alerts::by::dep() {
    local org="$1" # organization name

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 2 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::severity(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Aggregates security alerts by severity level and sorts by count
#/
######################################################################
p6df::modules::github::ext::alerts::by::severity() {
    local org="$1" # organization name

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 3 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

    p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::github::ext::alerts::by::file(org)
#
#  Args:
#	org - organization name
#
#>
#/ Synopsis
#/    Aggregates security alerts by affected file and sorts by count
#/
######################################################################
p6df::modules::github::ext::alerts::by::file() {
    local org="$1" # organization name

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 5 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

    p6_return_void
}
