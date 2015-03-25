[[ -z "$SHUNIT2"     ]] && SHUNIT2=/usr/local/bin/shunit2
[[ -n "$ZSH_VERSION" ]] && setopt shwordsplit

export PREFIX="$PWD/test"
export HOME="$PREFIX/home"
export PATH="$PWD/bin:$PATH"

export LIST=" * 1.1 (swift-600.0.57.4)    1.2 (swiftlang-602.0.47.4 clang-602.0.48) "
export VERSION_1_1="Swift version 1.1 (swift-600.0.57.4)"
export VERSION_1_2="Apple Swift version 1.2 (swiftlang-602.0.47.4 clang-602.0.48)"

. ./share/chswift/chswift.sh
chswift_reset

setUp() { return; }
tearDown() { return; }
oneTimeTearDown() { return; }