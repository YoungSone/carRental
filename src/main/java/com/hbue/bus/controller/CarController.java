package com.hbue.bus.controller;

import com.hbue.bus.entity.Car;
import com.hbue.bus.service.CarService;
import com.hbue.bus.vo.CarVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.utils.AppFileUtils;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * 汽车管理控制器
 * RestController 所有数据返回都是json
 */
@RestController
@RequestMapping("car")
public class CarController {

    @Autowired
    private CarService carService;


    /**
     * 
     */
    @RequestMapping("loadAllCarForList")
    public List<Car> loadAllCarForList(CarVo carVo){
         return carService.queryAllCarForList(carVo);
    }

    /**
     * 加载汽车列表返回DataGridView 进行分页处理
     *
     */
    @RequestMapping("loadAllCar")
    public DataGridView loadAllCar(CarVo carVo){
        return carService.queryAllCar(carVo);

    }

    /**
     * 添加汽车
     * @param carVo
     * @return
     */
    @RequestMapping("addCar")
    public ResultObj addCar(CarVo carVo){
        try{
            carVo.setCreatetime(new Date());
            if (!carVo.getCarimg().equals(SysConstant.DEFAULT_CAR_IMG)){
                 carVo.setCarimg(AppFileUtils.updateFileName(carVo.getCarimg(), SysConstant.FILE_UPLOAD_TEMP));
            }
            carService.addCar(carVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改汽车     
     * @param carVo
     * @return
     */
    @RequestMapping("updateCar")
    public ResultObj updateCar(CarVo carVo){
        try{
            String carimg = carVo.getCarimg();
            if (carimg.endsWith(SysConstant.FILE_UPLOAD_TEMP)) {
                String filePath =AppFileUtils.updateFileName(carVo.getCarimg(), SysConstant.FILE_UPLOAD_TEMP);
                carVo.setCarimg(filePath);
                //把原来的删除
                Car car = this.carService.queryCarByCarNumber(carVo.getCarnumber());
                AppFileUtils.removeFileByPath(car.getCarimg());

            }
            carService.upDateCar(carVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除汽车
     * @param carVo
     * @return
     */
    @RequestMapping("deleteCar")
    public ResultObj deleteCar(CarVo carVo){
       try{
            carService.deleteCar(carVo.getCarnumber());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除汽车
     * @param carVo
     * @return
     */
    @RequestMapping("deleteBatchCar")
    public ResultObj deleteBatchCar(CarVo carVo){
       try{
            carService.deleteBatchCar(carVo.getCarnumbers());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    
    
}
