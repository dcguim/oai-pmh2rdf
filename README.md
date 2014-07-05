
# The Project

We plan to create a set of XSL transformations to transform XML files,
retrieved from [OAI-PMH](http://en.wikipedia.org/wiki/OAI-PMH)
requests to RDF.

The RDF will be based on:

1. The vocabularies used in 
   [SLattes](https://github.com/arademaker/SLattes).

2. [VIVO Ontology](https://code.google.com/p/connect-isf/).

## Status

We currently version is still not robust enough to deal with problems
in the metadata. The mets2rdf transformation is tested only with few
sets from the FGV's digital library. Next steps on the todo.org file.

## Use

We can use the script test.bash. The two last lines help to debug the
produced RDF file.

## Team

- Alexandre Rademaker
- Daniel Guimaraes
- Eric Grinstein

## Links

- [Bibo Ontology](https://bibotools.googlecode.com/svn/bibo-ontology/trunk/doc/contents.html)
- [VIVO-ISF Ontology](https://wiki.duraspace.org/display/VIVO/VIVO-ISF+Ontology)

- [Chapter 17 of the XML Bible](http://www.cafeconleche.org/books/bible2/chapters/ch17.html)
- [RDF/XML Syntax](http://www.w3.org/TR/rdf-syntax-grammar/)
- [OAI-PMH Protocol](http://www.openarchives.org)

- [Raptor command line programs](http://librdf.org)
- http://xmlsoft.org/XSLT/xsltproc2.html
- http://curl.haxx.se

## License

<p><a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">OAI-PMH2RDF</span> by <a xmlns:cc="http://creativecommons.org/ns#" href="https://github.com/arademaker/oai-pmh2rdf" property="cc:attributionName" rel="cc:attributionURL">Alexandre Rademaker</a> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>. Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/arademaker/oai-pmh2rdf" rel="dct:source">https://github.com/arademaker/oai-pmh2rdf</a></p>.

