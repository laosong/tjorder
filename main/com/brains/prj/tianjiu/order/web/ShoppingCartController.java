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

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/addCartItemOk");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/addCartItemEr");
        } catch (BadBuyCountException e) {
            result.setError(e, "badBuyCountException", "buy/addCartItemEr");
        } catch (GoodsNotFoundException e) {
            result.setError(e, "goodsNotFoundException", "buy/addCartItemEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/addCartItemEr");
        } catch (CartFullException e) {
            result.setError(e, "cartFullException", "buy/addCartItemEr");
        } catch (EvaGoodsBuyException e) {
            result.setError(e, "evaGoodsBuyException", "buy/addCartItemEr");
        } catch (EvaGoodBuyCountException e) {
            result.setError(e, "evaGoodBuyCountException", "buy/addCartItemEr");
        }
    }

    public void delItem(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = rc.getParameterInt("id");
            int itemId = rc.getParameterInt("itemId");

            shoppingCartService.delItem(user.getUserId(), id, itemId);

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/delCartItemEr");
        } catch (GoodsNotFoundException e) {
            result.setError(e, "goodsNotFoundException", "buy/delCartItemEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/delCartItemEr");
        } catch (CartItemNotFoundException e) {
            result.setError(e, "cartItemNotFoundException", "buy/delCartItemEr");
        }
    }

    public void incItem(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = rc.getParameterInt("id");
            int itemId = rc.getParameterInt("itemId");

            shoppingCartService.incItem(user.getUserId(), id, itemId);

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/incCartItemEr");
        } catch (GoodsNotFoundException e) {
            result.setError(e, "goodsNotFoundException", "buy/incCartItemEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/incCartItemEr");
        } catch (EvaGoodBuyCountException e) {
            result.setError(e, "evaGoodBuyCountException", "buy/incCartItemEr");
        } catch (CartItemNotFoundException e) {
            result.setError(e, "cartItemNotFoundException", "buy/incCartItemEr");
        }
    }

    public void decItem(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = rc.getParameterInt("id");
            int itemId = rc.getParameterInt("itemId");

            shoppingCartService.decItem(user.getUserId(), id, itemId);

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/decCartItemEr");
        } catch (GoodsNotFoundException e) {
            result.setError(e, "goodsNotFoundException", "buy/decCartItemEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/decCartItemEr");
        } catch (CartItemNotFoundException e) {
            result.setError(e, "cartItemNotFoundException", "buy/decCartItemEr");
        }
    }

    public void setItemCount(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            int id = rc.getParameterInt("id");
            int itemId = rc.getParameterInt("itemId");
            int itemCount = rc.getParameterInt("itemCount");

            shoppingCartService.setItemCount(user.getUserId(), id, itemId, itemCount);

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e, "badParameterException", "buy/setCartItemCountEr");
        } catch (BadBuyCountException e) {
            result.setError(e, "badBuyCountException", "buy/setCartItemCountEr");
        } catch (GoodsNotFoundException e) {
            result.setError(e, "goodsNotFoundException", "buy/setCartItemCountEr");
        } catch (GoodsStateException e) {
            result.setError(e, "goodsStateException", "buy/setCartItemCountEr");
        } catch (EvaGoodBuyCountException e) {
            result.setError(e, "evaGoodBuyCountException", "buy/setCartItemCountEr");
        } catch (CartItemNotFoundException e) {
            result.setError(e, "cartItemNotFoundException", "buy/setCartItemCountEr");
        }
    }

    public void getCartPage(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            result.setTemplateView("buy/showCart");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getMiniCart(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();
            if (user.getUserId() > 0) {
                ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
                result.putResult("cart", cart);
            }
            result.setTemplateView("buy/miniCart");
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }
}
