package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 12-7-11
 * Time: 下午1:59
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface AddressMapper {

    public List<CityInfo> getAllCityInfo();

    public CityInfo getCityInfo(@Param("id") int id);

    public List<String> getProvinceList();

    public List<String> getProvinceCity(@Param("province") String province);

    public List<String> getCityCountry(@Param("province") String province,
                                       @Param("city") String city);

    public List<UserAddress> getUserAddress(@Param("userId") int userId);
}
