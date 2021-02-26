package com.hbue.stat.service;

import com.hbue.stat.entity.BaseEntity;

import java.util.List;

public interface StatService {
    
     /**
     * 查询客户地区数据
     * @return
     */
    List<BaseEntity> loadCustomerAreaStatList();

    List<BaseEntity> loadOpernameYearGradeStatJson(String year);

    List<Double> loadCompanyYearGradeStatJson(String year);
}
