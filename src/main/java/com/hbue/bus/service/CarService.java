package com.hbue.bus.service;


import com.hbue.bus.entity.Car;
import com.hbue.bus.vo.CarVo;
import com.hbue.sys.utils.DataGridView;

import java.util.List;

/**
 * 汽车管理的服务接口
 */
public interface CarService {


    /**
     * 查询所有汽车非分页
     */
    public List<Car> queryAllCarForList(CarVo carVo);

    

    /**
     * 分页查询所有汽车
     */
    public DataGridView queryAllCar(CarVo carVo);

    /**
     * 添加汽车
     * @param carVo
     */
    void addCar(CarVo carVo);

    /**
     * 修改汽车
     * @param carVo
     */
    void upDateCar(CarVo carVo);



    /**
     * 删除汽车
     * @param carnumber
     */
    void deleteCar(String carnumber);

    /**
     * 批量删除汽车
     */
    void deleteBatchCar(String[] carnumbers);


    Car queryCarByCarNumber(String carnumber);
}
