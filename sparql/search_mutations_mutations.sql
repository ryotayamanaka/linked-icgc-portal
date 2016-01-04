SELECT
  ?ID
  ?DNA_Change
  ?Type
  (COUNT(*) AS ?Donors)
WHERE {
  SELECT DISTINCT
    (?mutation_id AS ?ID)
    (CONCAT("chr", ?chromosome, ":g.", STR(?chromosome_start), ":g.", ?mutated_from_allele, ">", ?mutated_to_allele) AS ?DNA_Change)
    (?mutation_type AS ?Type)
    ?donor
  WHERE {
    OPTIONAL { ?mutation icgc:mutation_id ?mutation_id . }
    OPTIONAL { ?mutation icgc:mutation_type ?mutation_type . }
    OPTIONAL {
      ?mutation icgc:chromosome ?chromosome .
      ?mutation icgc:chromosome_start ?chromosome_start .
      ?mutation icgc:mutated_from_allele ?mutated_from_allele .
      ?mutation icgc:mutated_to_allele ?mutated_to_allele .
    }
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
GROUP BY ?ID ?DNA_Change ?Type
ORDER BY DESC(?Donors)
LIMIT 20