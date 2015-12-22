SELECT
  ?age_str AS ?item
  (COUNT(*) AS ?value)
WHERE {
  SELECT DISTINCT
    ?donor
    ?age_str
  WHERE {
    ?donor a <http://icgc.link/Donor> .
    OPTIONAL {
      ?donor icgc:age_at_diagnosis ?age
      BIND(FLOOR(xsd:integer(?age)/10) AS ?floor)
    }
    BIND(IF(BOUND(?floor), CONCAT(STR(?floor*10), "-", STR(?floor*10+9)), "No Data") AS ?age_str)
    $facet
  }
}
GROUP BY ?age_str
ORDER BY ?age_str