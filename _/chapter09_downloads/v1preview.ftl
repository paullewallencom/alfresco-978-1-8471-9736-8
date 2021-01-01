<html>

	<body onLoad="setTimeout('delayer()', 500)">

		<APPLET CODEBASE="/alfresco/v1files"
		ARCHIVE="ji.jar, daeja1.jar, daeja2.jar, daeja3.jar"
		CODE="ji.applet.jiApplet.class"
		NAME="ViewONE"
		WIDTH="980"
		HEIGHT="980"
		HSPACE="0"
		VSPACE="0"
		MAYSCRIPT="true"
		ALIGN="middle">

			<PARAM NAME="cabbase" VALUE="viewone.cab">
			<PARAM NAME="ACMPreloadFile" value="ji">
			<PARAM NAME="fileMenus" value="false">
			<PARAM NAME="pageButtons" value="true">
			<PARAM NAME="draggingEnabled" value="true">
			<param name="viewmode" value="thumbsleft">
			<PARAM NAME="ACMRedirectTarget" value="_self">
			<PARAM NAME="ACMDownloadPrompt" value="true">
			<PARAM NAME="ACMUpdate" value="false">
			<PARAM NAME="JavaScriptExtensions" VALUE="true">

			<#assign counter = 1>
			<#list space.children as child>
				<#if child.isDocument >
					<#if child.mimetype = "image/gif" || child.mimetype="image/jpeg" || child.mimetype="application/pdf" || child.mimetype="image/tiff">
						<param name="page${counter?string}" value="/alfresco${child.url}">
						<#assign counter = counter + 1 >
					</#if>
				</#if>
			</#list>
		</APPLET>

		<script>

			function delayer()
			{

			ViewONE.setFileButtons(false);
			ViewONE.setAreaZoom (true);

			}

		</script>
	</body>
</html>