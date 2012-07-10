package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午6:31
 * To change this template use File | Settings | File Templates.
 */


public class PermissionException extends Exception {

    private SystemUser.UserRole curRole;
    private SystemUser.UserRole needRole;

    public PermissionException(SystemUser.UserRole aRole, SystemUser.UserRole bRole) {
        curRole = aRole;
        needRole = bRole;
    }

    @Override
    public String getMessage() {
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append("curRole=");
        stringBuffer.append(curRole);
        stringBuffer.append(", needRole=");
        stringBuffer.append(needRole);
        return stringBuffer.toString();
    }
}
