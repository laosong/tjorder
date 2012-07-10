package com.brains.prj.tianjiu.order.domain;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-7
 * Time: 上午10:20
 * To change this template use File | Settings | File Templates.
 */

public class PaymentInfo implements java.io.Serializable {
    private static final long serialVersionUID = 215033065433691650L;

    private int id;
    /*
    支付方式代码，用于程序中引用
     */
    private String payCd;
    private String payDesc;
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

    public String getPayCd() {
        return payCd;
    }

    public void setPayCd(String payCd) {
        this.payCd = payCd;
    }

    public String getPayDesc() {
        return payDesc;
    }

    public void setPayDesc(String payDesc) {
        this.payDesc = payDesc;
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
