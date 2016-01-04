SELECT
  (COUNT(*) AS ?item)
WHERE {
  SELECT DISTINCT
    ?mutation
  WHERE {
    # TRAVERSAL
    ?mutation a <http://icgc.link/Mutation> .
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