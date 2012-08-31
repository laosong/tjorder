package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-5
 * Time: 下午6:27
 * To change this template use File | Settings | File Templates.
 */

public class SystemUser {

    public enum UserRole {
        Anonymous,
        Register,
        Administrator;
    }

    public static String toString(UserRole enumRole) {
        return enumRole.toString();
    }

    public static UserRole fromString(String strRole) {
        UserRole role = UserRole.Anonymous;
        try {
            role = Enum.valueOf(UserRole.class, strRole);
        } catch (Exception e) {
        }
        return role;
    }

    private int userId;
    private String userName;
    private UserRole userRole;

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }
}
