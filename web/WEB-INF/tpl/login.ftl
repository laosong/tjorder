<@override name="title"><@super/>登录</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/orderAction/login?userId=1">以用户A登录</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/orderAction/login?userId=2">以用户B登录</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/orderAction/login?userId=3">以用户C登录</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="/orderAction/login?userId=4">以用户D登录</a>
    </div>

    <div class="space clear"></div>
    <div class="space clear"></div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="base.ftl"/>