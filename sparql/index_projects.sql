# index_projets.sql
SELECT
  (?project_code AS ?item)
  (COUNT(*) AS ?value)
WHERE {
  SELECT DISTINCT
    ?donor
    (COALESCE(?project_code, "No Data") AS ?project_code)
  WHERE {
    ?donor a <http://icgc.link/Donor> .
    OPTIONAL {
      ?donor icgc:project ?project .
      OPTIONAL { ?project icgc:project_code ?project_code . }
    }
  }
}
GROUP BY ?project_code
ORDER BY DESC(?value)