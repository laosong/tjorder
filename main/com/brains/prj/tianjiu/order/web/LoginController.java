package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午7:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.SystemUser;
import com.brains.prj.tianjiu.order.mvc.RequestContext;
import com.brains.prj.tianjiu.order.mvc.ResultContext;
import com.brains.prj.tianjiu.order.domain.*;
import com.brains.prj.tianjiu.order.service.*;

@Controller
public class LoginController {

    public static final String DEFAULT_REDIRECT = "/";

    @Autowired
    GoodsService goodsService;

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void getPageTopData(RequestContext rc, ResultContext result) {
        try {
            com.brains.prj.tianjiu.order.common.SystemUser user = rc.getSystemUser();
            result.putResult("UserName", user.getUserName());
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getPageNavData(RequestContext rc, ResultContext result) {
        try {
            List<AdItem> searchAds = goodsService.getAdsByAreaCd("search");

            String[] names = {"b1", "b2", "b3", "b4", "b5", "b6", "b7"};
            String shortNames = rc.getParameter("shortNames");
            if (shortNames != null && shortNames.length() > 0) {
                names = org.apache.commons.lang.StringUtils.split(shortNames, '|');
            }
            List<Category> topCategories = new LinkedList<Category>();

            for (String name : names) {
                Category category = goodsService.getCategoryByShortName(name);
                category.setSubCategories(goodsService.getSubCategories(category));
                topCategories.add(category);
            }

            result.putResult("searchAds", searchAds);
            result.putResult("topCategories", topCategories);

        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }

    public void getHelp(RequestContext rc, ResultContext result) {
        try {
            String topic = rc.getParameter("topic");
            result.setTemplateView(topic);
        } catch (IllegalArgumentException e) {
            result.setError(e, null, null);
        }
    }
}
