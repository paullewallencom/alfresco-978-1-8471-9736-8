<table bgcolor="#edf6fc"> 
	<!-- Header Part -->
	<tr>
		<th> </th>
		<th> Title </th>  <th> </th>		
		<th> Author </th> <th> </th>
		<th> Expiration Date </th> 		
	</tr>
	<tr>
		<td> </td>
		<td> <HR> </td> 
		<td> <HR> </td>
		<td> <HR> </td>
		<td> <HR> </td>
		<td> <HR> </td>
		<td> <HR> </td>
	</tr>
	
	<#list m_documents_node.children as cust_documents>
		
			<tr>
				<td>
					<img src="${url.context}${cust_documents.icon32}"/>
				</td>
				<td align="center">
						<a class="title" href="/alfresco/${cust_documents.url}">${cust_documents.properties.name}</a>
				</td> 		
				<td> </td>				
				<td> ${cust_documents.properties.creator}</td>
				<td> </td>						
				<#if cust_documents.properties["CUST:ExpirationDate"]?exists>
					<td align="center"> ${cust_documents.properties["CUST:ExpirationDate"]?date} </td>				
				<#else>
					<td> </td>
				</#if>
										
			</tr>
			<tr>
				<td> </td>
				<td> <HR> </td>
				<td> <HR> </td>
				<td> <HR> </td>
				<td> <HR> </td>
				<td> <HR> </td>
				<td> <HR> </td>
			</tr>	

	</#list>

</table>