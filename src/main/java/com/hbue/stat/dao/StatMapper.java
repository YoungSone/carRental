package com.hbue.stat.dao;

import com.hbue.stat.entity.BaseEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StatMapper {

    /**
     * 查询客户地区的数据
     */
    List<BaseEntity> queryCustomerAreaStat();

    List<BaseEntity> queryopernameYearGradeStat(@Param("year") String year);

    List<Double> querycompanyYearGradeStat(String year);
}
