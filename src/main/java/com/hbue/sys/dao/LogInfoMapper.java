package com.hbue.sys.dao;

import com.hbue.sys.entity.LogInfo;

import java.util.List;

public interface LogInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LogInfo record);

    int insertSelective(LogInfo record);

    LogInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LogInfo record);

    int updateByPrimaryKey(LogInfo record);
    
    /**
     * 查询所有日志
     */
    List<LogInfo> queryAllLogInfo(LogInfo logInfo);
}