# search_donors_project.sql
SELECT
  ?item
  (COUNT(?item) AS ?value)
WHERE {
  ?project icgc:project_code ?item .
  $facet
}
GROUP BY ?item
ORDER BY DESC(?value)