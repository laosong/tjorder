package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 13-4-13
 * Time: 下午3:09
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface AdMapper {

    public List<AdItem> getAdsByAreaCd(@Param("areaCd") String areaCd);
}
