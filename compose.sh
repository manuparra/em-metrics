
#!/bin/bash


python3 $HOME/em-metrics/metrics/get-power-metrics.py \
  --ip $1\
  --password $2\
  --username $3\
  --groupID $4\
  --duration $5 ;

python3 $HOME/em-metrics/metrics/get-temperature-metrics.py \
  --ip $1\
  --password $2\
  --username $3\
  --groupID $4\
  --duration $5 ;

## Append last data generated
cat $HOME/em-metrics/output/partial_power_metrics.csv >> $HOME/em-metrics/output/power_metrics.csv
rm $HOME/em-metrics/output/partial_power_metrics.csv
cat $HOME/em-metrics/output/partial_temperature_metrics.csv >> $HOME/em-metrics/output/temperature_metrics.csv
rm $HOME/em-metrics/output/partial_temperature_metrics.csv

## Add to the repository
git add $HOME/em-metrics/output/power_metrics.csv
git add $HOME/em-metrics/output/temperature_metrics.csv
git commit -m "Update power and temperature `date`"
git push

