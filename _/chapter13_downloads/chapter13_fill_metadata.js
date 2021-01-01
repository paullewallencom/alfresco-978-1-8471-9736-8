if (document.hasPermission("Write"))
{
   if (document.mimetype == "image/tiff")
   {

      var l_currentSpace = document.parent;

      document.properties["custom:CustomerName"]         =  l_currentSpace.name;
      document.properties["custom:CustomerContactName"]  =  "Office Admin";
      document.properties["custom:CustomerContactPhone"] =  "111-222-3333";

      document.save();
   }
}
