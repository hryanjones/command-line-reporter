#! /bin/bash

# Feel free to edit these words to your liking
SUCCESS_PHRASE="success"
FAILURE_PHRASE="oopsie doopsie"
FINISHED_PHRASE="done"

# Also feel free to pick a different program to speak the report
TALKING_PROGRAM=`command -v espeak || command -v say ||  command -v spd-say`



if [ -z "$TALKING_PROGRAM" ]; then
    echo "ERROR: 'reporter' couldn't find a program to speak when the command is done. You should try to install one like 'say' or 'espeak'." >&2
    exit 1
fi

SUCCESS_QUIET=0 # if true don't speak if the command succeeds
COMMAND_TO_RUN="$@"

if [ "$1" == "--failure-only" ]; then
    SUCCESS_QUIET=1
    COMMAND_TO_RUN="${@:2}" # get the rest of inputs besides the flag
fi

if [ -z "$COMMAND_TO_RUN" ] ; then
    # bail early if there's no command to run
    eval "$TALKING_PROGRAM \"$FINISHED_PHRASE\""
    echo -ne "\a" # activate the bell in case missed the spoken status
    exit
fi

eval "$COMMAND_TO_RUN"
RESULT=$? # store the return of the actual function run

# respond via speaking to indicate success or failure
if [ $RESULT -eq 0 ]
then
    if [ $SUCCESS_QUIET -eq 0 ]; then
        eval "$TALKING_PROGRAM \"$SUCCESS_PHRASE\""
    fi
else
    eval "$TALKING_PROGRAM \"$FAILURE_PHRASE\""
fi

echo -ne "\a" # activate the bell in case missed the spoken status

# Exit with the status of the arguments to ensure consistency when chaining this with later commands
exit $STATUS