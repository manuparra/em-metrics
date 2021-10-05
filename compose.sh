
#!/bin/bash

## Append last data generated
cat output/partial_metrics.csv >> output/power_metrics.csv
rm output/partial_metrics.csv
## Add to the repository
git add output/power_metrics.csv
git commit -m "Update power consumption `date`"
git push

