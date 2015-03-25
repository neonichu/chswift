unset SWIFT_AUTO_VERSION

function chswift_auto() {
	local dir="$PWD/" version

	until [[ -z "$dir" ]]; do
		dir="${dir%/*}"

		if { read -r version <"$dir/.swift-version"; } 2>/dev/null || [[ -n "$version" ]]; then
			version="${version%%[[:space:]]}"

			if [[ "$version" == "$SWIFT_AUTO_VERSION" ]]; then return
			else
				SWIFT_AUTO_VERSION="$version"
				chswift "$version"
				return $?
			fi
		fi
	done

	if [[ -n "$SWIFT_AUTO_VERSION" ]]; then
		chswift_reset
		unset SWIFT_AUTO_VERSION
	fi
}

if [[ -n "$ZSH_VERSION" ]]; then
	if [[ ! "$preexec_functions" == *chswift_auto* ]]; then
		preexec_functions+=("chswift_auto")
	fi
elif [[ -n "$BASH_VERSION" ]]; then
	trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && chswift_auto' DEBUG
fi