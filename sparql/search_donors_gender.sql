SELECT
  ?gender AS ?item
  COUNT(*) AS ?value
WHERE {
  SELECT DISTINCT
    ?donor
    COALESCE(?gender, "No Data") AS ?gender
  WHERE {
    ?donor a <http://icgc.link/Donor> .
    OPTIONAL { ?donor icgc:sex ?gender . }
    OPTIONAL { ?donor icgc:vital_status ?vital_status . }
    OPTIONAL {
      ?donor icgc:project ?project .
      OPTIONAL { ?project icgc:project_code ?project_code . }
      OPTIONAL { ?project icgc:primary_site ?primary_site . }
    }
    OPTIONAL {
      ?donor ^icgc:donor ?detection .
      OPTIONAL {
        ?detection icgc:mutation ?mutation . 
        OPTIONAL {
          ?mutation ^icgc:mutation ?effect .
          OPTIONAL {
            ?effect icgc:gene_affected ?gene .
            OPTIONAL { ?effect icgc:consequence_type ?consequence_type . }
          }
        }
      }
    }
    $facet
  }
}
GROUP BY ?gender
ORDER BY DESC(?value)