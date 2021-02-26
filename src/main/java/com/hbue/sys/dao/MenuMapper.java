package com.hbue.sys.dao;

import com.hbue.sys.entity.Menu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    /**
     * 查询所有菜单
     */
    List<Menu> queryAllMenu(Menu menu);

    //查询当前菜单下是否子菜单
    Integer queryMenuByPid(@Param("pid") Integer id);

    //根据菜单id删除菜单与角色关联表中数据
    void deleteRoleMenuByMid(@Param("mid") Integer id);
    //根据角色id查询所有菜单
    List<Menu> queryMenuByRid(@Param("roleid") Integer roleid,@Param("available") Integer available);

    //根据角色id删除菜单与角色关联表中数据
    void deleteRoleMenuByRid(@Param("rid") Integer roleid);

    //根据用户id查询菜单
    List<Menu> queryAllMenuByUid(@Param("available") Integer available,@Param("uid") Integer userId);
}