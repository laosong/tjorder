<#-- @ftlvariable name="cart" type="com.brains.prj.tianjiu.order.domain.ShoppingCart" -->
<table width="100%" border="0" cellspacing="2" cellpadding="4" bgcolor="#fefefe">
    <tr class="cart_list_header">
        <td width="15%" align="center"> 编号</td>
        <td width="45%" align="center"> 商品名称</td>
        <td width="12%" align="center">价格</td>
        <td width="20%" align="center"> 商品数量</td>
        <td width="10%" align="center">操作</td>
    </tr>
<#assign cartItems = cart.getCartItems()>
<#list cartItems as cartItem>
    <#assign productItem = cartItem.getProductItem()>
    <tr class="cart_row<#if cartItem_index%2==0> row_odd<#else> row_even</#if>">
        <td align="center">${cartItem_index+1} - ${productItem.getId()}</td>
        <td>
            <a href="#">
                <img src="/upload/${productItem.getImg()}" border="0" width="100" height="100" align="middle"/>
            </a> &nbsp;&nbsp;<a href="#">${productItem.getName()?html}</a>
        </td>
        <td align="right"><span><STRONG>${productItem.getPrice()}</STRONG></span></td>
        <td align="center" class="p-quantity">
            <div class="quantity-form">
                <a name="decrease_num" class="decrement" href="javascript:void(0);">-</a>
                <input name="edit_num" class="quantity-text" type="text" value="${cartItem.getQuantity()?c}"/>
                <a name="increase_num" class="increment" href="javascript:void(0);">+</a>
            </div>
        </td>
        <td align="center"><a name="delete_item" href="javascript:void(0);">删除</a></td>
        <input type="hidden" name="id" value="${cartItem.getId()?c}"/>
        <input type="hidden" name="itemId" value="${productItem.getId()?c}"/>
    </tr>
</#list>
    <tr class="row_end">
        <td colspan="5" align="right">共计 ${cart.getItemSum()?c} 件商品 ${cart.getTotalPrice()} 元</td>
    </tr>
</table>