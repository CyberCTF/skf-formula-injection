#!/bin/sh
# Pages can be added and exported as a spreadsheet.
set -e
H=http://web:5000
curl -fsS -d "title=probe&content=probe$$" "$H/pages/add" -o /dev/null
curl -fsS "$H/pages/export" | grep -aq "probe$$"
