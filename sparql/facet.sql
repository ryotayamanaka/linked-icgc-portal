  # FACET
  ?effect icgc:mutation ?mutation .
  ?detection icgc:mutation ?mutation .
  ?detection icgc:donor ?donor .
  ?donor icgc:project ?project .
  ?project icgc:project_code ?project_code .
  ?project icgc:primary_site ?primary_site .
  ?donor icgc:donor_sex ?gender .
  ?donor icgc:donor_vital_status ?vital_status .
  FILTER (?project_code NOT IN ($project_code))
  FILTER (?primary_site NOT IN ($primary_site))
  FILTER (?gender NOT IN ($gender))
  FILTER (?vital_status NOT IN ($vital_status))
  