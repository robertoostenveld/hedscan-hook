#!/bin/bash
#
# Use as:
#   hedscan-hook.sh <infile> <outfile>
# where the infile is a json/toml/yaml/ini file with some information _from_ the GUI
# and the outfile is a file with the information _to_ the GUI

INFILE=$1
OUTFILE=$2

if [ ! -z "$INFILE" ] ; then
echo reading from $INFILE
# This would allow the hook script to receive some information from the graphical application
# for example some general settings or something about the dialog
cat $INFILE || exit 1
fi

# Here in the middle section the actual work would happen
# for example, the script would contact the agenda used for scheduling to "pick up" the participant identifier and project number

if [ ! -z "$OUTFILE" ] ; then
echo writing $OUTFILE
echo projectid=3031000.01  > $OUTFILE || exit 1
echo subjectid=emptyroom  >> $OUTFILE
echo operator=$(whoami)   >> $OUTFILE
fi

# Following completion of the hook, the GUI application that does the system call 
# would read the OUTFILE and use the information to fill in the fields in the GUI

exit 0

