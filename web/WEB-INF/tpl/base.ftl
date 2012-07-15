<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title><@block name="title">天酒商城-</@block></title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
<@block name="include_css">
    <style type="text/css">
        @import "/css/jquery/blitzer/jquery-ui-1.8.16.custom.css";
        @import "/needim-noty/css/jquery.noty.css";
        @import "/needim-noty/css/noty_theme_default.css";
        @import "/css/home/home.css";
        @import "/css/home/laosong.css";
    </style>
</@block>
<@block name="head_css">
</@block>
<@block name="include_js">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/needim-noty/js/jquery.noty.js"></script>
    <script type="text/javascript" src="/js/laosong.js"></script>
</@block>
</head>
<body>
<div id="top_container" class="">
<@block name="body_head">
    <div class="header_bar">
        <div id="h_1" class=""></div>
        <div id="h_2" class=""> 欢迎：
            <#if (SystemUser.getUserId()<0)>
                <a href="/orderAction/showLoginPage">[登录]</a> <b>|</b> <a href="javascript:void(0);">[免费注册]</a>
            <#else>
                <a href="/orderAction/showCart">${SystemUser.getUserName()}</a><b>|</b><a href="/orderAction/logout">[退出]</a>
            </#if>
        </div>
        <div id="h_3" class=""><a href="/orderAction/showItemList"><img src="/images/top_logo.png" border="0"></a></div>
        <div id="h_4" class=""><img src="/images/slogan-1.png" alt="" border="0"></div>
        <div class="clear"></div>
        <div id="h_21" class=""><a href="#">喝好酒，上天酒</a></div>
        <div id="h_22" class=""><img src="/images/top_search01.jpg" alt=""></div>
        <div id="h_23" class=""><input id=keyword type="text" name="keyword"></div>
        <div id="h_24" class=""><img src="/images/top_search02.jpg" alt=""></div>
        <div id="h_25" class=""><img src="/images/top_search_btn.jpg" alt=""></div>
        <div id="h_26" class=""><a href="#">茅台</a> <b>|</b> <a href="#">10年陈</a> <b>|</b> <a href="#">五粮液</a></div>
    </div>
</@block>
<@block name="body_content">
</@block>
    <div class="space clear"></div>
    <div class="space clear"></div>
<@block name="body_footer">
    <div class="footer_bar">
        <div class="services">
            <div class="services_block float_l">
                <div class="title">支付方式</div>
                <ul>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                </ul>
            </div>
            <div class="services_block float_l">
                <div class="title">支付方式</div>
                <ul>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                </ul>
            </div>
            <div class="services_block float_l">
                <div class="title">支付方式</div>
                <ul>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                </ul>
            </div>
            <div class="services_block float_l">
                <div class="title">支付方式</div>
                <ul>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                </ul>
            </div>
            <div class="services_block float_l">
                <div class="title">支付方式</div>
                <ul>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                    <li><a href="#">xxxx</a></li>
                </ul>
            </div>
        </div>
        <div align="center" class="clear">© 天酒商城 36519.com All Rights Reserved <br>京ICP备20997897987号-1 京公网安备11010500000
        </div>
    </div>
</@block>
</div>
<@block name="body_footerjs">
</@block>
</body>
</html>