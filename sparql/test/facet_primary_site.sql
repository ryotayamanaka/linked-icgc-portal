PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX icgc: <http://icgc.link/vocab/>
PREFIX hgnc_vocabulary: <http://bio2rdf.org/hgnc_vocabulary:>
PREFIX bio2rdf_vocabulary: <http://bio2rdf.org/bio2rdf_vocabulary:>

SELECT DISTINCT
  ?item
WHERE {?project icgc:primary_site ?item}