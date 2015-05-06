PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> 
PREFIX icgc: <http://icgc.link/vocab/>
PREFIX hgnc_vocabulary: <http://bio2rdf.org/hgnc_vocabulary:>
PREFIX bio2rdf_vocabulary: <http://bio2rdf.org/bio2rdf_vocabulary:>

SELECT
  (COUNT(?mutation) AS ?item)
WHERE {
	SELECT DISTINCT
	  ?mutation
	WHERE {
    ?mutation icgc:mutation_id ?mutation_id .
    # FACET
	  ?detection icgc:mutation ?mutation .
    ?detection icgc:donor ?donor .
    ?donor icgc:project ?project .
    #FILTER (?project NOT IN ($projects))
	}
}