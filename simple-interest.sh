
#!/bin/bash

echo "===== Simple Interest Calculator ====="

read -p "Enter Principal Amount: " principal
read -p "Enter Rate of Interest: " rate
read -p "Enter Time Period (in years): " time

# Validate numeric inputs
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] ||
   ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
    echo "Error: Please enter valid positive numbers."
    exit 1
fi

# Calculate simple interest
interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
    'BEGIN {printf "%.2f", (p*r*t)/100}')

total=$(awk -v p="$principal" -v i="$interest" \
    'BEGIN {printf "%.2f", p+i}')

echo "--------------------------------"
echo "Principal Amount: $principal"
echo "Rate of Interest: $rate%"
echo "Time Period: $time years"
echo "Simple Interest: $interest"
echo "Total Amount: $total"
echo "--------------------------------"
