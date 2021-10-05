
#!/bin/bash

python3 metrics/get-power-metrics.py \
  --ip $1\
  --password $2\
  --username $3\
  --groupID $4\
  --duration $5 ;

python3 metrics/get-temperature-metrics.py \
  --ip $1\
  --password $2\
  --username $3\
  --groupID $4\
  --duration $5 ;

## Append last data generated
cat output/partial_power_metrics.csv >> output/power_metrics.csv
rm output/partial_power_metrics.csv
cat output/partial_temperature_metrics.csv >> output/temperature_metrics.csv
rm output/partial_temperature_metrics.csv

## Add to the repository
git add output/power_metrics.csv
git add output/temperature_metrics.csv
git commit -m "Update power and temperature `date`"
git push

