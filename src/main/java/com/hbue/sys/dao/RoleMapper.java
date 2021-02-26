package com.hbue.sys.dao;

import com.hbue.sys.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    /**
     * 查询所有角色
     */
    List<Role> queryAllRole(Role role);
    

    //根据角色id删除角色与菜单关联表中数据
    void deleteRoleMenuByRid(@Param("rid") Integer id);
    
    //根据角色id删除角色与用户关联表中数据
    void deleteRoleUserByRid(@Param("rid") Integer id);

    //根据角色id和菜单id向角色与菜单关联表插入数据
    void insertRoleMenu(@Param("rid") Integer roleid,@Param("mid") Integer mid);
    
    //根据用户id查询该用户所有角色
    List<Role> queryAllRoleByUserId(@Param("uid") Integer userid,@Param("available") Integer available);


}