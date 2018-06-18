p6df::modules::github::version() { echo "0.0.1" }
p6df::modules::github::deps()    { 
	ModuleDeps=(
		p6m7g8/p6github
	)
}

p6df::modules::github::external::brew() { 

  brew install hub
}

p6df::modules::github::home::symlink() {

  # XXX: de XDG
}

p6df::modules::github::init() {

    eval "$(hub alias -s)"
}
