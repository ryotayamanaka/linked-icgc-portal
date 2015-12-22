SELECT
  ?vital_status AS ?item
  COUNT(*) AS ?value
WHERE {
  SELECT DISTINCT
    ?donor
    COALESCE(?vital_status, "No Data") AS ?vital_status
  WHERE {
    $facet
  }
}
GROUP BY ?vital_status
ORDER BY DESC(?value)