#!/bin/bash

URL="http://bibliotecadigital.fgv.br/oai/request?"
PARAMS="verb=ListRecords&metadataPrefix=mets&set=hdl_10438_10191"
curl $URL$PARAMS -o input.xml
xsltproc mets2rdf.xsl input.xml > input.rdf
rapper -c input.rdf
roqet -e "select distinct ?s { ?s ?p ?v .}" -D input.rdf
