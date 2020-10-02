#!/bin/zsh

if [[ $(command -v antigen) ]]; then
	antigen bundle aubreypwd/zsh-plugin-require@1.0.1
	antigen apply

	require "vcsh" "brew reinstall vcsh" "brew"
fi

###
 # vcshr
 #
 # E.g. vcshr "homebrew" "aubreypwd" "vcsh-homebrew" --overwrite --autoignore
 #
 # This will require http://github.com/
 #
 # @since 1.0.0
 # @since 10/2/20
 #
 # @author Aubrey Portwood <code@aubreypwd.com>
 ##
function vcshr {
	if ! [[ -x $(command -v vcsh) ]]; then >&2 echo "This uses the command 'vcsh' and we could not find the command." && return; fi

	local name="$1"
	local username="$2"
	local repo="$3"

	if [[ $(vcsh list) == *"$name"* ]]; then
		return; # You already have it in your list, fail gracefully.
	fi

	local repo_url="https://github.com/$username/$repo" # Default to https, unless they pass the --ssh flag.

	if [[ "$@" == *"--ssh"* ]]; then
		local repo_url="ssh://git@github.com/$username/$repo.git"
	fi

	vcsh clone "$repo_url" "$name"

	if [[ "$@" == *"--overwrite"* ]]; then
		vcsh "$name" reset --hard origin/master
	fi

	if [[ "$@" == *"--autoignore"* ]]; then
		sleep 2

		# Yes, we have to do it twice
		vcsh write-gitignore "$name" # Once to make the backup file, but it exists.
		vcsh write-gitignore "$name" # Again, to write the new ignore file because the first one exited.
	fi
}
