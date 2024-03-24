######################################################################
#<
#
# Function: p6df::modules::github::ext::parallel::clone(org)
#
#  Args:
#	org -
#
#>
######################################################################
p6df::modules::github::ext::parallel::clone() {
    local org="$1"

    gh parallel clone "$org"

    p6_return_void
}

