var l_folder = "app:company_home/cm:CustomerDocuments";

var l_search_docs = new Object();

if (args.startpage == undefined)
{
   l_search_docs.startPage = 1;
}
else
{
   l_search_docs.startPage = parseInt(args.startpage);
}

if (args.count == undefined)
{
   l_search_docs.itemsPerPage = 5;
}
else
{
   l_search_docs.itemsPerPage = parseInt(args.count);
}

l_search_docs.startIndex = (l_search_docs.startPage-1) * l_search_docs.itemsPerPage;
l_search_docs.searchTerms ="";


if (args.keyword == null || args.keyword.length == 0) {
	status.code = 400;
	status.message = "\"keyword\" argument is null or undefined";
	status.redirect = true;	
}
else if (args.clientname == null || args.clientname.length == 0) {
	status.code = 400;
	status.message = "\"clientname\" argument is null or undefined";
	status.redirect = true;	
}
else
{
	l_search_docs.searchTerms = args.keyword;
	l_search_docs.clientName = args.clientname;
	query = buildSearchQuery();
	var results = search.luceneSearch(query);
	l_search_docs.results = results;
	l_search_docs.totalResults = results.length;
	l_search_docs.totalPages = Math.ceil(results.length / l_search_docs.itemsPerPage);

	model.m_search_docs = l_search_docs;
}

function addQueryCriterion(param, value, isContained) {
	
	var valueStub;		

	if (isContained) {
		valueStub = "*" + value + "*";			
	} 
	else {
		valueStub = value;
	}
	
	criterion = " AND @CUST\\:" + param + ":" + valueStub;
	return criterion;	
}

function buildSearchQuery() {
    searchQuery = "PATH:\"//" + l_folder + "//*\"";

   	

    if (args.keyword != null) {
		searchQuery += addQueryCriterion("Keywords", args.keyword, true);
	}

    if (args.clientname != null) {
		searchQuery += addQueryCriterion("ClientName", args.clientname, true);
	}


	return searchQuery;
}