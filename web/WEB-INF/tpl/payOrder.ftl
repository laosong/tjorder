<#-- @ftlvariable name="order" type="com.brains.prj.tianjiu.order.domain.Order" -->
<@override name="title"><@super/>支付订单</@override>
<@override name="head_css">
<style type="text/css">
</style>
</@override>
<@override name="body_content">
<div id="content">
    <div class="shopcarbread eb_step3 ebBg fb">
        <span>1.我的购物车</span><span>2.填写核对订单信息</span><span class="stepCur">3.支付订单</span><span>4.完成</span>
    </div>
    <div class="ebCon_wrap mart10">
        <div class="ebCon">
            <div class="payOrder_succeed">
                <dl class="ebBg">
                    <dt>订单提交成功，请您尽快付款！</dt>
                    <dd>订单号：277221801<span>|</span>应付金额：<em class="succeed_price f14px fb fred">￥1599.00</em></dd>
                </dl>
            </div>
            <p class="mart20">
                <span class="f16px fb">立即支付<em class="succeed_price fred">￥1599.00</em>，即可完成订单。</span>请您在<span class="fred fb">24小时</span>内完成支付，否则订单会被自动取消。
            </p>

            <h2 class="f14px fb mart20">请选择以下网银支付：</h2>

            <div class="eb_bank mart10">
                <table summary="网银列表">
                    <tr>
                        <td>
                            <input type="radio" value="01" name="payBank"/><label><img src="/images/ecart/bank/gongshang.gif" alt="中国工商银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="02" name="payBank"/><label><img src="/images/ecart/bank/nongye.gif" alt="中国农业银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="03" name="payBank"/><label><img src="/images/ecart/bank/jianshe.gif" alt="中国建设银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="04" name="payBank"/><label><img src="/images/ecart/bank/minsheng.gif" alt="中国民生银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="05" name="payBank"/><label><img src="/images/ecart/bank/zhaohang.gif" alt="招商银行"/></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" value="06" name="payBank"/><label><img src="/images/ecart/bank/youzheng.gif" alt="中国邮政"/></label>
                        </td>
                        <td>
                            <input type="radio" value="07" name="payBank"/><label><img src="/images/ecart/bank/zhongguo.gif" alt="中国银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="08" name="payBank"/><label><img src="/images/ecart/bank/guangda.gif" alt="中国光大银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="09" name="payBank"/><label><img src="/images/ecart/bank/zhongxin.gif" alt="中信银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="10" name="payBank"/><label><img src="/images/ecart/bank/beijing.gif" alt="北京银行"/></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" value="11" name="payBank"/><label><img src="/images/ecart/bank/jiaotong.gif" alt="交通银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="12" name="payBank"/><label><img src="/images/ecart/bank/guangfa.gif" alt="广发银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="13" name="payBank"/><label><img src="/images/ecart/bank/xingye.gif" alt="兴业银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="14" name="payBank"/><label><img src="/images/ebusiness/bank/shangpufa.gif" alt="上海浦东发展银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="15" name="payBank"/><label><img src="/images/ecart/bank/huaxia.gif" alt="华夏银行"/></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" value="16" name="payBank"/><label><img src="/images/ecart/bank/guangnongxin.gif" alt="广州市农村信用合作社"/></label>
                        </td>
                        <td>
                            <input type="radio" value="17" name="payBank"/><label><img src="/images/ecart/bank/guangzhoushangye.gif" alt="广州市商业银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="18" name="payBank"/><label><img src="/images/ecart/bank/pingan.gif" alt="平安银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="19" name="payBank"/><label><img src="/images/ecart/bank/shanghaibank.gif" alt="上海银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="20" name="payBank"/><label><img src="/images/ecart/bank/shangnongshang.gif" alt="上海农村商业银行"/></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" value="21" name="payBank"/><label><img src="/images/ecart/bank/shenfa.gif" alt="深圳发展银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="22" name="payBank"/><label><img src="/images/ecart/bank/shundexin.gif" alt="顺德信用社"/></label>
                        </td>
                        <td>
                            <input type="radio" value="23" name="payBank"/><label><img src="/images/ecart/bank/nanjing.gif" alt="南京银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="24" name="payBank"/><label><img src="/images/ecart/bank/ningbo.gif" alt="宁波银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="25" name="payBank"/><label><img src="/images/ecart/bank/nongcunshangye.gif" alt="北京农村商业银行"/></label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="radio" value="26" name="payBank"/><label><img src="/images/ecart/bank/buohai.gif" alt="渤海银行"/></label>
                        </td>
                        <td>
                            <input type="radio" value="27" name="payBank"/><label><img src="/images/ecart/bank/dongya.gif" alt="东亚银行"/></label>
                        </td>
                    </tr>
                </table>
                <div class="payOrderBtn f14px fb mart20 txtright">
                    <a href="#" class="btnCom btnCom_reb"><span>确定支付方式</span></a></div>
            </div>
        </div>
        <span class="sFillet ht5 ebBg ebFillet990_b"></span>
    </div>
</div>
</@override>
<@override name="body_footerjs">
<script type="text/javascript">
    $(function () {
    });
</script>
</@override>
<@extends name="base.ftl"/>