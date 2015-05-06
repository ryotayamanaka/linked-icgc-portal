# mutation_summary.sql
SELECT
  (?mutation_id AS ?Mutation_ID)
  (CONCAT("chr", ?chromosome, ":g.", STR(?chromosome_start), ":g.", ?mutated_from_allele, ">", ?mutated_to_allele) AS ?DNA_Change)
  (?mutation_type AS ?Type)
  (?assembly_version AS ?Reference_genome_assembly)
  (?reference_genome_allele AS ?Allele_in_the_reference_assembly)
WHERE {
  <http://icgc.link/Mutation/$mutation_id>
    icgc:mutation_id ?mutation_id ;
    icgc:chromosome ?chromosome ;
    icgc:chromosome_start ?chromosome_start ;
    icgc:mutation_type ?mutation_type ;
    icgc:mutated_from_allele ?mutated_from_allele ;
    icgc:mutated_to_allele ?mutated_to_allele ;
    icgc:assembly_version ?assembly_version ;
    icgc:reference_genome_allele ?reference_genome_allele
}