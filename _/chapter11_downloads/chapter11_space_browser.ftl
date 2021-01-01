<html>
<head>
  <title>View ${space.name} space</title>
</head>

<body>

<img src="/alfresco${space.icon32}" alt="Space">
<ul>
<li>Name: <strong>${space.name}</strong></li>
<li>Type: ${space.type}</li>
<li>Path: ${space.displayPath}</li>
<li>Parent: <a href="/alfresco/template/workspace/SpacesStore/${space.parent.id}[TEMPLATE]" title="Up to ${space.parent.name}">${space.parent.name}</a></p></li>
</ul>

<h1>Spaces</h1>

<ul>
<#list space.children as child>
   <#if child.isContainer>
     <li><img src="/alfresco${child.icon16}" alt="Space"> <a href="/alfresco/template/workspace/SpacesStore/${child.id}[TEMPLATE]" title="Browse to ${child.properties.name}">${child.properties.name}</a></li>
  </#if>
</#list>
</ul>

<h1>Documents</h1>
<ul>
<#list space.children as child>
   <#if child.isDocument>
    <li>
      <a href="/alfresco${child.url}" title="Download this file">${child.properties.name}</a> 
    </li>
  </#if>
</#list>
</ul>

</body>
</html>
