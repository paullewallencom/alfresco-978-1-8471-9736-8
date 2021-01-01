<div class="dashlet">
  <div class="title">${msg("title")}</div>
  <div class="body scrollableList">
    <#list sitesdocuments as site>
    <div class="icon">
      ${site.name}
    </div>
    <#assign documents=site.documents>
    <#list documents.entries as entry>
    <div class="detail-list-item">
      <#assign cmis_object=entry.getExtension(atom.names.cmis_object)>      
      <div class="details">
        ${cmis_object.lastModificationDate.dateValue?datetime}
      </div>
      
    </div>
    </#list>
    </#list>
  </div>
</div>