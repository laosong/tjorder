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
    ShoppingCartService shoppingCartService;

    @Autowired
    OrderService orderService;

    @Autowired
    AddressService addressService;

    public void addProductItem(RequestContext rc) {
        String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
        String img = "test.jpg";

        int itemId = orderService.addProductItem(name, img);
        rc.putResult("itemId", itemId);
        rc.setViewName("showOrder");
        return;
    }

    public void getItemList(RequestContext rc) {
        List<ProductItem> productItems = orderService.getItemList();
        rc.putResult("productItems", productItems);
        rc.setViewName("showItemList");
        return;
    }

    public void submitCart(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            List<UserAddress> userAddresses = addressService.getUserAddresses(user.getUserId());

            ShoppingCart cart = shoppingCartService.getUseCart(user.getUserId());

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

    }
}
