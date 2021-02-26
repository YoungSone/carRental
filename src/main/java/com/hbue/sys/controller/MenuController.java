package com.hbue.sys.controller;

import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.entity.Menu;
import com.hbue.sys.entity.User;
import com.hbue.sys.service.MenuService;
import com.hbue.sys.utils.*;
import com.hbue.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

/**
 * 菜单管理控制器
 * RestController 所有数据返回都是json
 */
@RestController
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    /**
     * 加载左侧菜单树
     * @param menuVo
     * @return
     */
    @RequestMapping("loadIndexLeftMenuJson")
    public List<TreeNode> loadIndexLeftMenuJson(MenuVo menuVo){
        //得到当前登录的用户对象
        User user=(User) WebUtils.getHttpSession().getAttribute("user");
        List<Menu> list=null;
        menuVo.setAvailable(SysConstant.AVAILABLE_TRUE);//只查询可用的
        //判断用户类型 获取对应的菜单
        if (user.getType()==SysConstant.USER_TYPE_SUPER){
            list=menuService.queryAllMenuForList(menuVo);
        }else {
            list=menuService.queryMenuByUserIdForList(menuVo,user.getUserid());
        }
        List<TreeNode> nodes=new ArrayList<>();
        //把list里面的数据放到nodes
        for (Menu menu : list) {
             Integer id=menu.getId();
             Integer pid=menu.getPid();
             String title=menu.getTitle();
             String href=menu.getHref();
             Boolean spread=(menu.getSpread()==SysConstant.SPREAD_TRUE?true:false);
             String target=menu.getTarget();
             String icon=menu.getIcon();
             nodes.add(new TreeNode(id,pid,title,href,spread,target,icon));
        }
        return TreeNodeBuilder.buildTreeNodes(nodes, 1);


    }

    /**
     * 加载菜单管理左边的菜单树
     * 使用dtree json格式应该返回一个对象
     */
    @RequestMapping("loadMenuManagerLeftTreeJson")
    public DataGridView loadMenuManagerLeftTreeJson(MenuVo menuVo){
        ModelAndView modelAndView=new ModelAndView();
        menuVo.setAvailable(SysConstant.AVAILABLE_TRUE);
        List<Menu> list=menuService.queryAllMenuForList(menuVo);
        List<TreeNode> nodes=new ArrayList<>();
        //把list里面的数据放到nodes
        for (Menu menu : list) {
             Integer id=menu.getId();
             Integer pid=menu.getPid();
             String title=menu.getTitle();
             String href=menu.getHref();
             Boolean spread=(menu.getSpread()==SysConstant.SPREAD_TRUE?true:false);
             String target=menu.getTarget();
             String icon=menu.getIcon();
             nodes.add(new TreeNode(id,pid,title,href,spread,target,icon));
        }
        return new DataGridView(nodes);
    }

    /**
     * 加载菜单列表返回DataGridView
     *
     */
    @RequestMapping("loadAllMenu")
    public DataGridView loadAllMenu(MenuVo menuVo){
        return menuService.queryAllMenu(menuVo);

    }

    /**
     * 添加菜单
     * @param menuVo
     * @return
     */
    @RequestMapping("addMenu")
    public ResultObj addMenu(MenuVo menuVo){
        try{
            this.menuService.addMenu(menuVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改菜单     
     * @param menuVo
     * @return
     */
    @RequestMapping("updateMenu")
    public ResultObj updateMenu(MenuVo menuVo){
        try{
            menuService.upDateMenu(menuVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    
    @RequestMapping("checkMenuHasChildren")
    public ResultObj checkMenuHasChildren(MenuVo menuVo){
        //根据pid查询菜单数量
        Integer count=menuService.queryMenuByPid(menuVo.getId());
        if (count>0){
             return ResultObj.STATUS_TRUE;
        }else {
             return ResultObj.STATUS_FALSE;
        }
    }
    
    @RequestMapping("deleteMenu")
    public ResultObj deleteMenu(MenuVo menuVo){
       try{
            menuService.deleteMenu(menuVo);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
