package com.hbue.sys.service;

import com.hbue.sys.entity.News;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.vo.NewsVo;

import java.util.List;

/**
 * 公告管理的服务接口
 */
public interface NewsService {


    /**
     * 查询所有公告非分页
     */
    public List<News> queryAllNewsForList(NewsVo newsVo);

    

    /**
     * 分页查询所有公告
     */
    public DataGridView queryAllNews(NewsVo newsVo);

    /**
     * 添加公告
     * @param newsVo
     */
    void addNews(NewsVo newsVo);

    /**
     * 修改公告
     * @param newsVo
     */
    void upDateNews(NewsVo newsVo);



    /**
     * 删除公告
     * @param id
     */
    void deleteNews(Integer id);

    /**
     * 批量删除公告
     */
    void deleteBatchNews(Integer[] ids);


    /**
     * 通过id查询公告
     * @param id
     * @return
     */
    News loadNewsById(Integer id);
}
