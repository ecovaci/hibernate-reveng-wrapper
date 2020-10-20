<#if ejb3>
<#if pojo.hasIdentifierProperty()>
<#if property.equals(clazz.identifierProperty)>
 ${pojo.generateAnnIdGenerator()}
</#if>
 <#if property.getMetaAttribute("extra-annotations")??>
  ${property.getMetaAttribute("extra-annotations").getValue()}
 </#if>
</#if>
<#if c2h.isOneToOne(property)>
${pojo.generateOneToOneAnnotation(property, md)}
<#elseif c2h.isManyToOne(property)>
${pojo.generateManyToOneAnnotation(property)}
${pojo.generateJoinColumnsAnnotation(property, md)}
<#elseif c2h.isCollection(property)>
${pojo.generateCollectionAnnotation(property, md)}
<#else>
 <#assign basicAnnotation = pojo.generateBasicAnnotation(property)>
 <#if basicAnnotation?trim?has_content>
${basicAnnotation}
 </#if>
 <#if property.getMetaAttribute("overwrite-column")??>${property.getMetaAttribute("overwrite-column").getValue()}
 <#elseif property.getMetaAttribute("column-append-attr")??>
  ${pojo.generateAnnColumnAnnotation(property)?remove_ending(")") + "," + property.getMetaAttribute("column-append-attr").getValue() + ")"}
 <#else>
${pojo.generateAnnColumnAnnotation(property)}
 </#if>
</#if>
</#if>