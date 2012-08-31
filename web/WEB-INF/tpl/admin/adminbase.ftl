<#global systemUser = __RequestContext.getSystemUser()>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><@block name="title">管理后台</@block></title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
<@block name="include_css">
    <style type="text/css" title="currentStyle">
        @import "/css/jquery/blitzer/jquery-ui-1.8.16.custom.css";
        @import "/css/admin/admin.css";
        @import "/css/admin/data_table.css";
        @import "/plugin/buk/buk.css";
    </style>
</@block>
<@block name="head_css">
</@block>
<@block name="include_js">
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/plugin/buk/pager.js"></script>
</@block>
</head>
<body>
<@block name="body_container">
<div id="floater"></div>
<div id="centered">
    <@block name="body_head">
        <div id="header">
            <div style="float:left;margin: 5px;"><h1>管理后台</h1></div>
            <div style="float:right;margin: 5px;">您好，<span>${systemUser.getUserName()!("nobody")}</span>！
                <a href="/home/user/logout.htm?toUrl=/admin/usr/login.htm">退出</a>
            </div>
        </div>
        <div id="top-nav">
            <div id="top-nav-tabs" style="height: 30px;">
                <ul>
                    <li><a href="1" class="nav-tab"><span>商品管理</span></a></li>
                    <li><a href="2" class="nav-tab"><span>用户管理</span></a></li>
                    <li><a href="3" class="nav-tab"><span>订单管理</span></a></li>
                </ul>
            </div>
        </div>
    </@block>
    <@block name="body_content">
    </@block>
    <@block name="body_footer">
        <div id="pager-bottom" class="pager-default"></div>
    </@block>
</div>
</@block>
<@block name="body_footerjs">
</@block>
</body>
</html>