// THIS SCRIPT USES JQUERY AND D3SPARQL (BUT NO D3)
// EACH HTML FILES USE JQUERY AND THE FOLLOWING FUNCTIONS (BUT NO D3SPARQL)

//var endpoint = 'http://icgc.link:9001/sparql';
var endpoint = 'http://icgc.link:9001/sparql';

var params = {};

// index.html
function index_projects(callback) {
  var config = {
    "label": "item",
    "size": "value",
    "width":  250,
    "height": 250,
    "margin":  30,
    "hole":    0,
    "position": "#index_projects",
  };
  // PROJECT
  d3sparql.queryfile(endpoint, "./sparql/index_projects.sql", undefined, function(json) {
    config["title"] = "Project";
    d3sparql.piechart(json, config);
    callback();
  });
}
function index_status(callback) {
  var config = {
    "label": "item",
    "size": "value",
    "width":  250,
    "height": 250,
    "margin":  30,
    "hole":    0,
    "position": "#status",
  };
  // PROJECT
  d3sparql.queryfile(endpoint, "./sparql/index_status.sql", undefined, function(json) {
    config["title"] = "Project";
    d3sparql.piechart(json, config);
    callback();
  });
}

//PAGE: search.html
function search_count(callback) {
  var config = {};
  var projects = [];
  // DONORS
  d3sparql.queryfile(endpoint, "./sparql/search_donors_count.sql", params, function(json) {
    config["position"] = "#donors_count";
    d3sparql.text(json, config);
    // GENES
    d3sparql.queryfile(endpoint, "./sparql/search_genes_count.sql", params, function(json) {
      config["position"] = "#genes_count";
      d3sparql.text(json, config);
      // MUTATIONS
      d3sparql.queryfile(endpoint, "./sparql/search_mutations_count.sql", params, function(json) {
        config["position"] = "#mutations_count";
        d3sparql.text(json, config);
        callback();
      });
    });
  });
}
//PAGE: search.html (donors)
function donors_piecharts(callback) {
  var config = {
    "label": "item",
    "size": "value",
    "width":  150,
    "height": 150,
    "margin":  10,
    "hole":    0,
  };
  // PROJECT
  d3sparql.queryfile(endpoint, "./sparql/search_donors_project.sql", params, function(json) {
    config["position"] = "#project";
    d3sparql.piechart(json, config);
    // GENDER
    d3sparql.queryfile(endpoint, "./sparql/search_donors_gender.sql", params, function(json) {
      config["position"] = "#gender";
      d3sparql.piechart(json, config);
      // VITAL STATUS
      d3sparql.queryfile(endpoint, "./sparql/search_donors_vital-status.sql", params, function(json) {
        config["position"] = "#vital_status";
        d3sparql.piechart(json, config);
        // AGE
        d3sparql.queryfile(endpoint, "./sparql/search_donors_age.sql", params, function(json) {
          config["position"] = "#age";
          d3sparql.piechart(json, config);
          // CALLBACK
          callback();
        });
      });
    });
  });
}
function donors_htmltable(callback) {
  d3sparql.queryfile(endpoint, "./sparql/search_donors_donors.sql", params, function(json) {
    var config = {};
    config["position"] = "#search_donors";
    d3sparql.htmltable(json, config);
    // ADD LINKS
    $("#search_donors table tbody tr td:nth-child(1)").each(function(){
      $(this).html("<a href=./donor.html?donor_id=" + $(this).text() + ">" + $(this).text() + "</a>");
    });
    $("#search_donors table tbody tr td:nth-child(2)").each(function(){
      $(this).html("<a href=./project.html?project_code=" + $(this).text() + ">" + $(this).text() + "</a>");
    });
    $("#search_donors table tbody tr td:nth-child(7)").each(function(){
      $(this).html(separate($(this).text()));
    });
    callback();
  });
}

