CHSWIFT_VERSION="0.1.0"

DEV_DIR="Contents/Developer"
TOOL_DIR="Toolchains/XcodeDefault.xctoolchain/usr/bin"

SWIFTS=()
XCODES=()
OLDIFS=$IFS
IFS=$'\n'
for dir in $(mdfind "kMDItemCFBundleIdentifier == 'com.apple.dt.Xcode'" 2>/dev/null); do
	[[ -d "$dir" && -n "$(ls -A "$dir/$DEV_DIR")" ]] && XCODES+=("$dir/$DEV_DIR")
done
for dir in $(ls -d /Library/Developer/Toolchains/swift-* 2>/dev/null); do
	[[ -d "$dir" && ! -L "$dir" ]] && SWIFTS+=("$dir/usr/bin")
done
IFS=$OLDIFS
unset dir

function chswift_reset()
{
	[[ -z "$DEVELOPER_DIR" && -z "$CHSWIFT_TOOLCHAIN" ]] && return

	PATH=":$PATH:"; PATH="${PATH//:$DEVELOPER_DIR\/$TOOL_DIR:/:}"
	PATH="${PATH//:$CHSWIFT_TOOLCHAIN:/:}"
	PATH="${PATH#:}"; PATH="${PATH%:}"
	unset DEVELOPER_DIR
	hash -r
}

function chswift_use()
{
	if [[ ! -x "$1/$TOOL_DIR/swift" ]]; then
		echo "chswift: $1/$TOOL_DIR/swift not executable" >&2
		return 1
	fi

	chswift_reset

	export DEVELOPER_DIR="$1"
	export PATH="$DEVELOPER_DIR/$TOOL_DIR:$PATH"

	hash -r
}

function chswift_use_toolchain()
{
	if [[ ! -x "$1/swift" ]]; then
		echo "chswift: $1/$TOOL_DIR/swift not executable" >&2
		return 1
	fi

	chswift_reset

	export CHSWIFT_TOOLCHAIN="$1"
	export PATH="$CHSWIFT_TOOLCHAIN:$PATH"

	hash -r
}

function swift_version()
{
	DEVELOPER_DIR='' "$1/usr/bin/xcrun" swift --version|head -n 1|perl -pe 's/.*? ([^ ]+ \(.*?\))/$1/'
}

function chswift()
{
	case "$1" in
		-h|--help)
			echo "usage: chswift [SWIFT|VERSION|system]"
			;;
		-V|--version)
			echo "chswift: $CHSWIFT_VERSION"
			;;
		"")
			local dir star selected
			selected="$("xcode-select" -p)"
			for dir in "${XCODES[@]}"; do
				if [[ "$dir" == "${selected%/}" ]]; then star="*"
				else                                     star=" "
				fi

				echo " $star $(swift_version "$dir")"
			done|sort -n
			;;
		system) chswift_reset ;;
		*)
			local dir match
			for dir in "${XCODES[@]}"; do
				case "$(swift_version "$dir")" in
					"$1")	match="$dir" && break ;;
					"$1"*)	match="$dir" ;;
				esac
			done

			if [[ -z "$match" ]]; then
				echo "chswift: unknown Swift: $1" >&2
				return 1
			fi

			shift
			chswift_use "$match" "$*"
			;;
	esac
}
