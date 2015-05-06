SELECT
  (SAMPLE(?mutation_id) AS ?ID)
  (CONCAT("chr", SAMPLE(?chromosome), ":g.", STR(SAMPLE(?chromosome_start)), ":g.", SAMPLE(?mutated_from_allele), ">", SAMPLE(?mutated_to_allele)) AS ?DNA_Change)
  (SAMPLE(?mutation_type) AS ?Type)
  (COUNT(?donor) AS ?Donors)
WHERE {
  ?mutation icgc:mutation_id ?mutation_id .
  ?mutation icgc:chromosome ?chromosome .
  ?mutation icgc:chromosome_start ?chromosome_start .
  ?mutation icgc:mutation_type ?mutation_type .
  ?mutation icgc:mutated_from_allele ?mutated_from_allele .
  ?mutation icgc:mutated_to_allele ?mutated_to_allele .
  ?detection icgc:mutation ?mutation .
  ?detection icgc:donor ?donor .
  $facet
}
GROUP BY ?mutation
ORDER BY DESC(?Donors)
LIMIT 20