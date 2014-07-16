#!/bin/bash

URL="http://bibliotecadigital.fgv.br/oai/request?"
PARAMS="verb=ListRecords&metadataPrefix=mets&set=hdl_10438_10191"
curl $URL$PARAMS -o input-dspace.xml
xsltproc mets2rdf-dspace.xsl input-dspace.xml > input-dspace.rdf
rapper -c input-dspace.rdf
roqet -e "select distinct ?s { ?s ?p ?v .}" -D input-dspace.rdf
