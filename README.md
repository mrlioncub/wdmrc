# hub.docker.com/r/mrlioncub/wdmrc
[![Build Status](https://img.shields.io/docker/cloud/build/mrlioncub/wdmrc)](https://hub.docker.com/r/mrlioncub/wdmrc)
[![Docker Automated build](https://img.shields.io/docker/cloud/automated/mrlioncub/wdmrc)](https://hub.docker.com/r/mrlioncub/wdmrc)
[![Docker Image Size](https://img.shields.io/docker/image-size/mrlioncub/wdmrc/latest)](https://hub.docker.com/r/mrlioncub/wdmrc)

Docker image on .Net Core for WebDAV emulator for Cloud.mail.ru / Yandex.Disk  
Original project https://github.com/yar229/WebDavMailRuCloud

# Usage

Default run on port 8888:

```bash
docker run -d -p8888:8888 mrlioncub/wdmrc
```
and example mount in linux:

```bash
mkdir ~/.davfs2
echo 'http://127.0.0.1:8888 <login>@mail.ru <password>' > ~/.davfs2/secrets
chmod 600 ~/.davfs2/secrets
echo http://127.0.0.1:8888 /mnt davfs user,rw,noauto 0 0 | sudo tee -a /etc/fstab
mount /mnt
```

# Options

Options this https://github.com/yar229/WebDavMailRuCloud#usage  
Example run on port 8080 and cache folders listing depth 2:

```bash
docker run -d -p8080:8080 mrlioncub/wdmrc -p 8080 --cache-listing-depth 2
```

# Links
https://github.com/yar229/WebDavMailRuCloud  
http://manpages.ubuntu.com/manpages/trusty/man8/mount.davfs.8.html
