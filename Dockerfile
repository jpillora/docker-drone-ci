# Pull from base Ubuntu image
FROM ubuntu:14.04
# Do system updates and install dependencies
RUN apt-get update
RUN sudo apt-get -y install git curl
RUN apt-get clean
# Download Drone.io
RUN echo "build 2015-09-22"
RUN curl -o drone.deb "http://downloads.drone.io/master/drone.deb"
RUN dpkg -i drone.deb
RUN rm drone.deb
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
