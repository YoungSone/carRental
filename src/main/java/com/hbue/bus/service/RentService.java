package com.hbue.bus.service;

import com.hbue.bus.entity.Customer;
import com.hbue.bus.entity.Rent;
import com.hbue.bus.vo.RentVo;
import com.hbue.sys.utils.DataGridView;

import java.util.Map;

public interface RentService {

    /**
     * 判断顾客是否存在
     * @param rentVo
     * @return
     */
    Customer checkCustomerExist(RentVo rentVo);

    /**
     * 保存出租单信息
     *
     * @param rentVo
     */
    void addRent(RentVo rentVo);

    /**
     * 分页查询所有单据
     * @param rentVo
     * @return
     */
    DataGridView queryAllRent(RentVo rentVo);

    void updateRent(RentVo rentVo);

    void deleteRent(String rentid);

    /**
     * 判断单号是否存在
     * @param rentid
     * @return
     */
    Rent checkRentExist(String rentid);
    
    Rent queryRentByRentId(String rentid);
}
