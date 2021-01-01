<#if document.mimetype = "text/xml">
   <#assign dom=document.xmlNodeModel>
   <h1>${dom.book.@title}</h1>
   <#list dom.book.chapter as c>
      <h2>${c.title}</2>
         <#list c.para as p>
              <p> ${p} </p>
         </#list>
   </#list>  
</#if>