# Pull from base Ubuntu image
FROM ubuntu:14.04
# Do system updates and install dependencies
RUN apt-get update
RUN sudo apt-get -y install git curl
RUN apt-get clean
# Download Drone.io
RUN curl http://downloads.drone.io/master/drone.deb?nocache=20150731 -O /tmp/drone.deb
RUN dpkg -i /tmp/drone.deb
RUN rm /tmp/drone.deb
# Expose the Drone.io port
EXPOSE 8080
# Default port
ENV DRONE_SERVER_PORT 0.0.0.0:8080
# Default db location
ENV DRONE_DATABASE_DATASOURCE /var/lib/drone/drone.sqlite
# Some Gitlab defaults
ENV DRONE_GITLAB_SKIP_VERIFY false
ENV DRONE_GITLAB_OPEN false
# The command we'll be running when the container starts
CMD /usr/local/bin/droned
