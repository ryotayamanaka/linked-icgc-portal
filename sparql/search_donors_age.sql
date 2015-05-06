SELECT
  (CONCAT(STR(?floor*10), "-", STR(?floor*10+9)) AS ?item)
  (COUNT(*) AS ?value)
WHERE {
  ?donor icgc:donor_age_at_diagnosis ?age
  BIND(FLOOR(xsd:integer(?age)/10) AS ?floor)
  $facet
}
GROUP BY ?floor
ORDER BY ?floor