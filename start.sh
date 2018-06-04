#!/bin/sh

if [ "$(ls /opt/azurite/folder/)" ]; then
  echo "Folder /opt/azurite/folder/ must be empty for this version of Azurite."
  exit 1
fi

if [ -z "$DATAFOLDER" ]; then
  echo "Cannot find environment variable DATAFOLDER"
  exit 1
fi

if [ -z "$SMBUSER" ]; then
  echo "Cannot find environment variable SMBUSER"
  exit 1
fi

if [ -z "$SMBUSERPWD" ]; then
  echo "Cannot find environment variable SMBUSERPWD"
  exit 1
fi

mount -t cifs "$DATAFOLDER" /opt/azurite/folder/ -o username="$SMBUSER",password="$SMBUSERPWD",noexec
if [[ $? -ne 0 ]]; then
  echo "SMB mount failed. Maybe you are forgot --cap-add=SYS_ADMIN parameter?"
  exit 1
fi

node bin/$executable -l /opt/azurite/folder

umount /opt/azurite/folder