package com.hbue.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.dao.RoleMapper;
import com.hbue.sys.dao.UserMapper;
import com.hbue.sys.entity.Role;
import com.hbue.sys.entity.User;
import com.hbue.sys.service.UserService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.Md5Util;
import com.hbue.sys.vo.RoleVo;
import com.hbue.sys.vo.UserVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
    
    @Autowired
    private RoleMapper roleMapper;
    

    @Override
    public User login(UserVo userVo) {
        //密码加密
        userVo.setPwd(Md5Util.encrypt(userVo.getPwd()));
        //System.out.println(userVo.toString());
        return userMapper.login(userVo);
    }

    @Override
    public DataGridView queryAllUser(UserVo userVo) {
         Page<Object> page= PageHelper.startPage(userVo.getPage(),userVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<User> data = userMapper.queryAllUser(userVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addUser(UserVo userVo) {
        userVo.setPwd(Md5Util.encrypt(SysConstant.USER_DEFAULT_PWD));
        userMapper.insertSelective(userVo);
    }

    @Override
    public void upDateUser(UserVo userVo) {
        userMapper.updateByPrimaryKeySelective(userVo);

    }

    @Override
    public void deleteUser(Integer userid) {
        userMapper.deleteByPrimaryKey(userid);
        userMapper.deleteRoleUserByUid(userid);
    }

    @Override
    public void deleteBatchUser(Integer[] ids) {
        for (Integer userid : ids) {
            deleteUser(userid);
        }
    }

    @Override
    public void resetUserPwd(Integer userid) {
        UserVo userVo=new UserVo();
        userVo.setUserid(userid);
        userVo.setPwd(Md5Util.encrypt(SysConstant.USER_DEFAULT_PWD));
        upDateUser(userVo);
    }

    @Override
    public DataGridView queryUserRole(Integer userid) {
        RoleVo roleVo=new RoleVo();
        roleVo.setAvailable(SysConstant.AVAILABLE_TRUE);
        //查询所有的角色数据
        List<Role> roles1 = roleMapper.queryAllRole(roleVo);
        //查询当前用户拥有的角色数据
        List<Role> roles2 = roleMapper.queryAllRoleByUserId(userid, SysConstant.AVAILABLE_TRUE);
        //LAY_CHECKED 为true时表单选中
        List<Map<String,Object>> data=new ArrayList<>();
        for (Role r1 : roles1) {
            Boolean LAY_CHECKED=false;
            for (Role r2 : roles2) {
                if (r1.getRoleid()==r2.getRoleid()){
                    LAY_CHECKED=true;
                }
            }
            Map<String,Object> map=new HashMap<>();
            map.put("roleid",r1.getRoleid());
            map.put("rolename",r1.getRolename());
            map.put("roledesc",r1.getRoledesc());
            map.put("LAY_CHECKED",LAY_CHECKED);
            data.add(map);
        }
        return new DataGridView(data);
    }

    @Override
    public void saveUserRole(UserVo userVo) {
        //删除用户角色数据
        userMapper.deleteRoleUserByUid(userVo.getUserid());
        //添加新的用户角色数据
        Integer[] ids=userVo.getIds();
        for (Integer rid : ids) {
            userMapper.insertUserRole(userVo.getUserid(),rid);
        }
        
    }
}
