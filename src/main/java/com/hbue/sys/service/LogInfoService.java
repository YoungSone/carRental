package com.hbue.sys.service;

import com.hbue.sys.entity.LogInfo;
import com.hbue.sys.entity.Role;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.LogInfoVo;
import com.hbue.sys.vo.RoleVo;

import java.util.List;

/**
 * 日志管理的服务接口
 */
public interface LogInfoService {


    /**
     * 查询所有日志
     */
    public List<LogInfo> queryAllLogInfoForList(LogInfoVo logInfoVo);

 
    /**
     * 分页查询所有日志
     */
    public DataGridView queryAllLogInfo(LogInfoVo logInfoVo);

    

    /**
     * 删除日志
     * @param id
     */
    void deleteLogInfo(Integer id);

    /**
     * 批量删除角色
     */
    void deleteBatchLogInfo(Integer[] ids);

    void addLogInfo(LogInfo logInfo);
   
}
