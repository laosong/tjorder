package com.brains.prj.tianjiu.order.web;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午7:54
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import com.brains.prj.tianjiu.order.common.BadParameterException;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;

import com.brains.prj.tianjiu.order.common.SystemUser;
import com.brains.prj.tianjiu.order.mvc.RequestContext;

@Controller
public class LoginController {

    public void login(RequestContext rc) {

        try {
            int userId = rc.getParameterInt("userId");

            SystemUser user = new SystemUser();
            user.setUserId(userId);
            user.setUserName("songchunwen" + userId);
            user.setUserRole(SystemUser.UserRole.Normal);
            rc.setSystemUser(user);

            rc.setViewName("loginOk");
        } catch (BadParameterException e) {
            rc.setError(e);
        }
    }
}
