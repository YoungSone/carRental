package com.hbue.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.sys.dao.MenuMapper;
import com.hbue.sys.entity.Menu;
import com.hbue.sys.service.MenuService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.MenuVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Menu> queryAllMenuForList(MenuVo menuVo) {
        return menuMapper.queryAllMenu(menuVo);
    }

    @Override
    public List<Menu> queryMenuByUserIdForList(MenuVo menuVo, Integer userId) {
        //后期权限管理完成之后修改
        return menuMapper.queryAllMenuByUid(menuVo.getAvailable(),userId);
    }

    @Override
    public DataGridView queryAllMenu(MenuVo menuVo) {
        Page<Object> page= PageHelper.startPage(menuVo.getPage(),menuVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<Menu> data = menuMapper.queryAllMenu(menuVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addMenu(MenuVo menuVo) {
        menuMapper.insertSelective(menuVo);
    }

    @Override
    public void upDateMenu(MenuVo menuVo) {
        menuMapper.updateByPrimaryKeySelective(menuVo);
    }

    @Override
    public Integer queryMenuByPid(Integer id) {
        return menuMapper.queryMenuByPid(id);
    }

    @Override
    public void deleteMenu(MenuVo menuVo) {
        //删除菜单表的数据
        //根据菜单id删除sys_role_menu里面的数据
        menuMapper.deleteByPrimaryKey(menuVo.getId());
        menuMapper.deleteRoleMenuByMid(menuVo.getId()); 
    }


}
