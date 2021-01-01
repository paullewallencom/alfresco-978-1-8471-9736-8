<#------------------------------------------------------------------->
<#-- Displays a table of all the documents from a "Press Releases" -->
<#-- folder under Company Home/Intranet/Press and Media space      -->
<#-- NOTE: Obviously this folder needs to exist and                -->
<#--       the docs in it should have the title and content        -->
<#-- By Munwar Shariff, Sep 16, 2006                               -->
<#------------------------------------------------------------------->

<table width=100%>
   <#assign l_space = companyhome.childByNamePath["Intranet/Press and Media/Press Releases"]>
   
   <#list l_space.children as doc>
            <#if doc.isDocument>
               <tr>
                   <td><a class="title" href="/alfresco/${doc.url}">${doc.properties.title}</a></td>
               </tr>
               <tr>
                   <td style="padding-left:8px">
                     <#if (doc.content?length > 500)>
                        <small>${doc.content[0..500]}...</small>
                     <#else>
                        <small>${doc.content}</small>
                     </#if>
                   </td>
               </tr>
               <tr><td> <HR> </td></tr>
            </#if>
   </#list>
</table>
