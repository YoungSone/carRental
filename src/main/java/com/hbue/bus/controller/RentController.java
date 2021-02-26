package com.hbue.bus.controller;

import com.hbue.bus.entity.Customer;
import com.hbue.bus.entity.Rent;
import com.hbue.bus.service.RentService;
import com.hbue.bus.vo.RentVo;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.entity.User;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.RandomUtils;
import com.hbue.sys.utils.ResultObj;
import com.hbue.sys.utils.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;


@RestController
@RequestMapping("rent")
public class RentController {
    
    @Autowired
    private RentService rentService;
    
    
   @RequestMapping("checkCustomerExist")
    public ResultObj checkCustomerExist(RentVo rentVo){
      Customer customer= rentService.checkCustomerExist(rentVo);
      if (null!=customer){
          return ResultObj.STATUS_TRUE;
      }else {
          return ResultObj.STATUS_FALSE;
      }
   }
   
     @RequestMapping("initRentForm")
    public RentVo initRentForm(RentVo rentVo){
      //生成出租单号
      rentVo.setRentid(RandomUtils.createRandomStringUseTime(SysConstant.CAR_ORDER_CZ));
      rentVo.setBegindate(new Date());
      User user=(User) WebUtils.getHttpSession().getAttribute("user");
      rentVo.setOpername(user.getRealname());
      return rentVo;
   }
   
   @RequestMapping("saveRent")
    public ResultObj saveRent(RentVo rentVo){
       try {
           rentVo.setCreatetime(new Date());
           rentVo.setRentflag(SysConstant.RENT_BACK_FALSE);
           rentService.addRent(rentVo);
           return ResultObj.ADD_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.ADD_ERROR;
       }
   }
   
   @RequestMapping("loadAllRent")
    public DataGridView loadAllRent(RentVo rentVo){
       return rentService.queryAllRent(rentVo);
   }
   
   @RequestMapping("updateRent")
    public ResultObj updateRent(RentVo rentVo){
         try {
           rentVo.setCreatetime(new Date());
           rentService.updateRent(rentVo);
           return ResultObj.ADD_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.ADD_ERROR;
       }
   }
   
   @RequestMapping("deleteRent")
    public ResultObj deleteRent(RentVo rentVo){
         try {
           rentService.deleteRent(rentVo.getRentid());
           return ResultObj.ADD_SUCCESS;
       }catch (Exception e){
           e.printStackTrace();
           return ResultObj.ADD_ERROR;
       }
   }
   

   
   
}
