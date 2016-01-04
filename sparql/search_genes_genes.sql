SELECT DISTINCT
  (STR(?approved_symbol) AS ?Gene)
  (STR(?identifier) AS ?Ensemble_ID)
  (?count AS ?Donors)
WHERE {
  {
  SELECT DISTINCT
    ?gene
    (COUNT(*) AS ?count)
  WHERE {    
    SELECT DISTINCT
      ?gene
      ?donor
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
  GROUP BY ?gene
  }
  ?gene rdfs:seeAlso ?gene_bio2rdf .
  ?gene_bio2rdf a bio2rdf-ensembl:Resource .
  ?gene_bio2rdf bio2rdf_vocabulary:identifier ?identifier .
  ?hgnc_gene hgnc_vocabulary:x-ensembl ?gene_bio2rdf .
  ?hgnc_gene hgnc_vocabulary:approved-symbol ?approved_symbol .
}
ORDER BY DESC(?Donors)
LIMIT 20