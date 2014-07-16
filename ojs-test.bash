#!/bin/bash

URL="http://bibliotecadigital.fgv.br/ojs/index.php/agroanalysis/oai/?"
PARAMS="verb=ListRecords&metadataPrefix=oai_dc"
curl $URL$PARAMS -o input-ojs.xml
xsltproc oai2rdf-ojs.xsl input-ojs.xml | tidy -xml -i > ojs-fmt.rdf

