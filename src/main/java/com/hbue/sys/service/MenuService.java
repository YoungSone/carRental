package com.hbue.sys.service;

import com.hbue.sys.entity.Menu;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.MenuVo;

import java.util.List;

/**
 * 菜单管理的服务接口
 */
public interface MenuService {


    /**
     * 查询所有菜单
     */
    public List<Menu> queryAllMenuForList(MenuVo menuVo);

    /**
     * 根据用户id查询可用菜单
     */
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo,Integer userId);

    /**
     * 分页查询所有菜单
     */
    public DataGridView queryAllMenu(MenuVo menuVo);

    /**
     * 添加菜单
     * @param menuVo
     */
    void addMenu(MenuVo menuVo);

    /**
     * 修改菜单
     * @param menuVo
     */
    void upDateMenu(MenuVo menuVo);

    /**
     * 根据ID查询是否为父节点
     * @param id
     * @return
     */
    Integer queryMenuByPid(Integer id);

    /**
     * 删除菜单
     * @param menuVo
     */
    void deleteMenu(MenuVo menuVo);
}
