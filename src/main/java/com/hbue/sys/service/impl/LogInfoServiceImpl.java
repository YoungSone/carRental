package com.hbue.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.dao.LogInfoMapper;
import com.hbue.sys.dao.MenuMapper;
import com.hbue.sys.dao.RoleMapper;
import com.hbue.sys.entity.LogInfo;
import com.hbue.sys.entity.Menu;
import com.hbue.sys.entity.Role;
import com.hbue.sys.service.LogInfoService;
import com.hbue.sys.service.RoleService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.TreeNode;
import com.hbue.sys.vo.LogInfoVo;
import com.hbue.sys.vo.MenuVo;
import com.hbue.sys.vo.RoleVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LogInfoServiceImpl implements LogInfoService {

    @Autowired
    private LogInfoMapper logInfoMapper;
    


    @Override
    public List<LogInfo> queryAllLogInfoForList(LogInfoVo logInfoVo) {
        return logInfoMapper.queryAllLogInfo(logInfoVo);
    }
    

    @Override
    public DataGridView queryAllLogInfo(LogInfoVo logInfoVo) {
        Page<Object> page= PageHelper.startPage(logInfoVo.getPage(),logInfoVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<LogInfo> data = logInfoMapper.queryAllLogInfo(logInfoVo);
        return new DataGridView(page.getTotal(),data);
    }
    

   

    @Override
    public void deleteLogInfo(Integer id) {
        //删除菜单表的数据
        //根据菜单id删除sys_role_Role里面的数据
        logInfoMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public void deleteBatchLogInfo(Integer[] ids) {
        for (Integer id : ids) {
            deleteLogInfo(id);
        }
    }

    @Override
    public void addLogInfo(LogInfo logInfo) {
        logInfoMapper.insertSelective(logInfo);
    }


}
