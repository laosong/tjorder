package com.brains.prj.tianjiu.order.common;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-20
 * Time: 下午4:32
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

public class TotalList<T> {
    private int total;
    public List<T> list;

    public TotalList(int total, List<T> list) {
        this.total = total;
        this.list = list;
    }

    public int getTotal() {
        return total;
    }

    public List<T> getList() {
        return list;
    }
}
