SELECT
  (COUNT(*) AS ?item)
WHERE {
  {
	  SELECT DISTINCT
	    ?gene
	  WHERE {
	    $facet
	  }
  }
}