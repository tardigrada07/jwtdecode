#!/bin/bash

if [[ -z $1 ]]; then
  echo "Simple, command line JWT token decoder"
  echo "Usage: jwtdecode.sh <filename.json> | <token string>"
  echo "For example:"
  echo "* Decode JWT token from a file:   ./jwtdecode.sh token.json"
  echo "* Decode JWT token from a string: ./jwtdecode.sh eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
  exit 1
elif [[ $1 == *.json && -f $1 ]]; then
  jwt_token=$(cat "$1")
else
  jwt_token=$1
fi

# Decode and split the JWT token
IFS='.' read -r header payload signature <<< "$jwt_token"

# Function for base64 decoding with proper padding
base64_decode() {
  local encoded=$1
  local len=$((${#encoded} % 4))
  if [ "$len" -eq 2 ]; then
    encoded="$encoded"==
  elif [ "$len" -eq 3 ]; then
    encoded="$encoded"=
  fi
  echo "$encoded" | base64 -d
}

# Decode the base64-encoded parts and convert them to JSON
header_json=$(base64_decode "$header" | jq .)
payload_json=$(base64_decode "$payload" | jq .)

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print JSON blocks
echo "Header"
echo -e "${RED}$header_json${NC}"
echo "Payload"
echo -e "${GREEN}$payload_json${NC}"
echo "Signature"
echo -e "${BLUE}$signature${NC}\n"
