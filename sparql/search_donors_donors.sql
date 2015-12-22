SELECT DISTINCT
  (?id AS ?ID)
  (COALESCE(?project_code, "-") AS ?Project)
  (COALESCE(?primary_site, "-") AS ?Site)
  (COALESCE(?gender, "-") AS ?Gender)
  (COALESCE(?age, "-") AS ?Age)
  (COALESCE(?survival_days, "-") AS ?Survival_Days)
  (?mutations AS ?Mutations)
  (?genes AS ?Genes)
WHERE {
  # MUTATIONS
  {
    SELECT
      ?donor
      COUNT(*) AS ?mutations
    WHERE {
      SELECT DISTINCT
        ?donor
        ?mutation
      WHERE {
        $facet
      }
    }
    GROUP BY ?donor
  }
  # GENES
  {
    SELECT
      ?donor
      COUNT(*) AS ?genes
    WHERE {
      SELECT DISTINCT
        ?donor
        ?gene
      WHERE {
        $facet
      }
    }
    GROUP BY ?donor
  }
  OPTIONAL { ?donor icgc:donor_id ?id . }
  OPTIONAL { ?donor icgc:age_at_diagnosis ?age . }
  OPTIONAL { ?donor icgc:survival_time ?survival_days . }
  $facet
}
ORDER BY DESC(?genes)
LIMIT 20