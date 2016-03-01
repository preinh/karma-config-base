#!/bin/bash

PRELOAD_DIR=preloaded_ontologies

# SKOS CORE
wget "https://www.w3.org/2009/08/skos-reference/skos.rdf"
mv skos.rdf $PRELOAD_DIR

# SKOS-XL
wget "https://www.w3.org/2009/08/skos-reference/skos-xl.rdf"
mv skos-xl.rdf $PRELOAD_DIR

# FOAF
wget "http://xmlns.com/foaf/spec/index.rdf"
mv index.rdf $PRELOAD_DIR/foaf_latest.rdf

# DC
wget "http://dublincore.org/2012/06/14/dcelements.rdf"
mv dcelements.rdf $PRELOAD_DIR

# DC-TERM
wget "http://dublincore.org/2012/06/14/dcterms.rdf"
mv dcterms.rdf $PRELOAD_DIR

# PROV
wget "http://www.w3.org/ns/prov-o"
mv prov-o $PRELOAD_DIR/prov-o.ttl

# QUDT
wget -O osg-qudt-1.01.ttl \
	 "http://qudt.org/1.1/schema/OSG_qudt-(v1.01).ttl"
mv osg-qudt-1.01.ttl $PRELOAD_DIR

# QUDT - Quantity
wget -O osg-quantity-1.1.ttl \
	 "http://qudt.org/1.1/schema/OSG_quantity-(v1.1).ttl"
mv osg-quantity-1.1.ttl $PRELOAD_DIR

# OP
wget -O observable_properties-no_meta.rdf \
	 "http://environment.data.gov.au/def/op?_format=rdf"
mv observable_properties-no_meta.rdf $PRELOAD_DIR

# registryVocab
wget -O registryVocab.ttl \
	 "https://raw.githubusercontent.com/UKGovLD/registry-core/master/src/main/vocabs/registryVocab.ttl"
mv registryVocab.ttl $PRELOAD_DIR
