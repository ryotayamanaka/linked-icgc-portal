SELECT
  ?item
  (COUNT(?item) AS ?value)
WHERE {
  ?detection icgc:platform ?item .
  $facet
}
GROUP BY ?item
ORDER BY DESC(?value)