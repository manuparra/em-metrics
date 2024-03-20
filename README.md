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

Parameters:

- DURATION:
    - ``0``: "Recent",
    - ``1``: "One_hour",
    - ``2``: "Six_hours",
    - ``3``: "Twelve_hours",
    - ``4``: "One_day",
    - ``5``: "Seven_Days",
    - ``6``: "One_Month",
    - ``7``: "Three_Months",
    - ``8``: "Six_Months",
    - ``9``: "One_Year"

## Output results

Within the output directory all metric results for: 
- Energy consumption 
- Temperature

They are stored as: ``power_metrics.csv`` and ``temperature_metrics.csv`` respectively.

### Power consumption Metrics

It has 4 fields: ``date``, ``maximum``, ``average`` and  ``minimum`` power consumption in Watts/houe (W/h).

````
2021-10-05 11:15,5263.0,4126.0,3973.0
2021-10-05 11:30,5299.0,4124.0,3977.0
2021-10-05 11:45,5288.0,4129.0,3973.0
````

### Temperature Metrics

It has 3 fields: ``date``, ``maximum`` and ``average`` temperature in Celsius (Cº)

````
2021-10-05 11:15,28.0,24.526315789473685
2021-10-05 11:30,28.0,24.57894736842105
2021-10-05 11:45,28.0,24.894736842105264
2021-10-05 12:00,28.0,24.894736842105264
````

## Workflow

0. Use a CRON job to run ``compose.sh``
1. App capture data: power and temperature
2. Data are append to ``output/*.csv``
3. Folder ``output/*.csv`` is commited to this repository to store data



