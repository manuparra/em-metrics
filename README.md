# OME metrics
This is a repository to extract different metrics from the OpenManage Enterprise service running in a Dell cluster.


## How to start

Clone this repository

````
git clone ....

cd ome-metrics
````

Install libraries

````
pip3 install requirements.txt
````

## Run metrics extraction

````
bash compose.sh <IP> <USERNAME> <PASSWORD> <GROUPID> <DURATION>
````

Example:

````
# It will extract latest metrics (last 30 minutes)
bash compose.sh 10.0.10.1 admin adminpwd 10923 1
````

## Output results

Within the output directory all metric results for: 
- Energy consumption 
- Temperature

They are stored as: ``power_metrics.csv`` and ``temperature_metrics.csv`` respectively.

### Power Metrics

It has 4 fields: ``date``, ``maximum``, ``average`` and  ``minimum`` power consumption.

### Temperature Metrics

It has 3 fields: ``date``, ``maximum`` and ``average`` temperature in Celsius (Cº)

````
2021-10-05 11:15,28.0,24.526315789473685
2021-10-05 11:30,28.0,24.57894736842105
2021-10-05 11:45,28.0,24.894736842105264
2021-10-05 12:00,28.0,24.894736842105264
````

##
