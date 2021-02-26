package com.hbue.bus.controller;

import com.hbue.bus.entity.Rent;
import com.hbue.bus.service.CheckService;
import com.hbue.bus.service.RentService;
import com.hbue.bus.vo.CheckVo;
import com.hbue.bus.vo.RentVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("check")
public class CheckController {
    
    
    @Autowired
    private RentService rentService;
    
    @Autowired
    private CheckService checkService;

    /**
     * 检查出租单号是否存在
     * @param rentid
     * @return
     */
    @RequestMapping("checkRentExist")
    public Rent checkRentExist(String rentid){
       return rentService.checkRentExist(rentid);
    }


    /**
     * 加载检查单数据
     * @param rentid
     * @return
     */
   @RequestMapping("initCheckFormData")
   public Map<String,Object> initCheckFormData(String rentid){
        return checkService.initCheckFormData(rentid);
   }

    /**
     * 保存检查单
     * @param checkVo
     * @return
     */
    @RequestMapping("saveCheck")
    public ResultObj saveCheck(CheckVo checkVo){
        //更改出租单状态变更已还车
        try{
          
            checkService.addCheck(checkVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
            
        }
   }

    /**
     * 加载所有检查的数据
     * @param checkVo
     * @return
     */
   @RequestMapping("loadAllCheck")
    public DataGridView loadAllCheck(CheckVo checkVo){
        return checkService.queryAllCheck(checkVo);
   }
   
    @RequestMapping("updateCheck")
    public ResultObj updateCheck(CheckVo checkVo){
       try {
           checkService.updateCheck(checkVo);
           return ResultObj.UPDATE_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.UPDATE_ERROR;
       }
    }
    
     @RequestMapping("deleteCheck")
    public ResultObj deleteCheck(CheckVo checkVo){
       try {
           checkService.deleteCheck(checkVo.getCheckid());
           return ResultObj.DELETE_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.DELETE_ERROR;
       }
    }
    
    @RequestMapping("deleteBatchCheck")
    public ResultObj deleteBatchCheck(CheckVo checkVo){
       try {
           checkService.deleteBatchCheck(checkVo);
           return ResultObj.DELETE_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.DELETE_ERROR;
       }
    }
}
