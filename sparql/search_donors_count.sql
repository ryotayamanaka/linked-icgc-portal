SELECT
  (COUNT(*) AS ?item)
WHERE {
  SELECT DISTINCT
    ?donor
  WHERE {
    $facet
  }
}