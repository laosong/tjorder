<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<div class="sbar190 left">
    <div class="sbar_personal sbar190_cul cul_border">
        <h4 class="s190_til s190_per_til link_white fb"><a href="我的天酒.html">我的天酒商城</a></h4>
        <div class="per_nav">
            <dl>
                <dt>订单中心</dt>
                <dd><a href="/orderAction/myUnCompleteOrders">未完成订单</a></dd>
                <dd><a href="/orderAction/myCompleteOrders">已结束订单</a></dd>
                <dd <c:if test="${param.p=='comments'}">class="curNav"</c:if> ><a href="/home/user/comments.htm">我的评论</a></dd>
                <dd <c:if test="${param.p=='favor'}">class="curNav"</c:if> ><a href="/home/user/favor.htm">我的藏酒阁</a></dd>
            </dl>
            <dl>
                <dt>账户中心</dt>
                <dd <c:if test="${param.p=='info'}">class="curNav"</c:if> ><a href="/home/user/info.htm">个人资料</a></dd>
                <dd <c:if test="${param.p=='pwd'}">class="curNav"</c:if> ><a href="/home/user/ch-pwd.htm">密码修改</a></dd>
                <dd><a href="/orderAction/myAddress">地址管理</a></dd>
            </dl>
        </div>
    </div>
    <div class="sbar190_cul cul_border mart10">
        <h4 class="s190_til fb">客户服务</h4>
        <div class="per_service">
            <dl>
                <dt>免费客服电话：</dt>
                <dd>400 60 36519</dd>
                <dt>QQ：</dt>
                <dd><a href="tencent://message/?uin=12931293120&Site=www.jiandan100.cn&Menu=yes" target="_blank">12931293120</a></dd>
                <dt>客服邮箱：</dt>
                <dd><a href="mailto:service@36519.com">service@36519.com</a></dd>
            </dl>
        </div>
    </div>
</div>
