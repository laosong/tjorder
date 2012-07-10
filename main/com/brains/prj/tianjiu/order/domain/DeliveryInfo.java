package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:25
 * To change this template use File | Settings | File Templates.
 */

import java.io.Serializable;

public class DeliveryInfo implements java.io.Serializable {
    private static final long serialVersionUID = 977941739091611670L;

    private int id;
    /*
    派送方式代码，用于程序中引用
     */
    private String deliverCd;
    private String deliverDesc;
    /*
    手续费。扩展用
     */
    private float fee;
    /*
    1：显示
    0：隐藏，下单时，不显示。
    注：显示已存在订单明细时，不受此标志影响，总显示相应记录
     */
    private short state;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDeliverCd() {
        return deliverCd;
    }

    public void setDeliverCd(String deliverCd) {
        this.deliverCd = deliverCd;
    }

    public String getDeliverDesc() {
        return deliverDesc;
    }

    public void setDeliverDesc(String deliverDesc) {
        this.deliverDesc = deliverDesc;
    }

    public float getFee() {
        return fee;
    }

    public void setFee(float fee) {
        this.fee = fee;
    }

    public short getState() {
        return state;
    }

    public void setState(short state) {
        this.state = state;
    }
}
