<#import "import/alfresco-template.ftl" as template />
<@template.header>
</@>
<script language="JavaScript">

</script>
<@template.body>
   <div id="hd">
      <@region id="header" scope="global" protected=true />
      <@region id="title" scope="template" protected=true />
      <@region id="navigation" scope="template" protected=true />
   </div>
   
   <div id="bd">
	   
<div id="demo" class="yui-navset">
    <ul class="yui-nav">
        <li><a href="#tab1" onmouseover="this.click()"><em>Alfresco Article</em></a></li>
        <li class="selected" onmouseover="this.click()"><a href="#tab2"><em>Alfresco Book Review</em></a></li>
        <li><a href="#tab3" onmouseover="this.click()"><em>Alfresco Case Study</em></a></li>
    </ul>            
    <div class="yui-content">
        <div id="tab1"><p> Alfresco Enterprise CMS Implementation on PacktPub.com First Alfresco book, worldwide service, 10% discount. 
	                   Alfresco offers true Enterprise Content Management (ECM) and aspires to be "Documentum fast and free", and was founded by a former Documentum executive.
			   Alfresco can store a wide range of digital content in flexible, smart "spaces". Content is accessible through a web interface, shared network folders, FTP, WebDav, and other methods.
                           Users can set up Alfresco to process content in certain ways, according to business rules and workflow requirements.
			   It can also apply version control to documents automatically, making it easy and safe to collaborate and update documents.
                           Alfresco is regarded as the most powerful open-source enterprise content management system. Using Alfresco, administrators can easily create rich, shared content repositories. This book shows you how to unleash this power to create collaborative working systems in your enterprise.
                           See More <a href="#" id="menutoggle" >..More</a></p></div>
        <div id="tab2"><p>This book is definitely a must-have for anyone implementing a solution using Alfresco. It is a handy reference for performing various tasks on the Alfresco platform. If you are new to content management in general then you may need additional resources to make effective use of the information available in this book.</p></div>
        <div id="tab3"><p>Presto's unique digital delivery system is a combination of Presto Service and the HP Printing Mailbox. It allows users to receive email, photos, and newsletters from a variety of well-known publishers without the need for a computer or an Internet connection.CIGNEX Created a Flexible, Easy-to-Use Content Management System to power newsletters for Presto's printing mailbox service. The Presto CMS is developed on top of Alfresco, an Open Source enterprise content management platform. The architecture supports high availability, high performance, and replication support across multiple servers.</p></div>
    </div>
</div>

<script>
    var tabView = new YAHOO.widget.TabView('demo');
</script>


<script type="text/javascript">   

    YAHOO.util.Event.onContentReady("basicmenu", function () {            
        var oMenu = new YAHOO.widget.Menu("basicmenu", { fixedcenter: true });
        oMenu.render();
        YAHOO.util.Event.addListener("menutoggle", "mouseover", oMenu.show, null, oMenu);
    
    });
    
</script>
<div id="basicmenu" class="yuimenu">
    <div class="bd">
        <ul class="first-of-type">
            <li class="yuimenuitem"><a class="yuimenuitemlabel" href="http://www.alfresco.com">Alfresco</a></li>
            <li class="yuimenuitem"><a class="yuimenuitemlabel" href="http://www.alfrescobook.com">Alfresco Book</a></li>
            <li class="yuimenuitem"><a class="yuimenuitemlabel" href="http://www.cignex.com">Visit Cignex</a></li>
        </ul>            
    </div>
</div>
	</div>
</div>	
    <br />
</@>

<@template.footer>
   <div id="ft">
      <@region id="footer" scope="global" protected=true />
   </div>
</@>