// PAGE: search.html (genes)
function genes_htmltable(callback) {
  d3sparql.queryfile(endpoint, "./sparql/search_genes_genes.sql", params, function(json) {
    var config = {};
    config["position"] = "#search_genes";
    d3sparql.htmltable(json, config);
    // ADD LINKS
    $("#search_genes table tbody tr td:nth-child(2)").each(function(){
      $(this).html("<a href=./gene.html?gene_id=" + $(this).text() + ">" + $(this).text() + "</a>");
    });
    callback();
  });
}

// PAGE: search.html (mutations)
function mutations_piecharts(callback) {
  var config = {
    "label": "item",
    "size": "value",
    "width":  150,
    "height": 150,
    "margin":  10,
    "hole":    0,
  };
  d3sparql.queryfile(endpoint, "./sparql/search_mutations_consequence-type.sql", params, function(json) {
    config["position"] = "#consequence_type";
    d3sparql.piechart(json, config);
    d3sparql.queryfile(endpoint, "./sparql/search_mutations_platform.sql", params, function(json) {
      config["position"] = "#platform";
      d3sparql.piechart(json, config);
      callback();
    });
  });
}
function mutations_htmltable(callback) {
  d3sparql.queryfile(endpoint, "./sparql/search_mutations_mutations.sql", params, function(json) {
    var config = {};
    config["position"] = "#search_mutations";
    d3sparql.htmltable(json, config);
    // ADD LINKS
    $("#search_mutations table tbody tr td:nth-child(1)").each(function(){
      $(this).html("<a href=./mutation.html?mutation_id=" + $(this).text() + ">" + $(this).text() + "</a>");
    });
    callback();
  });
}

// PAGE: project.html
function project_summary_htmlhash(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/project_summary.sql", params, function(json) {
    var config = {"position":"#summary"};
    d3sparql.htmlhash(json, config);
    callback();
  });
}
function project_mutated_genes_barchart(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/project_mutated_genes_barchart.sql", params, function(json) {
    var config = {
      "label_x": " ",
      "label_y": " ",
      "var_x": "",
      "var_y": "",
      "width":  500,  // canvas width
      "height": 200,  // canvas height
      "margin":  40,  // canvas margin
      "position":"#mutated_genes_barchart",
    }
    d3sparql.barchart(json, config);
    callback();
  });
}
function project_mutated_genes_htmltable(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/project_mutated_genes_htmltable.sql", params, function(json) {
    var config = {"position":"#mutated_genes"};
    d3sparql.htmltable(json, config);
    callback();
  });
}
function project_mutations_barchart(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/project_mutations_barchart.sql", params, function(json) {
    var config = {
      "label_x": " ",
      "label_y": " ",
      "var_x": "",
      "var_y": "",
      "width":  500,  // canvas width
      "height": 200,  // canvas height
      "margin":  40,  // canvas margin
      "position":"#mutations_barchart",
    }
    d3sparql.barchart(json, config);
    callback();
  });
}
function project_mutations_htmltable(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/project_mutations_htmltable.sql", params, function(json) {
    var config = {"position":"#mutations_htmltable"};
    d3sparql.htmltable(json, config);
    callback();
  });
}

// PAGE: donor.html
function donor_summary_htmlhash(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/donor_summary.sql", params, function(json) {
    var config = {};
    config["position"] = "#summary";
    d3sparql.htmlhash(json, config);
    callback();
  });
}

// PAGE: gene.html
function gene_summary_htmlhash(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/gene_summary.sql", params, function(json) {
    var config = {};
    config["position"] = "#summary";
    d3sparql.htmlhash(json, config);
    callback();
  });
}

