<html>
	<body>
	<table width="100%" border="0">
	<tr><td valign="top">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td colspan="5" align="center" valign="middle" bgcolor="#26527E" style="font-size: small; font-weight: bold; color: #FFFFFF; padding: 15px;">Workflow Reports</td>
			</tr>
			<#assign logger = companyhome.childByNamePath["GlobalPlacement/logger.xml"]>	
			<#if logger.isDocument>
				<tr>
					<td style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-left: 10px; padding-top: 5px;" width="20%" align="left" valign="middle" bgcolor="#FFFFFF">Status <img src="/alfresco/images/icons/sort_flat.gif" border="0" valign="middle" /></td>
					<td style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  width="20%" align="left" valign="middle" bgcolor="#FFFFFF">Document <img src="/alfresco/images/icons/sort_flat.gif" border="0" valign="middle" /></td>
					<td style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  width="20%" align="left" valign="middle" bgcolor="#FFFFFF">Started on <img src="/alfresco/images/icons/sort_flat.gif" border="0" valign="middle" /></td>
					<td style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  width="20%" align="left" valign="middle" bgcolor="#FFFFFF">Completed on <img src="/alfresco/images/icons/sort_flat.gif" border="0" valign="middle" /></td>
				</tr>
				<tr><td colspan="5"><hr></td></tr>			
				<#assign xcontent=logger.xmlNodeModel>
				<#assign completedctr = 0>
				<#assign totalctr = 0>
				<#assign colorFlag = 0>
				<#list xcontent.workflows.instanceID as instanceList>
					<#assign totalctr = totalctr + 1>
					<#assign description = instanceList.description>
					<#assign id = instanceList.value>
					<#assign wfend = "Not Completed">
					<#assign wfstart = "Not Started">
					<#assign wfstate = "Pending">
					<#list instanceList.status as statusList>
						<#if statusList.value?string == "Approve">
							<#assign wfend = statusList.enddatetime>
							<#assign wfstate = "Approved">
							<#assign completedctr = completedctr + 1>
						</#if>
						<#if statusList.value?string = "Reject">
							<#assign wfstate = "Rejected">
						</#if>
						<#if statusList.value?string = "Workflow Assigned">
							<#assign wfstart = statusList.startdatetime>
							<#assign wfstate = "Pending">
						</#if>
					</#list>
					<#if colorFlag = 0>
						<tr style="background-color: #f5f5f5; height: 30px;">
							<#if wfstate?string = "Approved">
								<td align="left" valign="middle" style="font-weight: bold; color: green">${wfstate}</td>
							<#else>
								<td align="left" valign="middle" style="font-weight: bold; color: red">${wfstate}</td>
							</#if>
							<td align="left" valign="middle" font-weight:bold;">${description}</td>
							<td align="left" valign="middle">${wfstart}</td>
							<td align="left" valign="middle">${wfend}</td>
						</tr>
						<#assign colorFlag = 1>
					<#else>
						<tr style="background-color: #ffffff; height: 30px;">
							<#if wfstate?string = "Approved">
								<td align="left" valign="middle" style="font-weight: bold; color: green">${wfstate}</td>
							<#else>
								<td align="left" valign="middle" style="font-weight: bold; color: red">${wfstate}</td>
							</#if>
							<td align="left" valign="middle" font-weight:bold;">${description}</td>
							<td align="left" valign="middle">${wfstart}</td>
							<td align="left" valign="middle">${wfend}</td>
						</tr>
						<#assign colorFlag = 0>
					</#if>
				</#list>
					<tr>
						<td><hr/></td>
						<td><hr/></td>
						<td><hr/></td>
						<td><hr/></td>
					</tr>
					<tr>
						<td><b>Total Pending/Rejected</b></td>
						<td>${totalctr - completedctr}</td>
						<td><b>Total Completed</b></td>
						<td>${completedctr}</td>
					</tr>
					<tr>
						<td><hr/></td>
						<td><hr/></td>
						<td><hr/></td>
						<td><hr/></td>
					</tr>
			</#if>
		</table>
		</td>
		
		<td width="40%" valign="top">
			<#assign userLogger = companyhome.childByNamePath["GlobalPlacement/userlogger.xml"]>	
			<#if userLogger.isDocument>
				<#assign leeTotalCtr = 0>
				<#assign leeCompleteCtr = 0>
				<#assign annetTotalCtr = 0>
				<#assign annetCompleteCtr = 0>
				<#assign xcontent=userLogger.xmlNodeModel>
				<#list xcontent.workflows.user as userList>
					<#assign user = userList.name>
					<#assign counter = "0">
					<#list userList.instanceID as workflow>
						<#if user?string = "Lee_Credential"> <#assign leeTotalCtr = leeTotalCtr + 1>
						<#elseif user?string = "admin"> <#assign annetTotalCtr = annetTotalCtr + 1>
						</#if>
						<#list workflow.task as task>
							<#if task.value?string = "Approve">
								<#if user?string = "Lee_Credential"> <#assign leeCompleteCtr = leeCompleteCtr + 1>
								<#elseif user?string = "Annet_Recruiter"> <#assign annetCompleteCtr = annetCompleteCtr + 1>
								</#if>
							</#if>
						</#list>
					</#list>
				</#list>
				<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="5" align="center" valign="middle" bgcolor="#26527E" style="font-size: small; font-weight: bold; color: #FFFFFF; padding: 15px;">Performance</td>
				</tr>
				<tr>
					<td width="50" style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  align="middle" valign="middle" bgcolor="#FFFFFF">User</td>
					<td width="100" style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  align="middle" valign="middle" bgcolor="#FFFFFF">Total Tasks</td>
					<td width="100" style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  align="middle" valign="middle" bgcolor="#FFFFFF">Approved Tasks</td>
					<td width="100" colspan="2" style="border-bottom: thin; border-color:#000000;font-weight: bold; padding-top: 5px;"  align="middle" valign="middle" bgcolor="#FFFFFF">Progress</td>
				</tr>
				<tr><td colspan="5"><hr></td></tr>			
				<tr>
					<#if leeTotalCtr==0>
						<#assign leeTotalCtr = 1>
					</#if>
					<#assign completedpercent = (leeCompleteCtr*100)/leeTotalCtr>
					<td align="middle">Lee_Credential</td>
					<td align="middle">${leeTotalCtr}</td>
					<td align="middle">${leeCompleteCtr}</td>
					<td height="25"><table cellspacing="0" cellpadding="0" border="0" width="80"><tr>
					<td height="25" width="${completedpercent}%" bgcolor="green"></td>
					<#if (100 - completedpercent) != 0>
						<td width="${100 - completedpercent}%" bgcolor="red"></td>
					</#if>
					</tr></table></td>
					<td>&nbsp;${completedpercent}%</td>
				</tr>
				<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>
				<tr>
					<#if annetTotalCtr==0>
						<#assign completedpercent = 0>
					<#else>
						<#assign completedpercent = (annetCompleteCtr)/annetTotalCtr>
					</#if>
					<td align="middle">Annet_Recruiter</td>
					<td align="middle">${annetTotalCtr}</td>
					<td align="middle">${annetCompleteCtr}</td>
					<td height="25"><table cellspacing="0" cellpadding="0" border="0" width="80"><tr>
					<td height="25" width="${completedpercent}%" bgcolor="green"></td>
					<#if (100 - completedpercent) != 0>
						<td width="${100 - completedpercent}%" bgcolor="red"></td>
					</#if>
					</tr></table></td>
					<td>&nbsp;${completedpercent}%</td>
				</tr>
				</table>
			</#if>
		</td></tr></table>
	</body>
</html>