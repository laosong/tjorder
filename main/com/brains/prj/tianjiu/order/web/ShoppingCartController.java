package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午6:50
 * To change this template use File | Settings | File Templates.
 */

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.common.*;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;

    public int addItem(RequestContext rc) {
        int id = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int itemId = StringConvert.toInt(rc.getRequestParameter("itemId"));
            int itemCount = 0;
            try {
                itemCount = StringConvert.toInt(rc.getRequestParameter("itemCount"));
            } catch (Exception e) {
                itemCount = 1;
            }

            ShoppingCart briefShoppingCart = new ShoppingCart();
            id = shoppingCartService.addItem(user.getUserId(), itemId, itemCount, briefShoppingCart);

            rc.putResult("itemSum", briefShoppingCart.getItemSum());
            rc.putResult("totalPrice", briefShoppingCart.getTotalPrice());
            rc.setViewName("addCartItemOk");
        } catch (StringConvert.ConvertException e) {
            rc.setError(e);
        } catch (ProductNotFoundException e) {
            rc.setError(e);
        } catch (ProductStateException e) {
            rc.setError(e);
        } catch (CartFullException e) {
            rc.setError(e);
        }
        return id;
    }
}
