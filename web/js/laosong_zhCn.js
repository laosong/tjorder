var messages_zhCn = {
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