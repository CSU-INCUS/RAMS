#!/bin/bash

cd /nobackupp19/swfreema/INCUS/basin_simulations/philippines_camp2ex_summer/rams_code/RAMS/bin.dp.grib1

# needs trailing slash
OUT_DIR="/nobackupp19/swfreema/INCUS/basin_simulations/philippines_camp2ex_summer/dprep/B1_R1/"

YEAR=2019
MONTH=09
START_DAY=09
END_DAY=12
START_HOUR=9
for day in $(seq -f "%02g" $START_DAY $END_DAY)
do
    for hour in $(seq -f "%02g" 0 23)
    do
        ./dgrib-6.3.02 -t 6 -d 201909$day$hour -h 0 -f /nobackupp19/swfreema/INCUS/basin_simulations/philippines_camp2ex_summer/era5/era5_201909"$day"_all.grib
        mv dp-p$YEAR-$MONTH-$day-"$hour"00* $OUT_DIR
    done
done