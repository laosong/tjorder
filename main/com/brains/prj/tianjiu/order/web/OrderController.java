package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午11:23
 * To change this template use File | Settings | File Templates.
 */

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.apache.commons.lang.StringUtils;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.TotalList;
import com.brains.prj.tianjiu.order.common.BadParameterException;
import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.mvc.ResultContext;

import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class OrderController {

    @Autowired
    GoodsService goodsService;

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    OrderService orderService;

    @Autowired
    AddressService addressService;

    public void addProductItem(RequestContext rc, ResultContext result) {
        try {
            String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
            String img = "test.jpg";
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getItemList(RequestContext rc, ResultContext result) {
        try {
            List<GoodsItem> goodsItems = goodsService.getGoodsForSale();
            result.putResult("goodsItems", goodsItems);
            result.setTemplateView("showItemList");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void submitCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            OrderFee orderFee = orderService.submitCart(user.getUserId(), cart);

            result.putResult("provinces", provinces);
            result.putResult("cart", cart);
            result.putResult("orderFee", orderFee);
            result.setTemplateView("buy/checkOrder");
        } catch (CartEmptyException e) {
            result.setError(e, "cartEmptyException", "buy/submitCartEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/submitCartEr");
        } catch (EvaGoodsBuyException e) {
            result.setError(e, "evaGoodsBuyException", "buy/submitCartEr");
        }
    }

    public void updateOrderShipInfo(RequestContext rc, ResultContext result) {
    }

    public void updateOrderPayment(RequestContext rc, ResultContext result) {
    }

    public void updateOrderDelivery(RequestContext rc, ResultContext result) {
    }

    public void submitOrder(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            Order order = new Order();
            int orderPost = rc.getParameterInt("orderPost");
            int payment = rc.getParameterInt("payment");
            int delivery = rc.getParameterInt("delivery");

            UserAddress userAddress = addressService.getUserAddressById(orderPost);

            ShippingInfo shippingInfo = new ShippingInfo();
            shippingInfo.setCitiesId(userAddress.getCitiesId());
            shippingInfo.setAddress(userAddress.getAddress());
            shippingInfo.setZipCode(userAddress.getZipCode());
            shippingInfo.setRecvName(userAddress.getRecvName());
            shippingInfo.setRecvPhone(userAddress.getRecvPhone());

            order.setUserId(user.getUserId());
            order.setPaymentId(payment);
            order.setDeliveryId(delivery);
            order.setTypes(Order.TYPES_NORMAL);

            order.setShippingInfo(shippingInfo);

            order.setDeliveryInfo(orderService.getDeliveryInfo(delivery));

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            orderService.submitOrder(order, cart);
            shoppingCartService.clearUserCart(user.getUserId());

            result.putResult("orderCd", order.getOrderCd());
            result.setTemplateView("buy/createOrderOk");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/submitOrderEr");
        } catch (UserAddressNotFoundException e) {
            result.setError(e, "userAddressNotFoundException", "buy/submitOrderEr");
        } catch (DeliveryNotFoundException e) {
            result.setError(e, "deliveryNotFoundException", "buy/submitOrderEr");
        } catch (CartEmptyException e) {
            result.setError(e, "cartEmptyException", "buy/submitOrderEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/submitOrderEr");
        } catch (EvaGoodsBuyException e) {
            result.setError(e, "evaGoodsBuyException", "buy/submitOrderEr");
        }
    }

    public void payAfterSubmit(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            String orderCd = rc.getParameter("orderCd");
            try {
                Order order = orderService.preparePay(user.getUserId(), orderCd);

                result.putResult("order", order);
                result.setTemplateView("buy/preparePay");
            } catch (OrderPayNoNeedException e) {
                result.putResult("order", e.getOrder());
                result.setTemplateView("buy/orderDone");
            }
        } catch (OrderNotFoundException e) {
            result.setError(e, "orderNotFoundException", "buy/preparePayEx");
        } catch (OrderStateException e) {
            result.setError(e, "orderStateException", "buy/preparePayEx");
        } catch (OrderPayExpiredException e) {
            result.setError(e, "orderNotFoundException", "buy/preparePayEx");
        }
    }

    public void alipaySubmit(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();
            String orderCd = rc.getParameter("orderCd");
            try {
                Order order = orderService.preparePay(user.getUserId(), orderCd);
                ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());

                Map<String, String> sParaTemp = new HashMap<String, String>();
                sParaTemp.put("service", "create_partner_trade_by_buyer");
                sParaTemp.put("partner", AliPayHelper.partner);
                sParaTemp.put("_input_charset", AliPayHelper.input_charset);
                sParaTemp.put("payment_type", "1");
                sParaTemp.put("return_url", AliPayHelper.ALIPAY_RETURN_URL);
                sParaTemp.put("notify_url", AliPayHelper.ALIPAY_NOTIFY_URL);
                sParaTemp.put("seller_email", AliPayHelper.seller_email);
                sParaTemp.put("out_trade_no", order.getOrderCd());
                sParaTemp.put("subject", order.getOrderCd());
                sParaTemp.put("price", "0.01");
                sParaTemp.put("quantity", "1");
                sParaTemp.put("logistics_fee", "0.00");
                sParaTemp.put("logistics_type", "POST");
                sParaTemp.put("logistics_payment", "SELLER_PAY");
                sParaTemp.put("body", order.getOrderDesc());
                sParaTemp.put("show_url", AliPayHelper.ALIPAY_SHOW_URL_BASE + order.getOrderCd());
                sParaTemp.put("receive_name", shippingInfo.getRecvName());
                sParaTemp.put("receive_address", shippingInfo.getAddress());
                sParaTemp.put("receive_zip", shippingInfo.getZipCode());
                sParaTemp.put("receive_phone", shippingInfo.getRecvPhone());
                sParaTemp.put("receive_mobile", shippingInfo.getRecvEmail());

                String sHtmlText = AliPayHelper.buildRequest(sParaTemp, "POST");
                result.putResult("alipaySubmitForm", sHtmlText);
                result.setTemplateView("buy/alipaySubmit");
            } catch (OrderPayNoNeedException e) {
                result.putResult("order", e.getOrder());
                result.setTemplateView("buy/orderDone");
            }
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        } catch (OrderNotFoundException e) {
            result.setError(e, "orderNotFoundException", "buy/alipaySubmitEx");
        } catch (OrderStateException e) {
            result.setError(e, "orderStateException", "buy/alipaySubmitEx");
        } catch (OrderPayExpiredException e) {
            result.setError(e, "orderNotFoundException", "buy/alipaySubmitEx");
        } catch (ShippingNotFoundException e) {
            result.setError(e, "shippingNotFoundException", "buy/alipaySubmitEx");
        }
    }

    public void alipayReturn(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            java.util.Map<String, String[]> paramsMap = RequestContext.parseQueryString(rc.getQueryString());
            java.util.Map<String, String> params = AliPayHelper.convert(paramsMap);

            boolean verifyOK = AliPayHelper.verify(params);
            if (verifyOK) {
                String out_trade_no = params.get("out_trade_no");
                String trade_no = params.get("trade_no");
                String trade_status = params.get("trade_status");
                String total_fee = params.get("total_fee");
                if (StringUtils.equals(trade_status, "WAIT_SELLER_SEND_GOODS")) {
                    orderService.payOrder(out_trade_no);
                    Order order = orderService.getUserOrder(user.getUserId(), out_trade_no);
                    result.putResult("order", order);
                    result.setTemplateView("buy/orderDone");
                }
            } else {
                System.out.print("AliPayHelper.verify failed!!");
            }
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        } catch (UnsupportedEncodingException e) {
            result.setError(e, "unsupportedEncodingException", "buy/alipayReturnEx");
        } catch (OrderNotFoundException e) {
            result.setError(e, "orderNotFoundException", "buy/alipayReturnEx");
        }
    }

    public void alipayNotify(RequestContext rc, ResultContext result) {
    }

    protected void fillOrderDetail(Order order) {
        for (OrderItem orderItem : order.getOrderItems()) {
            orderItem.setGoodsItem(goodsService.getGoodsItemNoThrow(orderItem.getItemId()));
        }
    }

    public void getMyHomeInfo(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            result.setTemplateView("home/myHome");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyOrders(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = orderService.getUserOrders(user.getUserId());
            for (Order order : orders) {
                fillOrderDetail(order);
            }
            result.putResult("orders", orders);
            result.setTemplateView("home/myOrders");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyUnCompleteOrders(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = orderService.getUserUnCompleteOrders(user.getUserId());
            for (Order order : orders) {
                fillOrderDetail(order);
            }
            result.putResult("orders", orders);
            result.setTemplateView("home/myUnCompleteOrders");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyCompleteOrders(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = orderService.getUserCompleteOrders(user.getUserId());
            for (Order order : orders) {
                fillOrderDetail(order);
            }
            result.putResult("orders", orders);
            result.setTemplateView("home/myCompleteOrders");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMyOrderDetail(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
        } catch (BadParameterException e) {
            result.setError(e, null, null);
        }
    }

    public void adminGetOrders(RequestContext rc, ResultContext result) {
        try {
            int num_per_page = 10;

            TotalList<Order> totalList = orderService.getOrdersInfo(0, num_per_page);

            result.putResult("orders", totalList.getList());
            result.setTemplateView("admin/orders");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void adminGetOrder(RequestContext rc, ResultContext result) {
        try {
            int orderId = rc.getParameterInt("orderId");

            Order order = orderService.getOrder(orderId);

            List<OrderStatus> orderStatuses = orderService.getOrderStatus(orderId);

            result.putResult("order", order);
            result.putResult("orderStatuses", orderStatuses);
            result.setTemplateView("admin/order");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        } catch (BadParameterException e) {
            result.setError(e, null, null);
        } catch (OrderNotFoundException e) {
            result.setError(e, null, null);
        }
    }
}
