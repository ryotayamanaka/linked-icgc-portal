SELECT
  ?mutation_type AS ?item
  (COUNT(?item) AS ?value)
WHERE {
  SELECT DISTINCT
    ?mutation
    COALESCE(?mutation_type, "No Data") AS ?mutation_type
  WHERE {
    # TRAVERSAL
    ?mutation a <http://icgc.link/Mutation> .
    OPTIONAL { ?mutation icgc:mutation_type ?mutation_type . }
    OPTIONAL {
      ?mutation ^icgc:mutation ?detection .
      OPTIONAL {
        ?detection icgc:donor ?donor .
        OPTIONAL { ?donor icgc:sex ?gender . }
        OPTIONAL { ?donor icgc:vital_status ?vital_status . }
        OPTIONAL {
          ?donor icgc:project ?project .
          OPTIONAL { ?project icgc:project_code ?project_code . }
          OPTIONAL { ?project icgc:primary_site ?primary_site . }
        }
      }
    }
    # FILTERING
    $project_code
    $primary_site
    $gender
    $vital_status
  }
}
GROUP BY ?mutation_type
ORDER BY DESC(?value)