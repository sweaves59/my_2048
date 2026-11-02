#!/bin/bash

# Display current weather for Indiana, PA

echo "=============================="
echo "    Weather for Indiana, PA"
echo "=============================="

curl -s --max-time 10 \
"https://api.open-meteo.com/v1/forecast?latitude=40.62&longitude=-79.16&current=temperature_2m,relative_humidity_2m,wind_speed_10m&temperature_unit=fahrenheit&wind_speed_unit=mph" |
python3 -c '
import json
import sys

try:
    data = json.load(sys.stdin)
    weather = data["current"]

    print("Temperature:", weather["temperature_2m"], "°F")
    print("Humidity:", weather["relative_humidity_2m"], "%")
    print("Wind Speed:", weather["wind_speed_10m"], "mph")
except (ValueError, KeyError):
    print("Weather information is currently unavailable.")
'

echo "=============================="
