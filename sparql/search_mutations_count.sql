SELECT
  (COUNT(*) AS ?item)
WHERE {
	SELECT DISTINCT
	  ?mutation
	WHERE {
	  $facet
	}
}