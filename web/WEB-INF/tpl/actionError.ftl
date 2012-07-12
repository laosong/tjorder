<@override name="title"><@super/>登录</@override>
<@override name="head_css">
<style type="text/css">
    .error_info {
    }
</style>
</@override>
<@override name="body_content">
<div class="home_body">
    <div class="space clear"></div>
    <div class="space clear"></div>

    <div class="error_info">
        <span><div>${message!}</div></span>
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