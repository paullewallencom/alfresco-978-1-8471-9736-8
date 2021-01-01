<#-- Shows Press Release content with Custom Properties, Associated Image and Files -->

<H3> ${document.properties.name} </H3>
<HR>

<#if document?exists>
   <table>
      <tr>
        <td valign="top">
	    <#if document.assocs["custom:PRImage"]?exists>
	        <#list document.assocs["custom:PRImage"] as t>
	            <img src="/alfresco${t.url}">
	        </#list>
	    </#if>
	      
	    <BR><BR>
	    
	    ${document.content}
        </td>
        <td valign="top">
        
            <B> PR CONTACT :</B> <BR>
            Contact: ${document.properties["custom:PRName"]} <BR>
            Email: ${document.properties["custom:PREmail"]} <BR>
            Phone: ${document.properties["custom:PRPhone"]} <BR>
              
	    <BR>

            <B> Associated Files: </B>
	    <#if document.assocs["custom:PRFiles"]?exists>
	       <#list document.assocs["custom:PRFiles"] as t>
	          <a href="/alfresco${t.url}"> ${t.name} </a> <BR>
	       </#list>
	    </#if>
        </td>
      </tr>
      
   </table>
<#else>
   No document found!
</#if>
