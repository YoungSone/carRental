package com.hbue.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.bus.dao.CarMapper;
import com.hbue.bus.dao.CustomerMapper;
import com.hbue.bus.entity.Car;
import com.hbue.bus.entity.Customer;
import com.hbue.bus.entity.Rent;
import com.hbue.bus.service.RentService;
import com.hbue.bus.vo.CarVo;
import com.hbue.bus.vo.RentVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.bus.dao.RentMapper;
import com.hbue.sys.utils.DataGridView;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RentServiceImpl implements RentService {
    
    @Autowired
    private RentMapper rentMapper;
    
    @Autowired
    private CustomerMapper customerMapper;
    
    @Autowired
    private CarMapper carMapper;
    
    @Override
    public Customer checkCustomerExist(RentVo rentVo) {
        return customerMapper.selectByPrimaryKey(rentVo.getIdentity());
    }

    @Override
    public void addRent(RentVo rentVo) {
        rentMapper.insertSelective(rentVo);
        //更改车辆已出租状态
        CarVo carVo=new CarVo();
        carVo.setIsrenting(SysConstant.RENT_CAR_TRUE);
        carVo.setCarnumber(rentVo.getCarnumber());
        carMapper.updateByPrimaryKeySelective(carVo);
    }

    /**
     * 分页查询所有出租单
     * @param rentVo
     * @return
     */
    @Override
    public DataGridView queryAllRent(RentVo rentVo) {
        Page<Object> page=PageHelper.startPage(rentVo.getPage(),rentVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<Rent> data=rentMapper.queryAllRent(rentVo);
        return new DataGridView(page.getTotal(),data);
    }

    /**
     * 更新出租单据
     * @param rentVo
     */
    @Override
    public void updateRent(RentVo rentVo) {
        //更新出租单据
        rentMapper.updateByPrimaryKeySelective(rentVo);
    }

    @Override
    public void deleteRent(String rentid) {
        Rent rent=rentMapper.selectByPrimaryKey(rentid);
        //更新汽车状态
        Car car=new Car();
        car.setCarnumber(rent.getCarnumber());
        car.setIsrenting(SysConstant.RENT_CAR_FALSE);
        carMapper.updateByPrimaryKeySelective(car);
        //删除出租单
        rentMapper.deleteByPrimaryKey(rentid);
    }

    @Override
    public Rent checkRentExist(String rentid) {
        return rentMapper.selectByPrimaryKey(rentid);
    }

    @Override
    public Rent queryRentByRentId(String rentid) {
        return rentMapper.selectByPrimaryKey(rentid);
    }

}
