package com.hbue.sys.service;


import com.hbue.sys.entity.User;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.RoleVo;
import com.hbue.sys.vo.UserVo;

import java.util.List;


/**
 * 用户服务接口
 */

public interface UserService {

    User login(UserVo userVo);
    
    

    /**
     * 分页查询所有用户
     */
    public DataGridView queryAllUser(UserVo userVo);

    /**
     * 添加用户
     * @param userVo
     */
    public void addUser(UserVo userVo);

    /**
     * 修改用户
     * @param userVo
     */
    public void upDateUser(UserVo userVo);
    
    /**
     * 删除用户
     * @param userid
     */
    public void deleteUser(Integer userid);

    /**
     * 批量删除用户
     */
    public void deleteBatchUser(Integer[] ids);
    
    /**
     * 重置用户密码
     * @param userid
     */
    public void resetUserPwd(Integer userid);

    /**
     * 加载用户角色数据
     * @param userid
     * @return
     */
    DataGridView queryUserRole(Integer userid);

    /**
     * 保存更改后用户角色数据
     * @param userVo
     */
    void saveUserRole(UserVo userVo);
}
