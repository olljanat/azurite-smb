# azurite-smb
Build arafato/azurite docker image together with smbclient.
Automatically map SMB share to /opt/azurite/folder/ folder before starting azurite.

# Known issues
Currently it is not possible to give --cap-add=SYS_ADMIN or --privileged parameter for docker services so you cannot use this with swarm mode.
Look:
- https://github.com/moby/moby/issues/32801
- https://github.com/docker/swarmkit/issues/1030


# Usage
## Build
```bash
docker build . -t azurite-smb
```

## Run
```bash
docker run -it -e executable=blob -e DATAFOLDER="//server/share" -e SMBUSER="user" -e SMBUSERPWD="password" --cap-add=SYS_ADMIN -p 10000:10000 azurite-smb
```
