package com.hbue.sys.service;

import com.hbue.sys.entity.Role;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.RoleVo;

import java.util.List;

/**
 * 角色管理的服务接口
 */
public interface RoleService {


    /**
     * 查询所有角色
     */
    public List<Role> queryAllRoleForList(RoleVo roleVo);

    /**
     * 根据用户id查询可用角色
     */
    public List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId);

    /**
     * 分页查询所有角色
     */
    public DataGridView queryAllRole(RoleVo roleVo);

    /**
     * 添加角色
     * @param roleVo
     */
    void addRole(RoleVo roleVo);

    /**
     * 修改角色
     * @param roleVo
     */
    void upDateRole(RoleVo roleVo);



    /**
     * 删除角色
     * @param id
     */
    void deleteRole(Integer id);

    /**
     * 批量删除角色
     */
    void deleteBatchRole(Integer[] ids);

    /**
     * 加载当前角色菜单复选树
     * @param roleid
     */
    DataGridView initRoleMenuTreeJson(Integer roleid,Integer available);

    /**
     * 保存角色菜单
     * @param roleVo
     */
    void saveRoleMenu(RoleVo roleVo);
}
