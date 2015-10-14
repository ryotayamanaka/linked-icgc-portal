# mutation_consequences.sql
SELECT
  (?gene_id AS ?Gene)
  (?aa_mutation AS ?AA_Change)
  (?consequence_type AS ?Consequence)
  (?cds_mutation AS ?Coding_DNA_Change)
  (?transcript_affected AS ?Transcript)
WHERE {
  ?ssm_effect
    icgc:mutation <http://icgc.link/Mutation/$mutation_id> ;
    icgc:consequence_type ?consequence_type ;
    icgc:aa_mutation ?aa_mutation ;
    icgc:cds_mutation ?cds_mutation ;
    icgc:gene_affected ?gene_affected ;
    icgc:transcript_affected ?transcript_affected .
  ?gene_affected dct:identifier ?gene_id
}
ORDER BY ?consequence_type ?transcript_affected