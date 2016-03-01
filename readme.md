Karma Config - CSIRO L&W
========================

Karma
-----

Karma is a data integration framework which provide
	- easy import from diverse sources (databases, CSV, excel files, etc...)
	- easy data transform (python scripts, regex and more)
	- easy model/mapping using preload ontologies or new ones.

For more info about Karma, check the developers repository https://github.com/usc-isi-i2/Web-Karma

CSIRO
-----

The planned use of Karma on CSIRO is to help on vocabulary extraction through SKOS modeling.

This repository contains a simple script to download the main ontologies involved in this process and a *Dockerfile* to help the service deployment.


Preload ontologies
------------------

By running the script ```preloaded_ontologies_download.sh```, some high level ontologies such as SKOS, PROV-O,Dublin Core, FOAF, QUDT and OP will be downloaded and a copy will be stored in the ```preloaded_ontologies``` directory. The Docker file use that files to configure Karma to load them at start.

DockerFile
----------

The Dockerfile describe an Ubuntu instance of Karma running over Jetty in the port 8080.

The Karma install, compilation and service are made by Java and Maven.


More
----

See also the documentation for the [karma registry pipeline](./karma_registry_pipeline.md)
