# gene_summary.sql
SELECT DISTINCT
  (?approved_symbol AS ?Symbol)
  (?approved_name AS ?Name)
  (?synonym AS ?Synonym)
  (?hgnc_id AS ?HGNC_Gene)
  (?gene_id AS ?Ensembl_Gene)
  (?omim_id AS ?OMIM)
  (?uniprot_id AS ?UniProt)
WHERE {
  ?gene_hgnc hgnc_vocabulary:approved-symbol ?approved_symbol .
  OPTIONAL { ?gene_hgnc hgnc_vocabulary:approved-name ?approved_name . }
  OPTIONAL { ?gene_hgnc hgnc_vocabulary:synonym ?synonym . }
  OPTIONAL { ?gene_hgnc bio2rdf_vocabulary:identifier ?hgnc_id . }
  OPTIONAL { ?gene_hgnc hgnc_vocabulary:x-omim [ bio2rdf_vocabulary:identifier ?omim_id ] . }
  OPTIONAL { ?gene_hgnc hgnc_vocabulary:x-uniprot [ bio2rdf_vocabulary:identifier ?uniprot_id ] . }
  {
    SELECT DISTINCT
      ?identifier AS ?gene_id
      ?gene_hgnc
    WHERE {
      <http://icgc.link/Gene/$gene_id> rdfs:seeAlso ?gene_bio2rdf .
      ?gene_bio2rdf a bio2rdf-ensembl:Resource .
      ?gene_bio2rdf bio2rdf_vocabulary:identifier ?identifier .
      ?gene_hgnc hgnc_vocabulary:x-ensembl ?gene_bio2rdf .
      ?gene_hgnc hgnc_vocabulary:approved-symbol ?approved_symbol .
    }
  }
}
