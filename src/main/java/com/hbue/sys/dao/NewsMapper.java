package com.hbue.sys.dao;

import com.hbue.sys.entity.News;

import java.util.List;

public interface NewsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(News record);

    int insertSelective(News record);

    News selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(News record);

    int updateByPrimaryKey(News record);
    
     /**
     * 查询所有公告//匹配模糊查询
     */
    List<News> queryAllNews(News news);
    

   
}