package com.hbue.bus.dao;


import com.hbue.bus.entity.Rent;
import com.hbue.bus.vo.RentVo;

import java.util.List;

public interface RentMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(Rent record);

    int insertSelective(Rent record);

    Rent selectByPrimaryKey(String rentid);

    int updateByPrimaryKeySelective(Rent record);

    int updateByPrimaryKey(Rent record);

    List<Rent> queryAllRent(RentVo rentVo);
}