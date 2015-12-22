SELECT
  (?donor_id AS ?Donor_ID)
  (?project_code AS ?Project_Code)
  (?age_at_diagnosis AS ?Age_At_Diagnosis)
  (?sex AS ?Gender)
  (?vital_status AS ?Donor_Vital_Status)
WHERE {
  BIND (<http://icgc.link/Donor/$donor_id> AS ?donor)
  ?donor icgc:donor_id ?donor_id .
  OPTIONAL { ?donor icgc:age_at_diagnosis ?age_at_diagnosis . }
  OPTIONAL { ?donor icgc:sex ?sex . }
  OPTIONAL { ?donor icgc:vital_status ?vital_status . }
  ?donor icgc:project ?project .
  ?project icgc:project_code ?project_code
}