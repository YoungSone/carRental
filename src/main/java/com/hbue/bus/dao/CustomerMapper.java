package com.hbue.bus.dao;

import com.hbue.bus.entity.Customer;
import com.hbue.sys.entity.News;

import java.util.List;

public interface CustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(String identity);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);
    
       /**
     * 查询所有顾客//匹配模糊查询
     */
    List<Customer> queryAllCustomer(Customer customer);
}