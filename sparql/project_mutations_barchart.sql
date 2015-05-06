SELECT
  (?mutation_id AS ?ID)
  (?count AS ?Donors)
WHERE {
  ?mutation icgc:mutation_id ?mutation_id .
  {
    SELECT
      ?mutation
      (COUNT(*) AS ?count)
    WHERE {
      ?detection icgc:mutation ?mutation .
      ?detection icgc:donor ?donor .
    }
    GROUP BY ?mutation
  }
}
ORDER BY DESC(?count)
LIMIT 10