#!/bin/sh

#
# Wrapper script to use FileMerge as a diff-cmd in Subversion
#

FM="/Developer/Applications/Utilities/FileMerge.app/Contents/MacOS/FileMerge"
FMDIFF="$(basename $0)"
GN="/usr/local/bin/growlnotify"

while [ $# != 0 ]; do
	case $1 in
		-u)
			unified=1
		;;
		-L)
			shift
			if [ -z "$leftlabel" ]; then
				leftlabel=$1
			elif [ -z "$rightlabel" ]; then
				rightlabel=$1
			else
				echo "Too many labels" 1>&2
				exit 2
			fi
		;;
		-*)
			echo "Unknown option: $1" 1>&2
			exit 2
		;;
		*)
			if [ -z "$leftfile" ]; then
				leftfile=$1
			elif [ -z "$rightfile" ]; then
				rightfile=$1
			else
				echo "Too many files to diff" 1>&2
				exit 2
			fi
	esac
	shift
done

if [ -z "$leftfile" ] || [ -z "$rightfile" ]; then
	echo "Usage: $FMDIFF [options] leftfile rightfile" 1>&2
	exit 2
fi

if svn info "$rightfile" &>/dev/null; then
	mergefile="$rightfile"
fi

function labels {
	[ -n "$leftlabel"  ] && echo  Left: $leftlabel
	[ -n "$rightlabel" ] && echo Right: $rightlabel
	[ -n "$mergefile" ]  && echo Merge: $mergefile
}

echo Starting FileMerge... 1>&2
labels 1>&2
if [ -x "$GN" ]; then
	labels | "$GN" -a FileMerge -n "$FMDIFF" "Starting FileMerge"
fi

if [ -n "$mergefile" ]; then
	[[ "$mergefile" == */* ]] || mergefile="./$mergefile"
	exec "$FM" -left "$leftfile" -right "$rightfile" \
		-ancestor "$leftfile" -merge "$mergefile"
else
	exec "$FM" -left "$leftfile" -right "$rightfile"
fi

