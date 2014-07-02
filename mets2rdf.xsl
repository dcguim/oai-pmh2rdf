<?xml version="1.0" encoding="utf-8"?>


<!DOCTYPE rdf:RDF [
 <!ENTITY  xsd "http://www.w3.org/2001/XMLSchema#"> 
 <!ENTITY bibo "http://purl.org/ontology/bibo/">
 <!ENTITY foaf "http://xmlns.com/foaf/0.1/">
 <!ENTITY  geo "http://www.w3.org/2003/01/geo/wgs84_pos#"> 
 <!ENTITY skos "http://www.w3.org/2004/02/skos/core#">
 <!ENTITY doac "http://ramonantonio.net/doac/0.1/">
 <!ENTITY bio  "http://purl.org/vocab/bio/0.1/">
]>

<xsl:stylesheet version="1.0" 
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:bio="http://purl.org/vocab/bio/0.1/" 
		xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
		xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
		xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
		xmlns:foaf="http://xmlns.com/foaf/0.1/" 
		xmlns:dc="http://purl.org/dc/elements/1.1/"
		xmlns:doac="http://ramonantonio.net/doac/0.1/" 
		xmlns:dcterms="http://purl.org/dc/terms/"
		xmlns:oai="http://www.openarchives.org/OAI/2.0/"
		xmlns:mets="http://www.loc.gov/METS/"
		xmlns:skos="http://www.w3.org/2004/02/skos/core#" 
		xmlns:fgvterms="http://www.fgv.br/terms/"
		xmlns:mods="http://www.loc.gov/mods/v3" 
		xmlns:event="http://purl.org/NET/c4dm/event.owl#" 
		xmlns:gn="http://www.geonames.org/ontology#" 
		xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#n" 
		xmlns:bibo="http://purl.org/ontology/bibo/" 
		xmlns:lattes="http://www.cnpq.br/2001/XSL/Lattes">


  <xsl:template match="oai:OAI-PMH">
    <rdf:RDF>
      <xsl:apply-templates select="oai:ListRecords" />
    </rdf:RDF>
  </xsl:template>

  <xsl:template match="oai:ListRecords">
    <xsl:apply-templates select="oai:record" />
  </xsl:template>

  <xsl:template match="oai:record">
    <xsl:apply-templates select="oai:metadata" />
  </xsl:template>

  <xsl:template match="oai:metadata">
    <xsl:apply-templates select="mets:mets" />
  </xsl:template>

  <xsl:template match="mets:mets">
    <rdf:Description rdf:about="{@OBJID}">
      <rdf:type rdf:resource="&bibo;Thesis"/>
      <bibo:degree rdf:resource="&bibo;degrees/ms" /> 
      <dc:title> <xsl:value-of select="mets:dmdSec/mets:mdWrap/mets:xmlData/mods:titleInfo"/> </dc:title>
      <xsl:apply-templates select="descendant::mods:name" />
    </rdf:Description>
  </xsl:template>

  <xsl:template match="mods:name">
    <bibo:rel value="{normalize-space(mods:role)}">
      <xsl:apply-templates select="mods:namePart"/>
    </bibo:rel>
  </xsl:template>

  <xsl:template match="mods:namePart">
     <rdf:Description>
      <xsl:attribute name="rdf:about">
	<xsl:value-of select="concat('#person-',generate-id(.))"/>
      </xsl:attribute>
      <rdf:type rdf:resource="&foaf;Person"/>
      <foaf:name> <xsl:value-of select="."/> </foaf:name>
    </rdf:Description>
  </xsl:template>

</xsl:stylesheet>