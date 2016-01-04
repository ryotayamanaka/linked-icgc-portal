  # TRAVERSAL
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
        OPTIONAL { ?effect icgc:consequence_type ?consequence_type . }
        OPTIONAL {
          ?effect icgc:gene_affected ?gene .
        }
      }
    }
  }
  # FILTERING
  $project_code
  $primary_site
  $gender
  $vital_status