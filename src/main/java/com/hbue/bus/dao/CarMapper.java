package com.hbue.bus.dao;


import com.hbue.bus.entity.Car;
import com.hbue.bus.entity.Customer;

import java.util.List;

public interface CarMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(String carnumber);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);
    
      /**
     * 查询所有公告//匹配模糊查询
     */
    List<Car> queryAllCar(Car cae);
}