#! /bin/bash

# This is just a test for functionality, not for normal use

ask_if_succeeded () {
    read -p "$1 (y/n):  " -n 1 -r
    echo    # (optional) move to a new line
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        echo "FAIL :(" >&2
        exit 1
    fi
}

./reporter.sh echo "whatever"
ask_if_succeeded "Did you see 'whatever' and hear 'yay!'?"

./reporter.sh false
ask_if_succeeded "Did you hear 'crap a doo'?"

./reporter.sh
ask_if_succeeded "Did you hear 'done'?"

./reporter.sh --failure-only echo "You can see me?"
ask_if_succeeded "ALSO, you didn't hear anything, right?"

./reporter.sh --failure-only false
ask_if_succeeded "Did you hear 'crap a doo'?"

./reporter.sh --failure-only
ask_if_succeeded "Did you hear 'done'?"

echo "now run the following and make sure CTRL-C doesn't make a sound:
./reporter.sh sleep 30"