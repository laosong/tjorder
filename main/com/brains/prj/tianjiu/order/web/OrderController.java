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
    ProductService productService;

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    OrderService orderService;

    @Autowired
    AddressService addressService;

    @Autowired
    CompositeService compositeService;

    public void addProductItem(RequestContext rc, ResultContext result) {
        String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
        String img = "test.jpg";

        int itemId = productService.addProductItem(name, img);
        result.putResult("itemId", itemId);
        result.setViewName("showOrder");
    }

    public void getItemList(RequestContext rc, ResultContext result) {
        List<ProductItem> productItems = productService.getItemList();
        result.putResult("productItems", productItems);
        result.setViewName("showItemList");
    }

    public void submitCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            ShoppingCart cart = compositeService.getUserCart(user.getUserId());

            result.putResult("provinces", provinces);
            result.putResult("cart", cart);
            result.setViewName("checkOrder");

        } catch (IllegalArgumentException e) {
            result.setError(e);
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

            UserAddress userAddress = addressService.getAddressById(orderPost);

            ShippingInfo shippingInfo = new ShippingInfo();
            shippingInfo.setCitiesId(userAddress.getCitiesId());
            shippingInfo.setAddress(userAddress.getAddress());
            shippingInfo.setZipCode(userAddress.getZipCode());
            shippingInfo.setRecvName(userAddress.getRecvName());
            shippingInfo.setRecvPhone(userAddress.getRecvPhone());

            order.setUserId(user.getUserId());
            order.setPaymentId(payment);
            order.setDeliveryId(delivery);
            order.setTypes((short) 1);

            order.setShippingInfo(shippingInfo);

            order.setDeliveryInfo(orderService.getDeliveryInfo(delivery));

            ShoppingCart shoppingCart = compositeService.getUserCart(user.getUserId());

            int submitResult = orderService.submitOrder(order, shoppingCart);

            result.putResult("orderId", order.getId());
            result.putResult("order", order);
            result.setViewName("createOrderOk");

        } catch (BadParameterException e) {
            result.setError(e);
        } catch (UserAddressNotFoundException e) {
            result.setError(e);
        } catch (DeliveryNotFoundException e) {
            result.setError(e);
        } catch (CartEmptyException e) {
            result.setError(e);
        } catch (ProductStateException e) {
            result.setError(e);
        }
    }

    public void payOrder(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = orderService.getUserOrder(user.getUserId(), orderId);

            if (order.getPaymentId() == 1) {
                result.setViewName("orderDone");
            } else if (order.getPaymentId() == 2) {
                result.setViewName("payOrder");
            }

        } catch (BadParameterException e) {
            result.setError(e);
        } catch (OrderNotFoundException e) {
            result.setError(e);
        }
    }

    public void getOrderDetail(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = compositeService.getUserOrderDetail(user.getUserId(), orderId);

            order.setPaymentInfo(orderService.getPaymentInfo(order.getPaymentId()));
            order.setDeliveryInfo(orderService.getDeliveryInfo(order.getDeliveryId()));

            ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());
            shippingInfo.setCityInfo(addressService.getCity(shippingInfo.getCitiesId()));
            order.setShippingInfo(shippingInfo);

            result.putResult("order", order);
            result.setViewName("showOrder");

        } catch (BadParameterException e) {
            result.setError(e);
        } catch (OrderNotFoundException e) {
            result.setError(e);
        } catch (PaymentNotFoundException e) {
            result.setError(e);
        } catch (DeliveryNotFoundException e) {
            result.setError(e);
        } catch (ShippingNotFoundException e) {
            result.setError(e);
        } catch (CityInfoNotFoundException e) {
            result.setError(e);
        }
    }

    public void getMyOrders(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = compositeService.getUserOrders(user.getUserId());

            result.putResult("orders", orders);
            result.setViewName("showMyOrders");

        } catch (OrderNotFoundException e) {
            result.setError(e);
        }
    }

    public void getMyCompleteOrders(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = compositeService.getUserCompleteOrders(user.getUserId());

            result.putResult("orders", orders);
            result.setViewName("showMyCompleteOrders");

        } catch (OrderNotFoundException e) {
            result.setError(e);
        }
    }

    public void getMyOrderDetail(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = compositeService.getUserOrderDetail(user.getUserId(), orderId);

            order.setPaymentInfo(orderService.getPaymentInfo(order.getPaymentId()));
            order.setDeliveryInfo(orderService.getDeliveryInfo(order.getDeliveryId()));

            ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());
            shippingInfo.setCityInfo(addressService.getCity(shippingInfo.getCitiesId()));
            order.setShippingInfo(shippingInfo);

            result.putResult("order", order);
            result.setViewName("showMyOrderData");

        } catch (BadParameterException e) {
            result.setError(e);
        } catch (OrderNotFoundException e) {
            result.setError(e);
        } catch (PaymentNotFoundException e) {
            result.setError(e);
        } catch (DeliveryNotFoundException e) {
            result.setError(e);
        } catch (ShippingNotFoundException e) {
            result.setError(e);
        } catch (CityInfoNotFoundException e) {
            result.setError(e);
        }
    }
}
