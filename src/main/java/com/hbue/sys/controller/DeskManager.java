package com.hbue.sys.controller;

/*
工作台的控制器
 */

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("desk")
public class DeskManager {

    /**
     * 跳转工作台页面
     */
    @RequestMapping("toDeskManager")
    public String toDeskManager(){
        return "system/main/deskManager";

    }
}
