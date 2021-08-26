#!/bin/bash


YEAR=$(date +%Y);
MONTH=$(date +%m);
DAY=$(date +%d);
HOUR=$(date +%H);
MIN=$(date +%M);
NAME="Untitled";
CONTENT="";


while [ True ]; do
if [ "$1" = "--year" -o "$1" = "-y" ]; then
	YEAR=$2;
	shift 2;
elif [ "$1" = "--month" -o "$1" = "-m" ]; then
	MONTH=$2;
	shift 2;
elif [ "$1" = "--day" -o "$1" = "-d" ]; then
	DAY=$2;
	shift 2;
elif [ "$1" = "--hour" -o "$1" = "-H" ]; then
	HOUR=$2;
	shift 2;
elif [ "$1" = "--min" -o "$1" = "-M" ]; then
	MIN=$2;
	shift 2;
elif [ "$1" = "--name" -o "$1" = "-n" ]; then
	NAME=$2;
	shift 2;
elif [ "$1" = "--content" -o "$1" = "-c" ]; then
	CONTENT=$2;
	shift 2;
else
    break
fi
done

FILEPATH=$HOME/.local/share/Agenda/$YEAR/$MONTH/$DAY/$HOUR/$MIN;

echo "Creating an event for $NAME...";
mkdir -p $FILEPATH;
echo $CONTENT | tee $FILEPATH/$NAME.txt;
