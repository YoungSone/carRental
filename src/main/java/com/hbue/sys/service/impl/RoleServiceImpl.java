package com.hbue.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.dao.MenuMapper;
import com.hbue.sys.dao.RoleMapper;
import com.hbue.sys.entity.Menu;
import com.hbue.sys.entity.Role;
import com.hbue.sys.service.RoleService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.TreeNode;
import com.hbue.sys.vo.MenuVo;
import com.hbue.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleMapper roleMapper;
    
    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<Role> queryAllRoleForList(RoleVo roleVo) {
        return roleMapper.queryAllRole(roleVo);
    }

    @Override
    public List<Role> queryRoleByUserIdForList(RoleVo roleVo, Integer userId) {
        //后期权限管理完成之后修改
        return roleMapper.queryAllRole(roleVo);
    }

    @Override
    public DataGridView queryAllRole(RoleVo roleVo) {
        Page<Object> page= PageHelper.startPage(roleVo.getPage(),roleVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<Role> data = roleMapper.queryAllRole(roleVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addRole(RoleVo roleVo) {
        roleMapper.insertSelective(roleVo);
    }

    @Override
    public void upDateRole(RoleVo roleVo) {
        roleMapper.updateByPrimaryKeySelective(roleVo);
    }

   

    @Override
    public void deleteRole(Integer id) {
        //删除菜单表的数据
        //根据菜单id删除sys_role_Role里面的数据
        roleMapper.deleteByPrimaryKey(id);
        roleMapper.deleteRoleMenuByRid(id);
        roleMapper.deleteRoleUserByRid(id);
    }
    
    @Override
    public void deleteBatchRole(Integer[] ids) {
        for (Integer id : ids) {
            deleteRole(id);
        }
    }

    @Override
    public DataGridView initRoleMenuTreeJson(Integer roleid,Integer available) {
        //查询所有菜单
        MenuVo menuVo=new MenuVo();
        menuVo.setAvailable(SysConstant.CODE_ONE);
        List<Menu> menus1 = menuMapper.queryAllMenu(menuVo);
        //根据角色id查询当前角色所有菜单
        List<Menu> menus2 = menuMapper.queryMenuByRid(roleid, SysConstant.AVAILABLE_TRUE);
        List<TreeNode> data=new ArrayList<>();
        for (Menu m1 : menus1) {
            Integer checkAttr=SysConstant.CODE_ZERO;
            for (Menu m2 : menus2) {
                if (m1.getId()==m2.getId()){
                        checkAttr=SysConstant.CODE_ONE;       
                }
            }
             data.add(new TreeNode(m1.getId(),m1.getPid(),m1.getTitle(),m1.getSpread()==1?true:false,checkAttr+""));
        
        }
        
        return new DataGridView(data);
        
    }

    @Override
    public void saveRoleMenu(RoleVo roleVo) {
        roleMapper.deleteRoleMenuByRid(roleVo.getRoleid());
        Integer[] ids=roleVo.getIds();
        for (Integer mid : ids) {
            roleMapper.insertRoleMenu(roleVo.getRoleid(),mid);
            
        }
        
    }


}
