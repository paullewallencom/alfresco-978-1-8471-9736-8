<#------------------------------------------------------------------->
<#-- Displays Home Page for each department using                  -->
<#-- (1) Home Page Image file home_image.png and                   -->
<#-- (2) Home Page HTML file home_page.html                        -->
<#-- By Munwar Shariff, Nov 16, 2006                               -->
<#------------------------------------------------------------------->

<H4> Welcome to ${space.properties.title} </H4>

<#list space.children as child>
    <#if child.properties.name = 'home_image.png'>
            <img src="/alfresco${child.url}">
    </#if>
</#list>

<#list space.children as child>
   <#if child.properties.name = 'home_page.html'>
            ${child.content}
    </#if>
</#list>
