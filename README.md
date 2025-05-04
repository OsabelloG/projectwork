#!/bin/bash

echo "Welcome to TravelEasy Flight Check-In"
echo "Please enter your full name:"
read name

echo "Hello $name!"
echo "Please select your travel class:"
echo "1. Economy"
echo "2. Business"
echo "3. First Class"

read -p "Enter the number corresponding to your class: " class_choice

# Assign class name
case $class_choice in
    1)
        travel_class="Economy"
        priority="Standard"
        baggage_allowance="15kg"
        lounge_access="No"
        ;;
    2)
        travel_class="Business"
        priority="High"
        baggage_allowance="30kg"
        lounge_access="Yes"
        ;;
    3)
        travel_class="First Class"
        priority="Highest"
        baggage_allowance="50kg"
        lounge_access="Yes (VIP)"
        ;;
    *)
        echo "Invalid selection. Defaulting to Economy."
        travel_class="Economy"
        priority="Standard"
        baggage_allowance="15kg"
        lounge_access="No"
        ;;
esac

echo ""
echo "----- Check-In Summary -----"
echo "Passenger Name     : $name"
echo "Travel Class       : $travel_class"
echo "Priority Boarding  : $priority"
echo "Baggage Allowance  : $baggage_allowance"
echo "Lounge Access      : $lounge_access"
echo "----------------------------"

echo "Thank you for checking in with TravelEasy. Have a great flight!"
