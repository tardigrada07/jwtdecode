# jwtdecoder
Simple, command line JWT token decoder.
- Decoding JSON Web Tokens from the Linux command line
- Offline
- Secure

## Usage
### Make it runnable
```shell
$ chmod +x jwtdecode.sh
```

### Decode token from a string
```shell
$ ./jwtdecode.sh eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
Header
{
  "alg": "HS256",
  "typ": "JWT"
}
Payload
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022
}
Signature
SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```

### Decode token from a json file
```shell
$ echo "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c" > token.json
$ ./jwtdecode.sh token.json
Header
{
  "alg": "HS256",
  "typ": "JWT"
}
Payload
{
  "sub": "1234567890",
  "name": "John Doe",
  "iat": 1516239022
}
Signature
SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```
