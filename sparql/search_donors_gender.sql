SELECT
  ?gender AS ?item
  COUNT(*) AS ?value
WHERE {
  SELECT DISTINCT
    ?donor
    COALESCE(?gender, "No Data") AS ?gender
  WHERE {
    ?donor a <http://icgc.link/Donor> .
    OPTIONAL { ?donor icgc:sex ?gender . }
    $facet
  }
}
GROUP BY ?gender
ORDER BY DESC(?value)