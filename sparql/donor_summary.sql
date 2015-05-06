SELECT
  (?donor_id AS ?Donor_ID)
  (?project_code AS ?Project_Code)
  (?donor_age_at_diagnosis AS ?Age_At_Diagnosis)
  (?donor_sex AS ?Gender)
  (?donor_vital_status AS ?Donor_Vital_Status)
WHERE {
  <http://icgc.link/Donor/$donor_id>
    icgc:donor_id ?donor_id ;
    icgc:project_code ?project_code ;
    icgc:donor_age_at_diagnosis ?donor_age_at_diagnosis ;
    icgc:donor_sex ?donor_sex ;
    icgc:donor_vital_status ?donor_vital_status .
}