#!/bin/bash

cd /nobackup/swfreema/INCUS/basin_simulations/congo_2021/rams_code/RAMS/bin.dp.grib1

# needs trailing slash
OUT_DIR="/nobackup/swfreema/INCUS/basin_simulations/congo_2021/dprep"

YEAR=2019
MONTH=09
START_DAY=15
END_DAY=24
START_HOUR=9
for day in $(seq -f "%02g" $START_DAY $END_DAY)
do
    for hour in $(seq -f "%02g" 0 23)
    do
        ./dgrib-6.3.02 -t 6 -d 202109$day$hour -h 0 -f /nobackup/swfreema/INCUS/basin_simulations/congo_2021/era5_download/combined_files/era5_202109"$day"_all.grib
        mv dp-p$YEAR-$MONTH-$day-"$hour"00* $OUT_DIR
    done
done