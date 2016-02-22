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

RUN cp -r /opt/karma-config-base/preloaded_ontologies $HOME/karma 

EXPOSE 8080

ENTRYPOINT ["cd /opt/Web-Karma/karma-web && mvn jetty:run "]
CMD ["/bin/bash"]


# TODO: 

# 	- add main ontologies (DC, SKOS, ... to the repo)
# 	- set up preload_ontologies from the Dockerfile
# 	- include test some test files (CSV, XLS, ...)
