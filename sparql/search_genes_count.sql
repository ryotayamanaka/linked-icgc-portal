SELECT
  (COUNT(*) AS ?item)
WHERE {
  {
	  SELECT DISTINCT
	    ?gene
	  WHERE {
	    ?effect icgc:gene_affected ?gene .
	    ?effect icgc:mutation ?mutation .
	    ?mutation icgc:mutation_id ?mutation_id .
	    ?detection icgc:mutation ?mutation .
	    ?detection icgc:donor ?donor .
	    $facet
	  }
  }
  FILTER(?gene != "")
}