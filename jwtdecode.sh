#!/bin/bash

# Print usage instructions if no argument is provided
if [[ -z $1 ]]; then
  echo "Simple, command line JWT token decoder"
  echo "Usage: jwtdecode.sh <token file> | <token string>"
  exit 1
elif [[ $1 == *.json && -f $1 ]]; then
  jwtToken=$(cat "$1")
else
  jwtToken=$1
fi

# Validate JWT token format
validate_jwt() {
  local token=$1
  IFS='.' read -r -a parts <<< "$token"
  if [ "${#parts[@]}" -ne 3 ]; then
    echo "Invalid JWT token"
    exit 1
  fi
}
validate_jwt "$jwtToken"

# Add padding to base64-encoded string if necessary
add_padding() {
  local encoded=$1
  case $((${#encoded} % 4)) in
    2) encoded+="==" ;;
    3) encoded+="=" ;;
  esac
  echo "$encoded"
}

# Decode Base64 string
decode_base64() {
  add_padding "$1" | base64 -d
}

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print JSON block with color
print_json_block() {
  local label=$1
  local json=$2
  local color=$3
  echo "$label"
  echo -e "${color}${json}$NC" # Reset color after output
}

# Decode and split the JWT token
IFS='.' read -r header payload signature <<< "$jwtToken"

# Decode the Base64-encoded parts and convert them to JSON
headerJson=$(decode_base64 "$header" | jq .)
payloadJson=$(decode_base64 "$payload" | jq .)

# Print JSON blocks
print_json_block "Header" "$headerJson" "$RED"
print_json_block "Payload" "$payloadJson" "$GREEN"
print_json_block "Signature" "$signature" "$BLUE"
