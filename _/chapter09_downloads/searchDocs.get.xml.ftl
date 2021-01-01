<?xml version="1.0" encoding="UTF-8"?>
<items> 
	<#if m_search_docs.results?exists>
		<#assign count=0>
		<#assign index=0>
		<#list m_search_docs.results as l_result_document>
			<#if (index>=m_search_docs.startPage) && (index<m_search_docs.startPage+m_search_docs.itemsPerPage)>
				<#assign count=count+1>
				<#assign curl=url.serviceContext>
				<item>
				<name>${l_result_document.properties.name}</name>
				<title>
				<#if l_result_document.properties.title?exists>
					${l_result_document.properties.title}
				</#if>
				</title> 
				<size> ${l_result_document.size} </size>
				<author>${l_result_document.properties.creator}</author>	
				<clientname>
				<#if l_result_document.properties["CUST:ClientName"]?exists>
					${l_result_document.properties["CUST:ClientName"]}
				</#if>
				</clientname>
				<expirationdate>
				<#if l_result_document.properties["CUST:ExpirationDate"]?exists>
					${l_result_document.properties["CUST:ExpirationDate"]?datetime}
				</#if>					
				</expirationdate>
				<modificationdate>
				<#if l_result_document.properties["cm:modified"]?exists>
					${l_result_document.properties["cm:modified"]?datetime}
				</#if>					
				</modificationdate>
				</item>	
			</#if>
			<#assign index=index+1>
		</#list>
	<#else>
		No results to display.
	</#if>
</items> 