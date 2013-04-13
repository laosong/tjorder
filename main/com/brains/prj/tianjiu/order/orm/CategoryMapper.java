package com.brains.prj.tianjiu.order.orm;

/**
 * Created with IntelliJ IDEA.
 * User: songchunwen
 * Date: 13-4-13
 * Time: 下午3:33
 * To change this template use File | Settings | File Templates.
 */

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.brains.prj.tianjiu.order.domain.*;

public interface CategoryMapper {

    List<Category> getAllCategories();

    List<Category> getCategoriesByShortName(@Param("shortName") String shortName);
}
