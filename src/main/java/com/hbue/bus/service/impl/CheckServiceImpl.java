package com.hbue.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.bus.dao.CarMapper;
import com.hbue.bus.dao.CheckMapper;
import com.hbue.bus.dao.CustomerMapper;
import com.hbue.bus.dao.RentMapper;
import com.hbue.bus.entity.Car;
import com.hbue.bus.entity.Check;
import com.hbue.bus.entity.Customer;
import com.hbue.bus.entity.Rent;
import com.hbue.bus.service.CheckService;
import com.hbue.bus.vo.CheckVo;
import com.hbue.bus.vo.RentVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.entity.User;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.RandomUtils;
import com.hbue.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckServiceImpl implements CheckService {
    
    
    @Autowired
    private CheckMapper checkMapper;
    
    @Autowired
    private RentMapper rentMapper;
    
    @Autowired
    private CarMapper carMapper;
    
    @Autowired
    private CustomerMapper customerMapper;
    
     @Override
    public Map<String, Object> initCheckFormData(String rentid) {
        Rent rent=rentMapper.selectByPrimaryKey(rentid);
        Customer customer=customerMapper.selectByPrimaryKey(rent.getIdentity());
        Car car=carMapper.selectByPrimaryKey(rent.getCarnumber());
        Check check=new Check();
        check.setCheckid(RandomUtils.createRandomStringUseTime(SysConstant.CAR_ORDER_JC));
        check.setRentid(rentid);
        check.setCheckdate(new Date());
        User user =(User) WebUtils.getHttpSession().getAttribute("user");
        check.setOpername(user.getRealname());
        Map<String,Object> map=new HashMap<>();
        map.put("customer",customer);
        map.put("rent",rent);
        map.put("car",car);
        map.put("check",check);
        return map;
    }

    
    @Override
    public DataGridView queryAllCheck(CheckVo checkVo) {
         //开启分页查询
        Page<Object> page= PageHelper.startPage(checkVo.getPage(),checkVo.getLimit());
        List<Check> data=checkMapper.queryAllCheck(checkVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void deleteCheck(String checkid) {
        checkMapper.deleteByPrimaryKey(checkid);
    }

    @Override
    public void updateCheck(CheckVo checkVo) {
        checkMapper.updateByPrimaryKeySelective(checkVo);
    }

    @Override
    public void deleteBatchCheck(CheckVo checkVo) {
        String[] checkids=checkVo.getCheckids();
        for (String checkid : checkids) {
            deleteCheck(checkid);
        }
    }

    @Override
    public void addCheck(CheckVo checkVo) {
        //添加检查单
        checkMapper.insertSelective(checkVo);
        //更改出租单状态 为已归还
        Rent rent=rentMapper.selectByPrimaryKey(checkVo.getRentid());
        rent.setRentflag(SysConstant.RENT_BACK_TRUE);
        rentMapper.updateByPrimaryKeySelective(rent);
        //更改汽车状态 为未出租
        Car car=carMapper.selectByPrimaryKey(rent.getCarnumber());
        car.setIsrenting(SysConstant.RENT_CAR_FALSE);
        carMapper.updateByPrimaryKeySelective(car);
    }

   
}
