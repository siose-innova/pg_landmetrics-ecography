#!/bin/sh

out=parsed-$(basename $1 .csv).csv

if [ ${1: -4} == ".csv" ] 
then
  #Parse data
  paste -d ',' <(sed -nr 's/.*EXECUTE.([^"]+)\(\x27.....\x27\);""/\1/p' $1) \
               <(sed -nr 's/.*EXECUTE.*\(\x27([^"]+)\x27\);""*/\1/p' $1) \
               <(sed -nr 's/.*duration:.([^"]+).ms.*/\1/p' $1) > $out

  #Add header
  sed  -i '1i metric,geohash,duration' $out

else
  echo "Only works with CSV!!!"
fi

