// ------------------------------------------------------------
// Name: chapter6_archive_expired_content.js
// Description: Moves expired content to Archived space
// ------------------------------------------------------------
var activeFolder   = companyhome.childByNamePath("Intranet/Company Policies/Corporate Forms/In Use");
var archivedFolder = companyhome.childByNamePath("Intranet/Company Policies/Corporate Forms/Archived");

if(activeFolder != null)
{
   var i=0;
   var today = new Date();
   
   activeChildren  = activeFolder.children;
   activeTotal     = activeChildren.length;

   for(i=0; i<activeTotal;i++)
   {
      child = activeChildren[i];
      if(child.properties["cm:to"] <= today)
      { 
         child.move(archivedFolder);
      }
   }
}
