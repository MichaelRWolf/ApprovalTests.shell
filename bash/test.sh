#!/bin/bash

function test1() {
	test_name="${FUNCNAME[0]}"
	echo "test: pass"
	./verify.sh -t "$test_name" <<<"test 1 approves this message
line 2"
	echo ""
}

function test2() {
	true
}

function test3() {
	test_name="${FUNCNAME[0]}"
	echo "test: fails and triggers diff tool"
	./verify.sh -t "$test_name" -d diff <<<"test 3 receives this input"
	echo ""
}

function test4() {
	test_name="${FUNCNAME[0]}"
	./verify.sh -d meld <<<"Input to test without a name"
}

function test_diff_tool_selection() {
	test_name="${FUNCNAME[0]}"
	cat <<DIFF_TOOL_SELECTION | ./verify.sh -t "$test_name"
# Logic for diff tool
# 1. --tool argument takes top priority.
# 2. If no --tool is specified, GIT_DIFF_TOOL is checked next.
# 3. If GIT_DIFF_TOOL is unset, git config --get diff.tool is used.
# 4. If neither is set, Git falls back to its internal diff.
DIFF_TOOL_SELECTION
}

function test_all() {
	test1
	test2
	test3
	test4
	test_diff_tool_selection
}

test_all
