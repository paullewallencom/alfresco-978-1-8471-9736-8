<#-- Sends email to people when a document is pending approval -->

A document titled '${document.name}' is pending your approval in the '${space.name}' space.

You can view it through this link:
http://localhost:8080/alfresco${document.url}

Please review and approve it as soon as possible.

Best Regards

'${person.properties.firstName}<#if person.properties.lastName?exists> ${person.properties.lastName}</#if>'
Your Title
Your Company Name
Your Signature
