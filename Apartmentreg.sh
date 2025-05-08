#!/bin/bash

echo "╔══════════════════════════════════════╗"
echo "║   SUNSHINE APARTMENTS REGISTRATION   ║"
echo "╚══════════════════════════════════════╝"
echo ""
echo "Please provide your information below:"
echo ""

get_valid_name() {
    while true; do
        read -p "Full Name: " name
        if [[ "$name" =~ ^[a-zA-Z\ ]{2,50}$ ]]; then
            break
        else
            echo "Please enter a valid name (2-50 letters and spaces only)"
        fi
    done
    echo "$name"
}

get_valid_email() {
    while true; do
        read -p "Email: " email
        if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
            break
        else
            echo "Please enter a valid email (example@domain.com)"
        fi
    done
    echo "$email"
}

get_valid_phone() {
    while true; do
        read -p "Phone (10 digits): " phone
        # Remove any non-digit characters
        phone=$(echo "$phone" | tr -cd '[:digit:]')
        if [[ "${#phone}" -eq 10 ]]; then
            break
        else
            echo "Please enter a 10-digit phone number"
        fi
    done
    echo "$phone"
}

select_apartment() {
    echo ""
    echo "Available Apartment Types:"
    echo "1. Studio ($800/month)"
    echo "2. 1-Bedroom ($1100/month)"
    echo "3. 2-Bedroom ($1500/month)"
    echo ""
    
    while true; do
        read -p "Choose apartment (1-3): " choice
        case $choice in
            1) echo "Studio"; break ;;
            2) echo "1-Bedroom"; break ;;
            3) echo "2-Bedroom"; break ;;
            *) echo "Invalid choice. Please enter 1, 2, or 3." ;;
        esac
    done
}
get_move_in_date() {
    while true; do
        read -p "Move-in Date (MM/DD/YYYY): " date
        if [[ "$date" =~ ^[0-9]{2}/[0-9]{2}/[0-9]{4}$ ]]; then
            break
        else
            echo "Please use MM/DD/YYYY format"
        fi
    done
    echo "$date"
}
register() {
    echo ""
    echo "=== Registration Form ==="
    
    name=$(get_valid_name)
    email=$(get_valid_email)
    phone=$(get_valid_phone)
    apartment=$(select_apartment)
    move_in_date=$(get_move_in_date)
    
    echo ""
    echo "╔══════════════════════════════════════╗"
    echo "║        REGISTRATION SUMMARY         ║"
    echo "╠══════════════════════════════════════╣"
    echo "║ Name: $name"
    echo "║ Email: $email"
    echo "║ Phone: $phone"
    echo "║ Apartment: $apartment"
    echo "║ Move-in Date: $move_in_date"
    echo "╚══════════════════════════════════════╝"
    echo ""
    
    while true; do
        read -p "Is this information correct? (yes/no): " confirm
        case $confirm in
            [yY]|[yY][eE][sS])
                echo ""
                echo "Thank you for registering with Sunshine Apartments!"
                echo "We'll contact you soon at $email or $phone."
                echo "Have a wonderful day!"
                echo ""
                exit 0
                ;;
            [nN]|[nN][oO])
                echo "Let's start over..."
                echo ""
                register
                return
                ;;
            *)
                echo "Please answer yes or no."
                ;;
        esac
    done
}

# Start registration
register
