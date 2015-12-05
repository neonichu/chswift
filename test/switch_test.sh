. ./test/helper.sh

function test_chswift_reset() {
	chswift 1.2
	chswift_reset
	assertEquals "wrong version" "$VERSION_1_1" "$(swift --version|head -n 1)"
}

function test_chswift_reset_toolchain() {
	CHSWIFT_TOOLCHAIN=/yolo/bin
	PATH=$CHSWIFT_TOOLCHAIN:/bin:/usr/bin
	assertEquals "invalid setup" "/yolo/bin:/bin:/usr/bin" "$PATH"
	chswift_reset
	assertEquals "PATH not reset" "/bin:/usr/bin" "$PATH"
}

function test_chswift_switch() {
	chswift 1.2
	assertEquals "wrong version" "$VERSION_1_2" "$(swift --version|head -n 1)"
}

function test_chswift_switch_toolchain() {
	chswift 2.2-dev
	assertEquals "wrong version" "$VERSION_DEV" "$(swift --version|head -n 1)"
}

SHUNIT_PARENT=$0 . $SHUNIT2
