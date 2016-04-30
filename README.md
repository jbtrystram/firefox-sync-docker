# firefox-sync-docker
A simple dockerfile to host a firefoxsync server

## Usage :

First build the image (after cloning the repo):
`docker build -t yourname/ffsync:last`

Then run it :
```
docker run -d --name ffsync \
 --env DOMAIN=localhost --env PORT=5000 \
 -p 5000:5000 \
yourname/ffsync:last
```

That will give you a server running on http://localhost:5000

### Using dockerhub
An automated build is available on dockerhub. Simply pull the image :
`docker pull jbtrystram/firefox-sync-docker`

## Keeping the data : 
A simple way to keep the data even if you discard the container:
` docker run -d --name ffsync_data --volumes-from ffsync busybox true `