// PAGE: mutation.html
function mutation_summary_htmlhash(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/mutation_summary.sql", params, function(json) {
    var config = {};
    config["position"] = "#summary";
    d3sparql.htmlhash(json, config);
    callback();
  });
}
function mutation_consequences_htmltable(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/mutation_consequences.sql", params, function(json) {
    var config = {};
    config["position"] = "#consequences";
    d3sparql.htmltable(json, config);
    // ADD LINKS
    $("div#consequences table tbody tr td:nth-child(1)").each(function(){
      $(this).html("<a href=./gene.html?gene_id=" + $(this).text() + ">" + $(this).text() + "</a>");
    });
    callback();
  });
}
function mutation_cancer_distribution_htmltable(params, callback) {
  d3sparql.queryfile(endpoint, "./sparql/mutation_cancer_distribution.sql", params, function(json) {
    var config = {};
    config["position"] = "#cancer_distribution";
    d3sparql.htmltable(json, config);
    callback();
  });
}

// FACET
function checkbox_param(param, callback) {
  var position = "#facet_" + param;
  d3sparql.queryfile(endpoint, "./sparql/facet_" + param + ".sql", null, function(json) {
    var config = {};
    config["position"] = position;
    d3sparql.checkbox(json, config);
    facet_params(position, param);
    // SET EVENT
    $(position + " input").each(function(){
      $(this).change(function(){
        facet_params(position, param);
        refresh_panel();
      });
    });
    callback();
  });
}

// COMMON FUNCTIONS
function get_params() {
  var url = location.href;
  urlparts = url.split("?");
  keyvalues = urlparts[1].split("&");
  var params = {};
  for ( i = 0; i < keyvalues.length; i++ ) {
      keyvalue = keyvalues[i].split("=");
      params[keyvalue[0]] = keyvalue[1];
  }
  return params;
}
d3sparql.queryfile = function(endpoint, sparqlfile, params, callback) {
  $.get("./sparql/prefix.sql", function(prefix) {
    $.get("./sparql/facet.sql", function(facet) {
      $.get(sparqlfile, function(sparql) {
        if (sparql.search("$facet")) {
          sparql = sparql.split("$facet").join(facet);
        }
        for (param in params) {
          sparql = sparql.split("$" + param).join(params[param]);
        }
        sparql = prefix + sparql;
        d3sparql.query(endpoint, sparql, callback);
      });
    });
  });
}
get_header = function() {
  $.get("./header.html", function(data) {
    $("#header").html(data);
  });
}
d3sparql.text = function(json, config) {
  var head = json.head.vars
  var data = json.results.bindings
  var opts = {
    "position":  config.position  || "body",
  }
  data.forEach(function(row){
    $(opts.position).html(separate(row.item.value));
  });
}
d3sparql.checkbox = function(json, config) {
  var head = json.head.vars
  var data = json.results.bindings
  var opts = {
    "position":  config.position  || "body",
  }
  data.forEach(function(row){
    var value = row.item.value;
    var label = row.item.value.capitalize();
    if (label == "") {
      label = "No Data";
    }
    $(opts.position).append($('<input type="checkbox" value="' + value + '"/>' + label + '<BR>'));
  });
}
function facet_params(position, param) {
  var str = "IN (";
  var cnt = 0;
  $(position + " input").each(function(){
    if($(this).prop('checked')) {
      if (cnt != 0) {
        str = str + ",";
      }
      str = str + "\"" + this.value + "\"";
      cnt = cnt + 1;
    }
  });
  str = str + ")";
  if (cnt == 0 || cnt == $(position + " input").length) {
    params[param] = "= ?" + param;
  } else {
    params[param] = str;
  }
}
function change_load_status(selector, status){
  if (status == "loading") {
    $(selector).html("loading..").css("color","red");
  } else if (status == "loaded") {
    $(selector).html("loaded&nbsp;&nbsp;&nbsp;").css("color","steelblue");
  }
}
function is_loaded(selector){
  if($(selector).html() != "loaded") {
    return true;
  } else {
    return false;
  }
}
String.prototype.capitalize = function(){
  return this.charAt(0).toUpperCase() + this.slice(1);
}
function separate(num){
  return String(num).replace( /(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
}