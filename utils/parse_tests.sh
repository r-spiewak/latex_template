#!/bin/bash

# Assume log file is given as the first argument:
LOGFILE="$1"

if [ -z "$LOGFILE" ]; then
  echo "Usage: $0 logfile.log"
  exit 1
fi
if ! [ -f "$LOGFILE" ]; then
  echo "Logfile $LOGFILE not found."
  exit 1
fi

# Extract only relevant lines:
# TEST_LINES=$(grep "\[testmacros\]" "$LOGFILE")
TEST_LINES=$(grep "\[TEST\]" "$LOGFILE")

# Count totals:
TOTAL=$(echo "$TEST_LINES" | wc -l)
PASSED=$(echo "$TEST_LINES" | grep -F '{PASS}' | wc -l)
FAILED=$(echo "$TEST_LINES" | grep -F '{FAIL}'| wc -l)

# Optional: verbose report:
echo "===== Detailed Results ====="
echo "$TEST_LINES" | while read -r line; do
  if echo "$line" | grep -q '{PASS}'; then
    echo "✅  $line"
  else
    echo "❌  $line"
  fi
done

# Print summary:
echo "===== Test Summary ====="
echo "Total tests: $TOTAL"
echo "Passed:      $PASSED"
echo "Failed:      $FAILED"
echo ""

if [ $FAILED -gt 0 ]; then
  exit 1
fi
