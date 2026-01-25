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

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 1 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

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

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 2 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

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

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 3 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

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

    p6df::modules::github::ext::alerts "$org" | p6_filter_column_pluck 5 | p6_filter_aggregate_map_reduce | p6_filter_sort_numeric_reverse

    p6_return_void
}
