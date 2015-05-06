SELECT DISTINCT
  (?id AS ?ID)
  (?project_code AS ?Project)
  (?primary_site AS ?Site)
  (?gender AS ?Gender)
  (?age AS ?Age)
  (?survival_days AS ?Survival_Days)
  ?Mutations
WHERE {
  {
    SELECT
      ?donor
      (COUNT(*) AS ?Mutations)
    WHERE {
      ?detection icgc:donor ?donor .
      ?detection icgc:mutation ?mutation .
    }
    GROUP BY ?donor
  }
  ?donor icgc:donor_id ?id .
  ?donor icgc:project ?project .
  ?project icgc:project_code ?project_code .
  ?project icgc:primary_site ?primary_site .
  ?donor icgc:donor_sex ?gender .
  ?donor icgc:donor_age_at_diagnosis ?age .
  ?donor icgc:donor_survival_time ?survival_days .
  $facet
}
ORDER BY DESC(?Mutations)
LIMIT 20