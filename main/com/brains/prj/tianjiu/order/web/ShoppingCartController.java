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

import java.util.List;

@Controller
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    CompositeService compositeService;

    public void addItem(RequestContext rc) {
        int addResult = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int itemId = rc.getParameterInt("itemId");
            int itemCount = 0;
            try {
                itemCount = rc.getParameterInt("itemCount");
            } catch (Exception e) {
                itemCount = 1;
            }

            ShoppingCart briefShoppingCart = new ShoppingCart();
            addResult = compositeService.addCartItem(user.getUserId(), itemId, itemCount, briefShoppingCart);

            rc.putResult("itemSum", briefShoppingCart.getItemSum());
            rc.putResult("totalPrice", briefShoppingCart.getTotalPrice());
            rc.setViewName("addCartItemOk");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (ProductNotFoundException e) {
            rc.setError(e);
        } catch (ProductStateException e) {
            rc.setError(e);
        } catch (CartFullException e) {
            rc.setError(e);
        }
    }

    public void delItem(RequestContext rc) {
        int delResult = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = 0;
            int itemId = 0;
            try {
                id = rc.getParameterInt("id");
            } catch (Exception e) {
            }
            try {
                itemId = rc.getParameterInt("itemId");
            } catch (Exception e) {
            }

            delResult = shoppingCartService.delItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = compositeService.getUserCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
    }

    public void incItem(RequestContext rc) {
        int incResult = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = 0;
            int itemId = 0;
            try {
                id = rc.getParameterInt("id");
            } catch (Exception e) {
            }
            try {
                itemId = rc.getParameterInt("itemId");
            } catch (Exception e) {
            }

            incResult = shoppingCartService.incItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = compositeService.getUserCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
    }

    public void decItem(RequestContext rc) {
        int decResult = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = 0;
            int itemId = 0;
            try {
                id = rc.getParameterInt("id");
            } catch (Exception e) {
            }
            try {
                itemId = rc.getParameterInt("itemId");
            } catch (Exception e) {
            }

            decResult = shoppingCartService.decItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = compositeService.getUserCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
    }

    public void setItemCount(RequestContext rc) {
        int decResult = 0;
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = 0;
            int itemId = 0;
            try {
                id = rc.getParameterInt("id");
            } catch (Exception e) {
            }
            try {
                itemId = rc.getParameterInt("itemId");
            } catch (Exception e) {
            }
            int itemCount = rc.getParameterInt("itemCount");

            decResult = shoppingCartService.setItemCount(user.getUserId(), id, itemId, itemCount);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = compositeService.getUserCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
    }

    public void getCartPage(RequestContext rc) {
        rc.setViewName("showCart");
    }

    public void getCart(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();
            user.setUserId(1);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = compositeService.getUserCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (IllegalArgumentException e) {
            rc.setError(e);
        }
    }
}
