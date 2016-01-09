[[ -z "$SHUNIT2"     ]] && SHUNIT2=/usr/local/bin/shunit2
[[ -n "$ZSH_VERSION" ]] && setopt shwordsplit

export PREFIX="$PWD/test"
export HOME="$PREFIX/home"
export PATH="$PWD/bin:$PATH"

export LIST=" * 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)\n   1.2 (swiftlang-602.0.53.1 clang-602.0.53)\n   2.1 (swiftlang-700.1.101.6 clang-700.1.76)\n   2.2-dev (LLVM 3ebdbb2c7e, Clang f66c5bb67b, Swift 17fe37d715)\n"
export VERSION_1_1="Apple Swift version 2.1.1 (swiftlang-700.1.101.15 clang-700.1.81)"
export VERSION_1_2="Apple Swift version 1.2 (swiftlang-602.0.53.1 clang-602.0.53)"
export VERSION_DEV="Apple Swift version 2.2-dev (LLVM 3ebdbb2c7e, Clang f66c5bb67b, Swift 17fe37d715)"
export TOOLCHAINS="/Library/Developer/Toolchains/swift-2.2-SNAPSHOT-2015-12-22-a.xctoolchain/usr/bin"

. ./share/chswift/chswift.sh
chswift_reset

setUp() { return; }
tearDown() { return; }
oneTimeTearDown() { return; }
