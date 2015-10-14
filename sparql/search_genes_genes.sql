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
      ?effect icgc:mutation ?mutation .
      ?effect icgc:gene_affected ?icgc_gene .
      ?icgc_gene owl:sameAs ?gene .
      ?gene a bio2rdf-ensembl:Resource .
      ?mutation icgc:mutation_id ?mutation_id .
      ?detection icgc:mutation ?mutation .
      ?detection icgc:donor ?donor .
      $facet
    }
  }
  GROUP BY ?gene
  }
  ?gene bio2rdf_vocabulary:identifier ?identifier .
  ?hgnc_gene hgnc_vocabulary:x-ensembl ?gene .
  ?hgnc_gene hgnc_vocabulary:approved-symbol ?approved_symbol .
}
ORDER BY DESC(?Donors)
LIMIT 20