# Description
Docker image for samba.

# Usage
```Docker
docker create \
  --name=samba \
  -e TIMEZONE=<<TIMEZONE|default(UTC)>> \
  -e SMB_USERNAME=<<USERNAME|default(samba)>> \
  -e SMB_PASSWORD=<<PASSWORD|default(samba)>> \
  -p 137:137/udp \
  -p 138:138/udp \
  -p 139:139 \
  -p 445:445 \
  -v path to samba configs:/etc/samba \
  --restart unless-stopped \
  dschinghiskahn/samba
```
