SELECT
  (?gene AS ?Gene)
  (COUNT(*) AS ?Donors)
  {
    SELECT DISTINCT
      ?gene
      ?donor
    WHERE {
      ?effect icgc:mutation ?mutation .
      ?effect icgc:gene_affected ?gene .
      ?mutation icgc:mutation_id ?mutation_id .
      ?detection icgc:mutation ?mutation .
      ?detection icgc:donor ?donor .
    }
  }
GROUP BY ?gene
ORDER BY DESC(?Donors)
LIMIT 10