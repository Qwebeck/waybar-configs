#!/bin/bash

STORAGE_LEVEL=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
STORAGE_USED=$(df -h / | awk 'NR==2 {print $3}')
STORAGE_TOTAL=$(df -h / | awk 'NR==2 {print $2}')

if [ "$STORAGE_LEVEL" -ge 90 ]; then
    CLASS="critical"
elif [ "$STORAGE_LEVEL" -ge 75 ]; then
    CLASS="warning"
else
    CLASS="normal"
fi

echo '{"text": "'$STORAGE_USED'/'$STORAGE_TOTAL'", "class": "'$CLASS'", "percentage": '$STORAGE_LEVEL'}'
