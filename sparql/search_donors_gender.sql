SELECT
  ?item
  (COUNT(?item) AS ?value)
WHERE {
  ?donor icgc:donor_sex ?item .
  $facet
}
GROUP BY ?item
ORDER BY DESC(?value)