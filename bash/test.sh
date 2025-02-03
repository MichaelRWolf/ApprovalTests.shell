#!/bin/bash

echo "test: pass"
./verify.sh -t test1 <<< "test 1 approves this message
line 2"
echo ""

echo "test: fails and triggers diff tool"
./verify.sh -t test3 -d diff <<< "test 3 receives this input"
echo ""

./verify.sh -d meld <<<"Input to test without a name"

cat <<DIFF_TOOL_SELECTION | ./verify.sh -t diff_tool_selection -d 'pr -m -t'
# Logic for diff tool
# 1. --tool argument takes top priority.
# 2. If no --tool is specified, GIT_DIFF_TOOL is checked next.
# 3. If GIT_DIFF_TOOL is unset, git config --get diff.tool is used.
# 4. If neither is set, Git falls back to its internal diff.
DIFF_TOOL_SELECTION
