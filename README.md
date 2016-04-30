# firefox-sync-docker
A simple dockerfile to host a firefoxsync server

## DISCLAIMER
This won't work as a standalone thing if you want to host your firefox sync system. 
You also need an account server as well as other things.
See [here](https://docs.services.mozilla.com/howtos/run-fxa.html) and [here](https://github.com/michielbdejong/fxa-self-hosting)

## Usage :

First build the image (after cloning the repo):
`docker build -t yourname/ffsync:last`
ezez
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
