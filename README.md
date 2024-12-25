# jwtdecode
Simple, command line JWT token decoder.

`jwtdecode.sh` is a powerful, simple, and secure command-line utility to decode JSON Web Tokens (JWT). It works offline and is designed to run in Unix-like environments with minimal dependencies. 
The script decodes the Header, Payload, and Signature from a JWT string or from a file containing a JWT, and displays the results in a readable JSON format with color-coded output.

### Features
- **Offline operation**: No internet connection is required.
- **Decode formats**: Supports JWTs provided as a string or from a token file.
- **Error handling**: Provides checks for valid JWT format before decoding.
- **Color-coded output** for a better visual experience.

### Prerequisites
Ensure the following tools are installed on your system:
- **`jq`**: A lightweight and flexible JSON processor for pretty-printing JSON output.
- **`base64`**: A standard utility for encoding/decoding Base64 strings (commonly installed by default with most Unix distributions).

### Usage
#### Make the script executable
```shell
chmod +x jwtdecode.sh
```
---
#### Decode a JWT from a string
```shell
./jwtdecode.sh <token_string>
```
#### Decode a JWT from a token file
```shell
./jwtdecode.sh <token_file>
```
---
#### Examples
```shell
# Decode a JWT from a string
./jwtdecode.sh eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c

# Decode a JWT from a token file
echo "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" > token
./jwtdecode.sh token
```
