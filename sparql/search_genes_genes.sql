SELECT
  (STR(?approved_symbol) AS ?Gene)
  (STR(?identifier) AS ?Ensemble_ID)
  (?count AS ?Donors)
WHERE {
  {
  SELECT
    ?gene
    (COUNT(*) AS ?count)
  WHERE {    
    SELECT DISTINCT
      ?gene
      ?donor
    WHERE {
      $facet
    }
  }
  GROUP BY ?gene
  }
  ?gene rdfs:seeAlso ?gene_bio2rdf .
  ?gene_bio2rdf a bio2rdf-ensembl:Resource .
  ?gene_bio2rdf bio2rdf_vocabulary:identifier ?identifier .
  ?hgnc_gene hgnc_vocabulary:x-ensembl ?gene_bio2rdf .
  ?hgnc_gene hgnc_vocabulary:approved-symbol ?approved_symbol .
}
ORDER BY DESC(?Donors)
LIMIT 20