. ./test/helper.sh

function setUp() {
	chswift_reset
}

function test_chswift_list() {
	output=$(chswift)
	assertEquals "wrong list" "`echo -e "$LIST"`" "$output"
}

function test_chswift_list_robustness() {
	export DEVELOPER_DIR="/Applications/Xcode.app/Contents/Developer/"
	expected=$(echo -e "$LIST"|tr '*' ' '|sort -n|tr -d '\n')
	output=$(chswift|tr -d '\n')
	assertEquals "wrong list" "$expected" "$output"
}

SHUNIT_PARENT=$0 . $SHUNIT2
