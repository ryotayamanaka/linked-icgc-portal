SELECT ?item (COUNT(?item) AS ?value)
WHERE {
  ?donor icgc:donor_vital_status ?item .
  $facet
}
GROUP BY ?item
ORDER BY DESC(?value)