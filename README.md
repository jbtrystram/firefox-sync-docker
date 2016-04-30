# firefox-sync-docker
A simple dockerfile to host a firefoxsync server

## Usage :

First build the image (after cloning the repo):
"""
 docker build -t yourname/ffsync:last
""" 

Then run it :
"""
docker run -d --name ffsync \
 --env DOMAIN=localhost --env PORT=5000 \
 -p 5000:5000 \
yourname/ffsync:last
"""


That will give you a server running on http://localhost:5000
