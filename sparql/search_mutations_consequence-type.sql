SELECT ?item (COUNT(?item) AS ?value)
WHERE {
  ?effect icgc:consequence_type ?item .
  $facet
}
GROUP BY ?item
ORDER BY DESC(?value)