SELECT
  (COUNT(*) AS ?item)
WHERE {
  {
    SELECT DISTINCT
      ?gene
    WHERE {
      ?gene a <http://icgc.link/Gene>
      OPTIONAL {
        ?gene ^icgc:gene_affected ?effect .
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
      }
      $project_code
      $primary_site
      $gender
      $vital_status
    }
  }
}