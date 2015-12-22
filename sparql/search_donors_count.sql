SELECT
  (COUNT(*) AS ?item)
WHERE {
  SELECT DISTINCT
    ?id
  WHERE {
    ?donor icgc:donor_id ?id .
    
    # CLASSSS
	  #?mutation a <http://icgc.link/Mutation> .
	  #?detection a <http://icgc.link/Detection> .
	  ?donor a <http://icgc.link/Donor> .
	  #?project a <http://icgc.link/Project> .
	  #?effect a <http://icgc.link/Effect> .
	  # RELATIONSHIP
	  #?effect icgc:mutation ?mutation .
	  #?detection icgc:mutation ?mutation .
	  #?detection icgc:donor ?donor .
	  ?donor icgc:project ?project .
    
    $facet
  }
}