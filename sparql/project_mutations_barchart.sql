SELECT
  (?mutation_id AS ?ID)
  (COUNT(*) AS ?Donors)
WHERE {
  ?mutation icgc:mutation_id ?mutation_id .
  {
    SELECT DISTINCT
      ?mutation
      ?donor
    WHERE {
      ?detection icgc:mutation ?mutation .
      ?detection icgc:donor ?donor .
      ?donor icgc:project <http://icgc.link/Project/$project_code>
    }
  }
}
GROUP BY ?mutation_id
ORDER BY DESC(?Donors)
LIMIT 10