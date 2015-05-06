SELECT
  (COUNT(*) AS ?item)
WHERE {    
  SELECT DISTINCT
    ?gene
  WHERE {
    ?effect icgc:mutation_id ?mutation .
    ?effect icgc:gene_affected_bio2rdf ?gene .
    ?mutation icgc:mutation_id ?mutation_id .
    ?detection icgc:mutation_id ?mutation .
    ?detection icgc:donor_id ?donor .
    # FACET
    ?donor icgc:project_code ?project .
    #FILTER (?project NOT IN ($projects))
  }
}