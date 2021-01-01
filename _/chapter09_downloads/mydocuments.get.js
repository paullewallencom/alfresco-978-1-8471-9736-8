var conn = remote.connect("alfresco");
// search cmis search api path
var id = "/api/query";

// get the sites space
var workspace = "/api/path/workspace/SpacesStore/Company Home/Sites";
var sitesspace = conn.get(stringUtils.urlEncodeComponent(workspace));
var sitesspaceentry = atom.toEntry(sitesspace);

// get the children URL which is a cmis feed.
var sitesspacechildren = sitesspaceentry.getLinks("cmis-children").get(0).href;

// get all sites - children of sites space
var sites = conn.get(sitesspacechildren);
var sitesfeed = atom.toFeed(sites);

// gets the entries of the feed - which translate to a site space
var entries = sitesfeed.getEntries();
var size = entries.size();
var sitesspaceid = "";

var sitesdocuments = new Array();
// for each site
for (var i=0; i<size; i++) {
  var site = entries.get(i);
  
  // take the sites id (in alfresco its workspace)
  sitespaceid =  site.getExtension(atom.names.cmis_object).objectId.value;
  var sitename = site.title;
  
  // formulate the query based on sitesid and current user
  // TODO: bug in objecttypeid != 'D/cm_thumbnail' - modify selectString when fixed
  var selectString = "SELECT * FROM Document WHERE IN_TREE( ,\'" + sitespaceid + "\') AND " +
  "(CreatedBy=\'" + user.id + "\' OR LastModifiedBy=\'" + user.id + "\') AND ObjectTypeId = \'document\'";
  var cmisQuery = "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\" ?><query xmlns:cmis=\"http://www.cmis.org/2008/05\"><statement>" + selectString + "</statement><pageSize>" + 0 + "</pageSize></query>";
  
  // get the documents for the currently active site
  var conn = remote.connect("alfresco");
  var queryResult = conn.post(stringUtils.urlEncodeComponent(id), cmisQuery, "application/cmisquery+xml");
  // sitesdocuments[0] = "{name: " + sitename + ", documents: " + atom.toFeed(queryResult) + "}";
  sitesdocuments[i] = new Object();
  sitesdocuments[i].name=sitename;
  sitesdocuments[i].documents=atom.toFeed(queryResult);
}

//model.results = atom.toFeed(queryResult);
model.sitesdocuments=sitesdocuments;