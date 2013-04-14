package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-22
 * Time: 下午11:16
 * To change this template use File | Settings | File Templates.
 */

import java.util.Date;

import java.io.Serializable;

public class OrderStatus implements Serializable {
    private static final long serialVersionUID = 8981064159408677677L;

    private int id;
    private int orderId;

    public static final short TYPES_Logistic = 99;

    private short types;
    private String operator;
    private String info;
    private Date createTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public short getTypes() {
        return types;
    }

    public void setType(short types) {
        this.types = types;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
