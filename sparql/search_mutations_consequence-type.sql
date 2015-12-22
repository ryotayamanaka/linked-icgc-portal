SELECT
  ?consequence_type AS ?item
  (COUNT(?item) AS ?value)
WHERE {
  SELECT DISTINCT
    ?effect
    COALESCE(?consequence_type, "No Data") AS ?consequence_type
  WHERE {
    # TRAVERSAL
    ?effect a <http://icgc.link/Effect> .
    OPTIONAL { ?effect icgc:consequence_type ?consequence_type . }
    OPTIONAL {
      ?effect icgc:mutation ?mutation .
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
    }
    # FILTERING
    $facet
  }
}
GROUP BY ?consequence_type
ORDER BY DESC(?value)