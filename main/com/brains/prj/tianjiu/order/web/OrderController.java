package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午11:23
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.common.BadParameterException;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

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

    public void addProductItem(RequestContext rc) {
        String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
        String img = "test.jpg";

        int itemId = productService.addProductItem(name, img);
        rc.putResult("itemId", itemId);
        rc.setViewName("showOrder");
        return;
    }

    public void getItemList(RequestContext rc) {
        List<ProductItem> productItems = productService.getItemList();
        rc.putResult("productItems", productItems);
        rc.setViewName("showItemList");
        return;
    }

    public void submitCart(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<String> provinces = addressService.getProvinces();

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            ShoppingCart cart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("provinces", provinces);
            rc.putResult("userAddresses", userAddresses);
            rc.putResult("cart", cart);
            rc.setViewName("prepareOrder");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
        return;
    }

    public void updateOrderShipInfo(RequestContext rc) {
        return;
    }

    public void updateOrderPayment(RequestContext rc) {
        return;
    }

    public void updateOrderDelivery(RequestContext rc) {
        return;
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

            int orderId = orderService.submitOrder(order);

            rc.putResult("orderId", orderId);
            rc.putResult("order", order);
            rc.setViewName("createOrderOk");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (CityInfoNotFoundException e) {
            rc.setError(e);
        } catch (UserAddressNotFoundException e) {
            rc.setError(e);
        } catch (CartEmptyException e) {
            rc.setError(e);
        } catch (ProductStateException e) {
            rc.setError(e);
        }
    }
}
