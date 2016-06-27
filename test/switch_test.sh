. ./test/helper.sh

function setUp() {
	chswift_reset
}

function test_chswift_reset() {
	chswift 2.3
	chswift_reset
	assertEquals "wrong version" "$VERSION_3_0" "$(swift --version|head -n 1)"
}

function test_chswift_reset_toolchain() {
	CHSWIFT_TOOLCHAIN=/yolo/bin
	PATH=$CHSWIFT_TOOLCHAIN:/bin:/usr/bin
	assertEquals "invalid setup" "/yolo/bin:/bin:/usr/bin" "$PATH"
	chswift_reset
	assertEquals "PATH not reset" "/bin:/usr/bin" "$PATH"
}

function test_chswift_switch() {
	chswift 2.3
	assertEquals "wrong version" "$VERSION_2_3" "$(swift --version|head -n 1)"
}

function test_chswift_switch_toolchain() {
	chswift 2.2-dev
	assertEquals "wrong version" "$VERSION_DEV" "$(swift --version|head -n 1)"
}

function test_chswift_switch_toolchain_one_star_only() {
	chswift 2.2
	assertEquals "wrong list" "1" "$(chswift|grep -c '*')"
}

function test_chswift_swiftenv_compatibility() {
	chswift swift-2.2-SNAPSHOT-2015-12-22-a
	assertEquals "wrong version" "$VERSION_DEV" "$(swift --version|head -n 1)"
}

SHUNIT_PARENT=$0 . $SHUNIT2
