# mutation_cancer_distribution.sql
SELECT
  (COALESCE(?project_code, "(No Data)") AS ?Project)
  (COALESCE(?tumour_type, "(No Data)") AS ?Tumour_Type)
  (COALESCE(?tumour_subtype, "(No Data)") AS ?Tumour_Subtype)
  (COALESCE(?count, "(No Data)") AS ?Donors_Affected)
WHERE {
  OPTIONAL { ?project icgc:project_code ?project_code . }
  OPTIONAL { ?project icgc:project_name ?project_name . }
  OPTIONAL { ?project icgc:tumour_type ?tumour_type . }
  OPTIONAL { ?project icgc:tumour_subtype ?tumour_subtype . }
  {
    SELECT
      ?project
      (COUNT(*) AS ?count)
    WHERE {
      ?detection
        icgc:mutation <http://icgc.link/Mutation/$mutation_id> ;
        icgc:donor ?donor .
      ?donor icgc:project ?project
    }
    GROUP BY ?project
  }
}
ORDER BY ?project_code