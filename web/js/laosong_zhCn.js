var messages_zhCn = {
    "client.ajax.NeedLogin":"您需要登录才能继续此操作",
    "client.ajax.ErrorTitle":"有错误发生"
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


var laosong_tip_dialog =
    '<div>' +
        '   <div id="laosong-tip-dialog" class="dialog" style="display:block; width:600px;">' +
        '       <div class="dialog-outer">' +
        '           <span class="dialog-bg dialog-bg-n"></span>' +
        '           <span class="dialog-bg dialog-bg-ne"></span>' +
        '           <span class="dialog-bg dialog-bg-e"></span>' +
        '           <span class="dialog-bg dialog-bg-se"></span>' +
        '           <span class="dialog-bg dialog-bg-s"></span>' +
        '           <span class="dialog-bg dialog-bg-sw"></span>' +
        '           <span class="dialog-bg dialog-bg-w"></span>' +
        '           <span class="dialog-bg dialog-bg-nw"></span>' +
        '           <div class="dialog-inner">' +
        '               <div class="dialog-toolbar clearfix">' +
        '                   <a title="关闭" href="javascript:void(0);" class="dialog-close">关闭</a>' +
        '                   <h3 class="dialog-title">Information</h3>' +
        '               </div>' +
        '               <div class="dialog-content">' +
        '                   <div class="tip-content"></div>' +
        '                   <div class="btns clearfix" style="padding-left: 250px;">' +
        '                       <a class="btn btn-ok" href="javascript:void(0);"><span class="btn-text">我知道了</span></a>' +
        '                   </div>' +
        '               </div>' +
        '           </div>' +
        '       </div>' +
        '   </div>' +
        '</div>';


var laosong_login_dialog =
    '<!-- 弹出登录层 --><!--end弹出登录层-- >';