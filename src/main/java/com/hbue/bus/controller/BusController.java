package com.hbue.bus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转控制器 路由
 */
@Controller
@RequestMapping("bus")
public class BusController {
    /**
     * 跳转顾客管理
     */
    @RequestMapping("toCustomerManager")
    public String toMenuManager(){
        return "business/customer/customerManager";
    }

    /**
     * 跳转汽车管理
     * 
     */
    @RequestMapping("toCarManager")
    public String toCarManager(){
        return "business/car/carManager";
    }

    /**
     * 跳转汽车出租管理
     */
    
    @RequestMapping("toRentCarManager")
     public String toRentCarManager(){
        return "business/rent/rentCarManager";
    }

    /**
     * 跳转出租单管理
     * @return
     */
     @RequestMapping("toRentManager")
     public String toRentManager(){
        return "business/rent/rentManager";
    }

    /**
     * 跳转汽车入库管理
     */
    @RequestMapping("toCheckCarManager")
    public String toCheckCarManager(){
        return "business/check/checkCarManager";
    }
    
     /**
     * 跳转检查单管理
     */
    @RequestMapping("toCheckManager")
    public String toCheckManager(){
        return "business/check/checkManager";
    }
    

}
