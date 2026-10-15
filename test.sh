#!/bin/sh
set -eu
test -s index.html
grep -q "My First Jenkins CI/CD Pipeline!" index.html
echo "Website test passed!"
