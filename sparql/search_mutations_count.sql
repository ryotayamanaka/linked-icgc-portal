SELECT
  (COUNT(*) AS ?item)
WHERE {
	SELECT DISTINCT
	  ?mutation
	WHERE {
	  ?mutation icgc:mutation_id ?mutation_id .
	  $facet
	}
}