SELECT
  (COUNT(*) AS ?item)
WHERE {
  SELECT DISTINCT
    ?id
  WHERE {
    ?donor icgc:donor_id ?id .
    $facet
  }
}