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

    public void addProductItem(RequestContext rc) {
        String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
        String img = "test.jpg";

        int itemId = productService.addProductItem(name, img);
        rc.putResult("itemId", itemId);
        rc.setViewName("showOrder");
    }

    public void getItemList(RequestContext rc) {
        List<ProductItem> productItems = productService.getItemList();
        rc.putResult("productItems", productItems);
        rc.setViewName("showItemList");
    }

    public void submitCart(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            ShoppingCart cart = compositeService.getUserCart(user.getUserId());

            rc.putResult("provinces", provinces);
            rc.putResult("cart", cart);
            rc.setViewName("checkOrder");

        } catch (IllegalArgumentException e) {
            rc.setError(e);
        }
    }

    public void updateOrderShipInfo(RequestContext rc) {
    }

    public void updateOrderPayment(RequestContext rc) {
    }

    public void updateOrderDelivery(RequestContext rc) {
    }

    public void submitOrder(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            Order order = new Order();
            int orderPost = rc.getParameterInt("orderPost");
            int payment = rc.getParameterInt("payment");
            int delivery = rc.getParameterInt("delivery");

            UserAddress userAddress = null;
            ShippingInfo shippingInfo = new ShippingInfo();

            if (orderPost <= 0) {
                String provinceName = rc.getParameter("provinceName");
                String cityName = rc.getParameter("cityName");
                String countryName = rc.getParameter("countryName");
                String recvName = rc.getParameter("recvName");
                String address = rc.getParameter("address");
                String zipCode = rc.getParameter("zipCode");
                String recvPhone = rc.getParameter("recvPhone");

                CityInfo cityInfo = addressService.getCity(provinceName, cityName, countryName);

                userAddress = new UserAddress();
                userAddress.setUserId(user.getUserId());
                userAddress.setCitiesId(cityInfo.getId());
                userAddress.setAddress(address);
                userAddress.setZipCode(zipCode);
                userAddress.setRecvName(recvName);
                userAddress.setRecvPhone(recvPhone);

                if (true) {
                    addressService.saveUserAddress(userAddress);
                }
            } else {
                userAddress = addressService.getAddressById(orderPost);
            }

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

            int result = orderService.submitOrder(order, shoppingCart);

            rc.putResult("orderId", order.getId());
            rc.putResult("order", order);
            rc.setViewName("createOrderOk");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (CityInfoNotFoundException e) {
            rc.setError(e);
        } catch (UserAddressNotFoundException e) {
            rc.setError(e);
        } catch (DeliveryNotFoundException e) {
            rc.setError(e);
        } catch (CartEmptyException e) {
            rc.setError(e);
        } catch (ProductStateException e) {
            rc.setError(e);
        }
    }

    public void payOrder(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = orderService.getUserOrder(user.getUserId(), orderId);

            if (order.getPaymentId() == 1) {
                rc.setViewName("orderDone");
            } else if (order.getPaymentId() == 2) {
                rc.setViewName("payOrder");
            }

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (OrderNotFoundException e) {
            rc.setError(e);
        }
    }

    public void getOrderDetail(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = compositeService.getUserOrderDetail(user.getUserId(), orderId);

            order.setPaymentInfo(orderService.getPaymentInfo(order.getPaymentId()));
            order.setDeliveryInfo(orderService.getDeliveryInfo(order.getDeliveryId()));

            ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());
            shippingInfo.setCityInfo(addressService.getCity(shippingInfo.getCitiesId()));
            order.setShippingInfo(shippingInfo);

            rc.putResult("order", order);
            rc.setViewName("showOrder");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (OrderNotFoundException e) {
            rc.setError(e);
        } catch (PaymentNotFoundException e) {
            rc.setError(e);
        } catch (DeliveryNotFoundException e) {
            rc.setError(e);
        } catch (ShippingNotFoundException e) {
            rc.setError(e);
        } catch (CityInfoNotFoundException e) {
            rc.setError(e);
        }
    }

    public void getMyOrders(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = compositeService.getUserOrders(user.getUserId());

            rc.putResult("orders", orders);
            rc.setViewName("showMyOrders");

        } catch (OrderNotFoundException e) {
            rc.setError(e);
        }
    }

    public void getMyCompleteOrders(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<Order> orders = compositeService.getUserCompleteOrders(user.getUserId());

            rc.putResult("orders", orders);
            rc.setViewName("showMyCompleteOrders");

        } catch (OrderNotFoundException e) {
            rc.setError(e);
        }
    }

    public void getMyOrderDetail(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int orderId = rc.getParameterInt("orderId");
            Order order = compositeService.getUserOrderDetail(user.getUserId(), orderId);

            order.setPaymentInfo(orderService.getPaymentInfo(order.getPaymentId()));
            order.setDeliveryInfo(orderService.getDeliveryInfo(order.getDeliveryId()));

            ShippingInfo shippingInfo = orderService.getOrderShippingInfo(order.getShippingId());
            shippingInfo.setCityInfo(addressService.getCity(shippingInfo.getCitiesId()));
            order.setShippingInfo(shippingInfo);

            rc.putResult("order", order);
            rc.setViewName("showMyOrderData");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (OrderNotFoundException e) {
            rc.setError(e);
        } catch (PaymentNotFoundException e) {
            rc.setError(e);
        } catch (DeliveryNotFoundException e) {
            rc.setError(e);
        } catch (ShippingNotFoundException e) {
            rc.setError(e);
        } catch (CityInfoNotFoundException e) {
            rc.setError(e);
        }
    }
}
