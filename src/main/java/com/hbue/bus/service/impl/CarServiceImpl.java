package com.hbue.bus.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.bus.dao.CarMapper;
import com.hbue.bus.entity.Car;
import com.hbue.bus.service.CarService;
import com.hbue.bus.vo.CarVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.utils.AppFileUtils;
import com.hbue.sys.utils.DataGridView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CarServiceImpl implements CarService {

    @Autowired
    private CarMapper carMapper;
    

    @Override
    public List<Car> queryAllCarForList(CarVo carVo) {
        return carMapper.queryAllCar(carVo);
    }
    

    @Override
    public DataGridView queryAllCar(CarVo carVo) {
        Page<Object> page= PageHelper.startPage(carVo.getPage(),carVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<Car> data = carMapper.queryAllCar(carVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addCar(CarVo carVo) {
        carMapper.insertSelective(carVo);
    }

    @Override
    public void upDateCar(CarVo carVo) {
        carMapper.updateByPrimaryKeySelective(carVo);
    }

   

    @Override
    public void deleteCar(String carnumber) {
         Car car=queryCarByCarNumber(carnumber);
         //判断是否为默认图片 不是删除磁盘图片
         if (!car.getCarimg().equals(SysConstant.DEFAULT_CAR_IMG)){
             AppFileUtils.deleteFileUsePath(car.getCarimg());
         }
        //删除汽车表的数据
        carMapper.deleteByPrimaryKey(carnumber);
    }
    
    @Override
    public void deleteBatchCar(String[] carnumbers) {
        for (String carnumber : carnumbers) {
            deleteCar(carnumber);
        }
    }

    @Override
    public Car queryCarByCarNumber(String carnumber) {
        return carMapper.selectByPrimaryKey(carnumber);
    }


}
