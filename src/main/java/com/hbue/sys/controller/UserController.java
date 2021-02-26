package com.hbue.sys.controller;

import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.service.UserService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.ResultObj;
import com.hbue.sys.vo.RoleVo;
import com.hbue.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 用户管理控制器
 * RestController 所有数据返回都是json
 */
@RestController
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;
    

    /**
     * 加载用户列表返回DataGridView 进行分页处理
     *
     */
    @RequestMapping("loadAllUser")
    public DataGridView loadAllUser(UserVo userVo){
        return userService.queryAllUser(userVo);

    }

    /**
     * 添加用户
     * @param userVo
     * @return
     */
    @RequestMapping("addUser")
    public ResultObj addUser(UserVo userVo){
        try{
            userService.addUser(userVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改用户    
     * @param userVo
     * @return
     */
    @RequestMapping("updateUser")
    public ResultObj updateUser(UserVo userVo){
        try{
            userService.upDateUser(userVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除用户
     * @param userVo
     * @return
     */
    @RequestMapping("deleteUser")
    public ResultObj deleteUser(UserVo userVo){
       try{
            userService.deleteUser(userVo.getUserid());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除用户
     * @param userVo
     * @return
     */
    @RequestMapping("deleteBatchUser")
    public ResultObj deleteBatchUser(UserVo userVo){
       try{
            userService.deleteBatchUser(userVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DISPATCH_ERROR;
        }
    }
    
    @RequestMapping("resetUserPwd")
    public ResultObj resetUserPwd(UserVo userVo){
       try{
            userService.resetUserPwd(userVo.getUserid());
            return ResultObj.RESET_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.RESET_ERROR;
        }
    }

    

    /**
     * 加载用户管理分配角色
     */
    @RequestMapping("initUserRole")
    public DataGridView initUserRole(UserVo userVo){
        return userService.queryUserRole(userVo.getUserid());
    }

    /**
     * 保存更改后用户角色信息
     */
    @RequestMapping("saveUserRole")
     public ResultObj saveUserRole(UserVo userVo){
        try {
            userService.saveUserRole(userVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }
    
}
