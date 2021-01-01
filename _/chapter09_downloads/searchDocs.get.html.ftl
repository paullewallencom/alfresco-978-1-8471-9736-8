<html>
<head> 
      <title>Alfresco Search</title>  
</head>
<body>
<b>Search Results:&nbsp;</b>
	    
<#if m_search_docs.results?exists>
	<#assign count=0>
	<#assign index=0>
	Showing page <b>${m_search_docs.startPage}</b> of <b>${m_search_docs.totalPages}</b> from <b>${m_search_docs.totalResults}</b> results for Keyword : <b>${m_search_docs.searchTerms}</b> and Client: <b>${m_search_docs.clientName}</b>
	<br> <br>
	<table>
	 <tr>
		 <th> </th>  <th> Name of Document </th>
		 <th> </th>  <th> Author </th>
		 <th> </th>  <th> Client Name </th>
		 <th> </th>  <th> Expiration Date</th>
	 </tr>
	<#list m_search_docs.results as l_result_document>
		<#if (index>=m_search_docs.startIndex) && (index<m_search_docs.startIndex+m_search_docs.itemsPerPage)>
			<#assign count=count+1>
			<#assign curl=url.serviceContext>
			<tr>
				<td>
					<img src="${url.context}${l_result_document.icon16}"/>
				</td>
				<td align="center"> 
					<a class="title" href="/alfresco/${l_result_document.url}">${l_result_document.properties.name}</a>
				</td> 		
				<td> </td>			
				<td> ${l_result_document.properties.creator} </td>
				<td> </td>						
				<td align="center"> ${l_result_document.properties["CUST:ClientName"]} </td>
				<td> </td>
				<#if l_result_document.properties["CUST:ExpirationDate"]?exists>
					<td align="center"> ${l_result_document.properties["CUST:ExpirationDate"]?date} </td>				
				<#else>
					<td> </td>
				</#if>						
			</tr>
			<tr>
				<td> </td>
				<td> <HR> </td> <td> <HR> </td>
				<td> <HR> </td> <td> <HR> </td>
				<td> <HR> </td> <td> <HR> </td>
				<td> <HR> </td> <td> <HR> </td>
			</tr>
	       </#if>
	       <#assign index=index+1>
	</#list>
	</table>
	<br>
	<#if (m_search_docs.startPage > 1)><a href="${url.service}?keyword=${m_search_docs.searchTerms}&clientname=${m_search_docs.clientName}&startpage=0&count=${m_search_docs.itemsPerPage}"></#if>First<#if (m_search_docs.startPage > 0)></a></#if> |
	<#if (m_search_docs.startPage > 1)><a href="${url.service}?keyword=${m_search_docs.searchTerms}&clientname=${m_search_docs.clientName}&startpage=${m_search_docs.startPage - 1}&count=${m_search_docs.itemsPerPage}"></#if>Prev<#if (m_search_docs.startPage > 0)></a></#if> | 
	<#if (m_search_docs.startPage < m_search_docs.totalPages)><a href="${url.service}?keyword=${m_search_docs.searchTerms}&clientname=${m_search_docs.clientName}&startpage=${m_search_docs.startPage +1}&count=${m_search_docs.itemsPerPage}"></#if>Next<#if (m_search_docs.startPage+1 < m_search_docs.totalPages)></a></#if> |
	<#if (m_search_docs.startPage < m_search_docs.totalPages)><a href="${url.service}?keyword=${m_search_docs.searchTerms}&clientname=${m_search_docs.clientName}&startpage=${m_search_docs.totalPages -1}&count=${m_search_docs.itemsPerPage}"></#if>Last<#if (m_search_docs.startPage+1 < m_search_docs.totalPages)></a></#if>
<#else>
	<i>No results to display.</i>
</#if>
</body>
</html>