. ./test/helper.sh

function setUp() {
	chswift_reset
}

function test_chswift_list() {
	output=`chswift|tr '\n' ' '`
	assertEquals "wrong list" "$LIST" "$output"
}

SHUNIT_PARENT=$0 . $SHUNIT2