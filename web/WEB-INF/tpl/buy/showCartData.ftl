<#-- @ftlvariable name="cart" type="com.brains.prj.tianjiu.order.domain.ShoppingCart" -->
<table summary="购物车清单" class="ebtable">
    <thead>
    <tr>
        <th width="10%"><span>商品编号</span></th>
        <th><span>商品</span></th>
        <th width="10%"><span>天酒优惠价</span></th>
        <th width="10%"><span>原价</span></th>
        <th width="10%"><span>库存状态</span></th>
        <th width="12%"><span>订购数量</span></th>
        <th width="8%">操作</th>
    </tr>
    </thead>
    <tbody>
    <#assign cartItems = cart.getCartItems()>
    <#list cartItems as cartItem>
        <#assign productItem = cartItem.getProductItem()>
    <tr class="cart_row">
        <td>${cartItem_index+1} - ${productItem.getId()}</td>
        <td class="t_left"><a href="#" target="_blank">${productItem.getName()?html}</a></td>
        <td>${productItem.getPrice()}</td>
        <td>${productItem.getPrice()}</td>
        <td>现货</td>
        <td class="p-quantity">
            <div class="quantity-form">
                <a name="decrease_num" class="decrement" href="javascript:void(0);" title="减少数量">-</a>
                <input name="edit_num" class="quantity-text" type="text" value="${cartItem.getQuantity()?c}"/>
                <a name="increase_num" class="increment" href="javascript:void(0);" title="增加数量">+</a>
            </div>
        </td>
        <td><a name="delete_item" href="javascript:void(0);">删除</a></td>
        <input type="hidden" name="id" value="${cartItem.getId()?c}"/>
        <input type="hidden" name="itemId" value="${productItem.getId()?c}"/>
    </tr>
    </#list>
    </tbody>
</table>
<div class="payOrderTotal txtright f14px fb">
    <span class="payOrderTotal_num"><em>${cart.getItemSum()?c}</em>件商品</span>总计金额：<span class="f16px fred">${cart.getTotalPrice()}</span>
</div>