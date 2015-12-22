SELECT
  ?vital_status AS ?item
  COUNT(*) AS ?value
WHERE {
  SELECT DISTINCT
    ?donor
    COALESCE(?vital_status, "No Data") AS ?vital_status
  WHERE {
    ?donor a <http://icgc.link/Donor> .
    OPTIONAL { ?donor icgc:vital_status ?vital_status . }
    $facet
  }
}
GROUP BY ?vital_status
ORDER BY DESC(?value)