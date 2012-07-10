<#assign cartItems=cart.getCartItems()>
<#list cartItems as item>
<div>${item.getId()}</div>
<div>${item.getItemId()}</div>
</#list>