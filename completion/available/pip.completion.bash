# shellcheck shell=bash

# https://pip.pypa.io/en/stable/user_guide/#command-completion
# Of course, you should first install pip, say on Debian:
# sudo apt-get install python-pip
# If the pip package is installed within virtual environments, say, python managed by pyenv,
# you should first initialize the corresponding environment.
# So that pip is in the system's path.
if _command_exists pip; then
	function _pip_lazy() {
		if _command_exists _pip_completion; then
			_pip_completion "$@"
		else
			eval "$(pip completion --bash)"
			_pip_completion "$@"
		fi
	}
	complete -o default -F _pip_lazy pip
fi
