SELECT
  (?project_code AS ?Code)
  (?project_name AS ?Name)
  (?tumour_type AS ?Tumour_Type)
  (?tumour_subtype AS ?Tumour_Subtype)
  (?country AS ?Country)
  (?donors AS ?Total_Number_of_Donors)
WHERE {
  <http://icgc.link/Project/$project_code>
    icgc:project_code ?project_code ;
    icgc:project_name ?project_name ;
    icgc:tumour_type ?tumour_type ;
    icgc:tumour_subtype ?tumour_subtype ;
    icgc:country ?country .
  {
    SELECT
      (COUNT(*) AS ?donors)
    WHERE {
      ?donor icgc:project <http://icgc.link/Project/$project_code>
    }
  }
}