#!/bin/bash

TODAY=`date +"%d_%m_%Y"`
CSV_DIR=/app/public/files/csvs
BACKUP_DIR=/app/public/files/csv-backups
day=$(date +%A)
backup_name="portalcsvs"
day_num=$(date +%d)
month_num=$(date +%m)
month=$(expr $month_num % 2)

mkdir -p $CSV_DIR
mkdir -p $BACKUP_DIR

rm $CSV_DIR/*.csv

/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/esd_hs_2013 > $CSV_DIR/esd_hs_2013-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/esd_k8_2013 > $CSV_DIR/esd_k8_2013-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/esd_k8_2013_r1 > $CSV_DIR/esd_k8_2013_r1-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/fiveessentials_2013 > $CSV_DIR/fiveessentials_2013-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/earlychild > $CSV_DIR/earlychild-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/esd_el_2014 > $CSV_DIR/esd_el_2014-$TODAY.csv
/usr/bin/curl https://portal.excellentschoolsdetroit.org/csv/schools > $CSV_DIR/schools-$TODAY.csv

if (( $day_num <= 7 )); then
        week_file="$backup_name-week1.tgz"
elif (( $day_num > 7 && $day_num <= 14 )); then
        week_file="$backup_name-week2.tgz"
elif (( $day_num > 14 && $day_num <= 21 )); then
        week_file="$backup_name-week3.tgz"
elif (( $day_num > 21 && $day_num < 32 )); then
        week_file="$backup_name-week4.tgz"
fi

if [ $month -eq 0 ]; then
        month_file="$backup_name-month2.tgz"
else
        month_file="$backup_name-month1.tgz"
fi

if [ $day_num == 1 ]; then
  archive_file=$month_file
elif [ $day != "Saturday" ]; then
        archive_file="$backup_name-$day.tgz"
else
  archive_file=$week_file
fi

tar czf $BACKUP_DIR/$archive_file $CSV_DIR
