# index_projets.sql
SELECT
  ?item
  (COUNT(?item) AS ?value)
WHERE {
  ?project icgc:project_code ?item .
  ?donor icgc:project ?project .
}
GROUP BY ?item
ORDER BY DESC(?value)