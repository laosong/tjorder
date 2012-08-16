package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 下午6:50
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.mvc.ResultContext;
import com.brains.prj.tianjiu.order.common.*;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class ShoppingCartController {

    @Autowired
    ShoppingCartService shoppingCartService;

    @Autowired
    GoodsService goodsService;

    public void addItem(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int itemId = rc.getParameterInt("itemId");
            int itemCount = 0;
            try {
                itemCount = rc.getParameterInt("itemCount");
            } catch (Exception e) {
                itemCount = 1;
            }
            shoppingCartService.addItem(user.getUserId(), itemId, itemCount);
        } catch (BadParameterException e) {
            result.setError(e);
        } catch (GoodsNotFoundException e) {
            result.setError(e);
        } catch (GoodsStateException e) {
            result.setError(e);
        } catch (CartFullException e) {
            result.setError(e);
        } catch (EvaGoodsBuyCountException e) {
            result.setError(e);
        } catch (EvaGoodsAlreadyBuyException e) {
            result.setError(e);
        }
    }

    public void delItem(RequestContext rc, ResultContext result) {
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

            shoppingCartService.delItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUserCart(user.getUserId());

            result.putResult("cart", detailShoppingCart);
            result.setViewName("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e);
        }
    }

    public void incItem(RequestContext rc, ResultContext result) {
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

            shoppingCartService.incItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUserCart(user.getUserId());

            result.putResult("cart", detailShoppingCart);
            result.setViewName("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e);
        }
    }

    public void decItem(RequestContext rc, ResultContext result) {
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

            shoppingCartService.decItem(user.getUserId(), id, itemId);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUserCart(user.getUserId());

            result.putResult("cart", detailShoppingCart);
            result.setViewName("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e);
        }
    }

    public void setItemCount(RequestContext rc, ResultContext result) {
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

            shoppingCartService.setItemCount(user.getUserId(), id, itemId, itemCount);

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUserCart(user.getUserId());

            result.putResult("cart", detailShoppingCart);
            result.setViewName("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e);
        } catch (CartItemNotFoundException e) {
            result.setError(e);
        }
    }

    public void getCartPage(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            result.setViewName("buy/showCart");
        } catch (IllegalArgumentException e) {
            result.setError(e);
        }
    }

    public void getCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            ShoppingCart detailShoppingCart = null;
            detailShoppingCart = shoppingCartService.getUserCart(user.getUserId());

            result.putResult("cart", detailShoppingCart);
            result.setViewName("buy/showCartData");
        } catch (IllegalArgumentException e) {
            result.setError(e);
        }
    }
}
