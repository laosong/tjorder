package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 上午10:40
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface DeliveryMapper {

    List<DeliveryInfo> getDeliveriesByState(@Param("state") short state);

    DeliveryInfo getDeliveryById(@Param("id") int id);
}
