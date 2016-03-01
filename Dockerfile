# Docker image for run Karma integration tool:
# https://github.com/usc-isi-i2/Web-Karma
FROM ubuntu
MAINTAINER "Marlon Pirchiner" marlon.pirchiner@csiro.au

# updating and installing dependencies
ENV HOME /root
## ADD . /root/karma
RUN apt-get update && \
		apt-get install -y --no-install-recommends \
						curl wget git sysv-rc-conf openjdk-7-jdk maven

# cloning Karma lastest verions
RUN cd /opt && \
		git clone https://github.com/usc-isi-i2/Web-Karma.git
# installing Karma
RUN cd /opt/Web-Karma && \
		mvn clean install -DskipTests
## 	mvn clean install

# setting up the preload ontologies
RUN cd /opt && \
	git clone https://github.com/preinh/karma-config-base.git
RUN mkdir --parents $HOME/karma/preloaded_ontologies && \
	cp -r /opt/karma-config-base/preloaded_ontologies/* $HOME/karma/preloaded_ontologies

# enabling service port for external (host) access
EXPOSE 8080

# launching karma sevice
CMD ["/opt/karma-config-base/launch_karma.sh"]

# ENTRYPOINT ["/opt/karma-config-base/launch_karma.sh"]
# CMD ["/bin/bash"]
