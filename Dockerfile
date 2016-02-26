FROM ubuntu
MAINTAINER "Marlon Pirchiner" 

ENV HOME /root
# ADD . /root/karma

RUN apt-get update && apt-get install -y --no-install-recommends curl wget git sysv-rc-conf openjdk-7-jdk maven 

RUN cd /opt && \
	git clone https://github.com/usc-isi-i2/Web-Karma.git

RUN cd /opt/Web-Karma && \
	mvn clean install -DskipTests
#	mvn clean install

RUN cd /opt && \
	git clone https://github.com/preinh/karma-config-base.git

RUN mkdir --parents $HOME/karma/preloaded_ontologies && \
	cp -r /opt/karma-config-base/preloaded_ontologies/* $HOME/karma/preloaded_ontologies 

EXPOSE 8080

CMD ["/opt/karma-config-base/launch_karma.sh"]

# ENTRYPOINT ["/opt/karma-config-base/launch_karma.sh"]
# CMD ["/bin/bash"]
