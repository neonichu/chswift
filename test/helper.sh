[[ -z "$SHUNIT2"     ]] && SHUNIT2=/usr/local/bin/shunit2
[[ -n "$ZSH_VERSION" ]] && setopt shwordsplit

export PREFIX="$PWD/test"
export HOME="$PREFIX/home"
export PATH="$PWD/bin:$PATH"

export LIST="   2.2 (swiftlang-703.0.18.5 clang-703.0.31)\n   2.2-dev (LLVM 3ebdbb2c7e, Clang f66c5bb67b, Swift 17fe37d715)\n   2.3 (swiftlang-800.10.6 clang-800.0.24.1)\n   3.0 (swiftlang-800.0.30 clang-800.0.24)\n   3.0-dev (LLVM c191431197, Clang c6195325c5, Swift add621a959)"
export VERSION_3_0="Apple Swift version 3.0 (swiftlang-800.0.30 clang-800.0.24)"
export VERSION_2_3="Apple Swift version 2.3 (swiftlang-800.10.6 clang-800.0.24.1)"
export VERSION_DEV="Apple Swift version 2.2-dev (LLVM 3ebdbb2c7e, Clang f66c5bb67b, Swift 17fe37d715)"
export TOOLCHAINS="/Applications/Xcode-8.0.app/Contents/Developer/Toolchains/Swift_2.3.xctoolchain/usr/bin"

. ./share/chswift/chswift.sh
chswift_reset

setUp() { return; }
tearDown() { return; }
oneTimeTearDown() { return; }
