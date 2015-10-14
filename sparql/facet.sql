
  # CLASSSS
  #?mutation a <http://icgc.link/Mutation> .
  #?detection a <http://icgc.link/Detection> .
  #?donor a <http://icgc.link/Donor> .
  #?project a <http://icgc.link/Project> .
  #?effect a <http://icgc.link/Effect> .
  # RELATIONSHIP
  ?effect icgc:mutation ?mutation .
  ?detection icgc:mutation ?mutation .
  ?detection icgc:donor ?donor .
  ?donor icgc:project ?project .
  # PROPERTY
  ?project icgc:project_code ?project_code .
  ?project icgc:primary_site ?primary_site .
  ?donor icgc:donor_sex ?gender .
  ?donor icgc:donor_vital_status ?vital_status .
  # FACET
  FILTER(?project_code $project_code)
  FILTER(?primary_site $primary_site)
  FILTER(?gender $gender)
  FILTER(?vital_status $vital_status)
