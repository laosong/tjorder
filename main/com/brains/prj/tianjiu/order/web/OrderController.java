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

import com.brains.prj.tianjiu.order.mvc.RequestContext;

import com.brains.prj.tianjiu.order.domain.ProductItem;
import com.brains.prj.tianjiu.order.domain.Order;

import com.brains.prj.tianjiu.order.service.OrderService;

@Controller
public class OrderController {

    @Autowired
    OrderService orderService;

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public int addProductItem(RequestContext rc) {
        String name = org.apache.commons.lang.RandomStringUtils.randomAscii(200);
        String img = "test.jpg";

        int itemId = orderService.addProductItem(name, img);
        rc.setViewName("showOrder.ftl");
        return itemId;
    }

    public void getItemList(RequestContext rc) {
        List<ProductItem> items = orderService.getItemList();
        rc.putResult("items", items);
        rc.setViewName("showItemList.ftl");
    }

    public void showOrder(RequestContext rc) {
        Order order = new Order();
        order.setCreatedDate(new java.util.Date());
        rc.putResult("order", order);
        rc.setViewName("showOrder.ftl");
    }
}
