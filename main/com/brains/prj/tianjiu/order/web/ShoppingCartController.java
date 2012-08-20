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
            result.setError(e, null);
        } catch (GoodsNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (CartFullException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
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

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
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

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
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

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (CartItemNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
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

            ShoppingCart cart = shoppingCartService.getUserCart(user.getUserId());
            result.putResult("cart", cart);
            result.putResult("free_delivery_order_fee", Order.FREE_DELIVERY_ORDER_FEE);
            result.setTemplateView("buy/showCartData");
        } catch (BadParameterException e) {
            result.setError(e, null);
        } catch (CartItemNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsNotFoundException e) {
            result.setError(e, null);
        } catch (GoodsStateException e) {
            result.setError(e, null);
        } catch (BuyEvaGoodsException e) {
            result.setError(e, null);
        }
    }

    public void getCartPage(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();

            result.setTemplateView("buy/showCart");
        } catch (IllegalArgumentException e) {
            result.setError(e, null);
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
            result.setError(e, null);
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
            result.setError(e, null);
        }
    }
}
