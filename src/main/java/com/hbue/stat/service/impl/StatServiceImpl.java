package com.hbue.stat.service.impl;

import com.hbue.stat.dao.StatMapper;
import com.hbue.stat.entity.BaseEntity;
import com.hbue.stat.service.StatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StatServiceImpl implements StatService {

    @Autowired
    private StatMapper statMapper;
    
    @Override
    public List<BaseEntity> loadCustomerAreaStatList() {
        return statMapper.queryCustomerAreaStat();
    }

    @Override
    public List<BaseEntity> loadOpernameYearGradeStatJson(String year) {
        return statMapper.queryopernameYearGradeStat(year);
    }

    @Override
    public List<Double> loadCompanyYearGradeStatJson(String year) {
        return statMapper.querycompanyYearGradeStat(year);
    }
}
