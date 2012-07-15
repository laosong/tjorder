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
            addResult = shoppingCartService.addItem(user.getUserId(), itemId, itemCount, briefShoppingCart);

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
        return addResult;
    }

    public int delItem(RequestContext rc) {
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
            detailShoppingCart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
        return delResult;
    }

    public int incItem(RequestContext rc) {
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
            detailShoppingCart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
        return incResult;
    }

    public int decItem(RequestContext rc) {
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
            detailShoppingCart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
        return decResult;
    }

    public int setItemCount(RequestContext rc) {
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
            detailShoppingCart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (BadParameterException e) {
            rc.setError(e);
        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
        return decResult;
    }

    public void getCartPage(RequestContext rc) {
        rc.setViewName("showCart");
    }

    public void getCart(RequestContext rc) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUseCart(user.getUserId());

            rc.putResult("cart", detailShoppingCart);
            rc.setViewName("showCartData");

        } catch (CartItemNotFoundException e) {
            rc.setError(e);
        }
    }
}
