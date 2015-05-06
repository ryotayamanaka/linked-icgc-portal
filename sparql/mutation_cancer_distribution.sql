# mutation_cancer_distribution.sql
SELECT
  (?project_code AS ?Project)
  (?tumour_type AS ?Tumour_Type)
  (?tumour_subtype AS ?Tumour_Subtype)
  (?count AS ?Donors_Affected)
WHERE {
  ?project icgc:project_code ?project_code .
  ?project icgc:project_name ?project_name .
  ?project icgc:tumour_type ?tumour_type .
  ?project icgc:tumour_subtype ?tumour_subtype .
  {
    SELECT
      ?project
      (COUNT(*) AS ?count)
    WHERE {
      ?detection
        icgc:mutation <http://icgc.link/Mutation/$mutation_id> ;
        icgc:project ?project .
    }
    GROUP BY ?project
  }
}
ORDER BY ?project_code