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
    local dir="$2"

    gh parallel clone "$org" "$dir"

    p6_return_void
}

