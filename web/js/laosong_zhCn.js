var messages_zhCn = {
    "order.service.CartFullException":"您的购物车满了",
    "order.service.CartItemNotFoundException":"order.service.CartItemNotFoundException",
    "order.service.CartEmptyException":"您的购物车没有任何商品",
    "order.service.GoodsNotFoundException":"没有此商品",
    "order.service.GoodsStateException":"此商品可能已下架",
    "order.service.OrderNotFoundException":"没有找到这个订单",
    "order.service.BuyEvaGoodsException":"品鉴商品一个月内只能购买1次",
    "client.ajax.NeedLogin":"您需要登录才能继续此操作",
    "client.cart.InputGoodNum":"请输入一个大于0的数字"
};

function getLocaleMessage(message) {
    var pos = message.indexOf(',');
    var messageKey = message;
    if (pos > 0) {
        messageKey = message.substr(0, pos);
    }
    var localeMessage = messages_zhCn[messageKey];
    if (localeMessage) {
        return localeMessage;
    } else {
        return messageKey;
    }
}