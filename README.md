# azurite-smb
Build arafato/azurite docker image together with smbclient

# Usage
## Build
```bash
docker build . azurite-smb
```

## Run
```bash
docker run -it -e executable=blob -e DATAFOLDER="//server/share" -e SMBUSER="user" -e SMBUSERPWD="password" --privileged --rm -p 10000:10000 azurite-smb
```
