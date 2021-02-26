package com.hbue.sys.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.dao.MenuMapper;
import com.hbue.sys.dao.NewsMapper;
import com.hbue.sys.entity.Menu;
import com.hbue.sys.entity.News;
import com.hbue.sys.service.NewsService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.TreeNode;
import com.hbue.sys.vo.MenuVo;
import com.hbue.sys.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    private NewsMapper newsMapper;
    

    @Override
    public List<News> queryAllNewsForList(NewsVo newsVo) {
        return newsMapper.queryAllNews(newsVo);
    }
    

    @Override
    public DataGridView queryAllNews(NewsVo newsVo) {
        Page<Object> page= PageHelper.startPage(newsVo.getPage(),newsVo.getLimit());
        //先拿到数据在进行分页
        // getTotal获取总的记录数
        List<News> data = newsMapper.queryAllNews(newsVo);
        return new DataGridView(page.getTotal(),data);
    }

    @Override
    public void addNews(NewsVo newsVo) {
        newsMapper.insertSelective(newsVo);
    }

    @Override
    public void upDateNews(NewsVo newsVo) {
        newsMapper.updateByPrimaryKeySelective(newsVo);
    }

   

    @Override
    public void deleteNews(Integer id) {
        //删除菜单表的数据
        //根据菜单id删除sys_news_News里面的数据
        newsMapper.deleteByPrimaryKey(id);
    }
    
    @Override
    public void deleteBatchNews(Integer[] ids) {
        for (Integer id : ids) {
            deleteNews(id);
        }
    }

    @Override
    public News loadNewsById(Integer id) {
        return newsMapper.selectByPrimaryKey(id);
    }

}
