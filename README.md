# docker-droneci

Drone CI as a docker image

### Usage

``` sh
#prepare docker host
$ mkdir -p /opt/drone
$ touch /opt/drone/drone.log
$ touch /opt/drone/drone.sqlite
#spin up the 
docker run \
    --name drone \
    -d \
    -p 8080:8080 \
    -v /var/lib/drone/ \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /opt/drone/drone.log:/var/log/upstart/drone.log \
    -v /opt/drone/drone.sqlite:/var/lib/drone/drone.sqlite \
    -e DRONE_FOO=foo \
    -e DRONE_BAR=bar \
    quay.io/jpillora/drone-ci:latest
```

Visit [Drone Setup](https://github.com/drone/drone#setup) and scroll down to the environment variables section. Add in as many `-e DRONE_...` variables as you need. I'm using @sameersbn's [docker-gitlab](https://github.com/sameersbn/docker-gitlab) image along side this one so I just needed the Gitlab settings: `DRONE_GITLAB_URL` which is used for the authentication callback and `DRONE_GITLAB_[CLIENT|SECRET]` for the Gitlab application permissions.

#### MIT License

Copyright &copy; 2015 Jaime Pillora &lt;dev@jpillora.com&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.