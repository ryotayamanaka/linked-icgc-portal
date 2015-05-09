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
}
GROUP BY ?ID ?DNA_Change ?Type
ORDER BY DESC(?Donors)
LIMIT 20