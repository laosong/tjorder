package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-8-14
 * Time: 下午5:32
 * To change this template use File | Settings | File Templates.
 */

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface GoodsMapper {

    public GoodsItem getGoodsItemById(@Param("id") int id);
}
