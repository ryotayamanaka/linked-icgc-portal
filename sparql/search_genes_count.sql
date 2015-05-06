SELECT
  (COUNT(*) AS ?item)
WHERE {    
  SELECT DISTINCT
    ?gene
  WHERE {
    ?effect icgc:mutation ?mutation .
    ?effect icgc:gene_affected_bio2rdf ?gene .
    ?mutation icgc:mutation_id ?mutation_id .
    ?detection icgc:mutation ?mutation .
    ?detection icgc:donor ?donor .
    $facet
  }
}