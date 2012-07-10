<#list items as productItem>
<div>${productItem.getName()?html}</div>
<div>${productItem.getImg()?html}</div>
</#list>