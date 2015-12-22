# search_donors_project.sql
SELECT
  ?project_code AS ?item
  (COUNT(*) AS ?value)
WHERE {
	SELECT DISTINCT
    ?donor
    COALESCE(?project_code, "No Data") AS ?project_code
	WHERE {
	  ?donor a <http://icgc.link/Donor> .
    $facet
  }
}
GROUP BY ?project_code
ORDER BY DESC(?value)