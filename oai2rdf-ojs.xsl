<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE rdf:RDF [
 <!ENTITY  xsd "http://www.w3.org/2001/XMLSchema#"> 
 <!ENTITY bibo "http://purl.org/ontology/bibo/">
 <!ENTITY foaf "http://xmlns.com/foaf/0.1/">
 <!ENTITY  geo "http://www.w3.org/2003/01/geo/wgs84_pos#"> 
 <!ENTITY skos "http://www.w3.org/2004/02/skos/core#">
 <!ENTITY doac "http://ramonantonio.net/doac/0.1/">
 <!ENTITY bio  "http://purl.org/vocab/bio/0.1/">
 <!ENTITY vivo "http://vivoweb.org/ontology/core#">
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
		xmlns:lattes="http://www.cnpq.br/2001/XSL/Lattes"
		xmlns:vivo="http://vivoweb.org/ontology/core#"
		xmlns:vcard="http://www.w3.org/2006/vcard/ns#"
		xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/">

  <xsl:template match="oai:OAI-PMH">
    <rdf:RDF>
      <xsl:attribute name="xml:base">
	<xsl:value-of select="normalize-space(oai:request)"/>
      </xsl:attribute>
      <xsl:apply-templates select="oai:ListRecords"/>
    </rdf:RDF>
  </xsl:template>

  <xsl:template match="oai:ListRecords">
    <xsl:apply-templates select="oai:record" />
  </xsl:template>

  <xsl:template match="oai:record">
    <rdf:Description rdf:about="{normalize-space(oai:header/oai:identifier)}">
      <xsl:attribute name="xml:base">
	<xsl:value-of select="normalize-space(oai:header/oai:identifier)"/>
      </xsl:attribute>
      <xsl:apply-templates select="oai:metadata"/>
    </rdf:Description>
  </xsl:template>


  <xsl:template match="oai_dc:dc">
    <rdf:type rdf:resource="vivo;AcademicArticle"/>
    <rdfs:label>
      <xsl:value-of select="normalize-space(dc:title)"/>
    </rdfs:label>
    <dc:language>
      <xsl:value-of select="dc:language"/>
    </dc:language>
    <dc:format>
      <xsl:value-of select="dc:format"/>
    </dc:format>
    <bibo:abstract>
      <xsl:value-of select="dc:description"/>
    </bibo:abstract>
    <vivo:hasPublicationVenue>
      <rdf:Description>
      <xsl:attribute name="rdf:nodeID">
	  <xsl:value-of select="generate-id(.)"/>
	</xsl:attribute>
	<rdf:type rdf:resource="bibo;Journal"/>
	<dc:language>
	  <xsl:value-of select="dc:source/@xml:lang"/>
	</dc:language>
	<rdfs:label>
	   <xsl:value-of select="dc:source"/>
	</rdfs:label>
      </rdf:Description>
    </vivo:hasPublicationVenue>
    <vivo:relatedBy>
      <rdf:Description>
	<xsl:attribute name="rdf:nodeID">
	  <xsl:value-of select="generate-id(.)"/>
	</xsl:attribute>
	<rdf:type rdf:resource="vivo;Authorship"/>
	<vivo:relates>
	  <rdf:Description>
	    <xsl:attribute name="rdf:nodeID">
	      <xsl:value-of select="generate-id(.)"/>
	    </xsl:attribute>
	    <rdf:type rdf:resource="vcard:Individual"/>
	    <vcard:hasName>
	      <xsl:value-of select="dc:creator"/>
	    </vcard:hasName>
	  </rdf:Description> 
	</vivo:relates>
      </rdf:Description>
    </vivo:relatedBy>
  </xsl:template>
  
</xsl:stylesheet>
