# search_donors_project.sql
SELECT
  ?item
  (COUNT(*) AS ?value)
WHERE {
	SELECT DISTINCT
	  ?project_code
	  ?donor
	WHERE {
	  ?project ^icgc:project ?donor .
	  OPTIONAL { ?project icgc:project_code ?item . }
	  OPTIONAL { ?project icgc:primary_site ?primary_site . }
	  OPTIONAL {
	    ?donor ^icgc:donor ?detection .
	    OPTIONAL { ?donor icgc:sex ?gender . }
      OPTIONAL { ?donor icgc:vital_status ?vital_status . }
	    ?detection icgc:mutation ?mutation . 
      OPTIONAL {
	      ?mutation ^icgc:mutation ?effect .
	      OPTIONAL {
	        ?effect icgc:gene_affected ?gene .
	        OPTIONAL { ?effect icgc:consequence_type ?consequence_type . }
	      }
	    }
	  }
    $facet
  }
}
GROUP BY ?item
ORDER BY DESC(?value)