package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午11:23
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

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
            result.setError(e, null);
        }
    }

    public void getItemList(RequestContext rc, ResultContext result) {
        try {
            List<GoodsItem> goodsItems = goodsService.getGoodsForSale();
            result.putResult("goodsItems", goodsItems);
            result.setTemplateView("showItemList");
        } catch (IllegalArgumentException e) {
            result.setError(e, null);
        }
    }

    public void submitCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            orderService.submitCart(user.getUserId(), cart, shoppingCartService);

            Order order = new Order();
            order.setDeliveryInfo(orderService.getDeliveryInfo(1));
            OrderFee orderFee = order.calcOrderFee(cart.getTotalPrice());

            result.putResult("provinces", provinces);
            result.putResult("cart", cart);
            result.putResult("orderFee", orderFee);
            result.setTemplateView("buy/checkOrder");
        } catch (CartEmptyException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
        } catch (DeliveryNotFoundException e) {
            result.setError(e, null);
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
            orderService.submitOrder(order, cart, shoppingCartService);

            result.putResult("orderId", order.getId());
            result.putResult("order", order);
            result.setTemplateView("buy/createOrderOk");
        } catch (BadParameterException e) {
            result.setError(e, null);
        } catch (UserAddressNotFoundException e) {
            result.setError(e, null);
        } catch (DeliveryNotFoundException e) {
            result.setError(e, null);
        } catch (CartEmptyException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
        }
    }

    public void payOrder(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = orderService.getUserOrder(user.getUserId(), orderId);

            result.putResult("order", order);

            if (order.getPaymentId() == 1) {
                result.setTemplateView("buy/orderDone");
            } else if (order.getPaymentId() == 2) {
                result.setTemplateView("buy/payOrder");
            }
        } catch (BadParameterException e) {
            result.setError(e, null);
        } catch (OrderNotFoundException e) {
            result.setError(e, null);
        }
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
            result.setError(e, null);
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
            result.setError(e, null);
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
            result.setError(e, null);
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
            result.setError(e, null);
        }
    }

    public void getMyOrderDetail(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = orderService.getUserOrder(user.getUserId(), orderId);
            fillOrderDetail(order);

            order.setPaymentInfo(orderService.getPaymentInfo(order.getPaymentId()));
            order.setDeliveryInfo(orderService.getDeliveryInfo(order.getDeliveryId()));

            ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());
            shippingInfo.setCityInfo(addressService.getCity(shippingInfo.getCitiesId()));
            order.setShippingInfo(shippingInfo);

            result.putResult("order", order);
            result.setTemplateView("home/myOrderData");
        } catch (BadParameterException e) {
            result.setError(e, null);
        } catch (OrderNotFoundException e) {
            result.setError(e, null);
        } catch (PaymentNotFoundException e) {
            result.setError(e, null);
        } catch (DeliveryNotFoundException e) {
            result.setError(e, null);
        } catch (ShippingNotFoundException e) {
            result.setError(e, null);
        } catch (CityInfoNotFoundException e) {
            result.setError(e, null);
        }
    }

    public void adminGetOrders(RequestContext rc, ResultContext result) {
        try {
            List<Order> orders = orderService.adminGetOrders(0, 0);
            for (Order order : orders) {
                fillOrderDetail(order);
            }
            result.putResult("orders", orders);
            result.setTemplateView("admin/orders");
        } catch (IllegalArgumentException e) {
            result.setError(e, null);
        }
    }
}
