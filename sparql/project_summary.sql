# project_summary.sql
SELECT
  (?project_code AS ?Code)
  (?project_name AS ?Name)
  (?tumour_type AS ?Tumour_Type)
  (?tumour_subtype AS ?Tumour_Subtype)
  (?countries AS ?Countries)
  (?donors AS ?Total_Number_of_Donors)
WHERE {
  <http://icgc.link/Project/$project_code> icgc:project_code ?project_code .
  ?project  icgc:project_code ?project_code .
  OPTIONAL { ?project icgc:project_name ?project_name . }
  OPTIONAL { ?project icgc:tumour_type ?tumour_type . }
  OPTIONAL { ?project icgc:tumour_subtype ?tumour_subtype . }
  OPTIONAL { ?project icgc:countries ?countries . }
  {
    SELECT
      (COUNT(*) AS ?donors)
    WHERE {
      ?donor icgc:project ?project .
    }
  }
}