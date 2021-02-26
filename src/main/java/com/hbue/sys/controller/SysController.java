package com.hbue.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转控制器 路由
 */
@Controller
@RequestMapping("sys")
public class SysController {
    /**
     * 跳转菜单管理
     */
    @RequestMapping("toMenuManager")
    public String toMenuManager(){
        return "system/menu/menuManager";
    }

    /**
     * 菜单页面左侧
     * @return
     */
    @RequestMapping("toMenuLeft")
    public String toMenuLeft(){
        return "system/menu/menuLeft";
    }

    /**
     * 菜单页面右侧
     * @return
     */
    @RequestMapping("toMenuRight")
    public String toMenuRight(){
        return "system/menu/menuRight";
    }

    /**
     * 跳转角色管理
     * @return
     */
    @RequestMapping("toRoleManager")
    public String toRoleManager(){
        return "system/role/roleManager";
    }
    
    @RequestMapping("toUserManager")
    public String touUserManager(){
        return "system/user/userManager";
    }

    /**
     * 跳转日志管理
     */
    @RequestMapping("toLogInfoManager")
    public String toLogInfoManager(){
        return "system/logInfo/loginInfoManager";
    }

    /**
     * 跳转公告管理
     * 
     */
    @RequestMapping("toNewsManager")
    public String toNewsManager(){
        return "system/news/newsManager";
    }
}
