package com.hbue.sys.controller;

import com.hbue.sys.constant.SysConstant;
import com.hbue.sys.entity.News;
import com.hbue.sys.entity.User;
import com.hbue.sys.service.NewsService;
import com.hbue.sys.utils.DataGridView;
import com.hbue.sys.utils.ResultObj;
import com.hbue.sys.utils.WebUtils;
import com.hbue.sys.vo.NewsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * 公告管理控制器
 * RestController 所有数据返回都是json
 */
@RestController
@RequestMapping("news")
public class NewsController {

    @Autowired
    private NewsService newsService;


    /**
     * 
     */
    @RequestMapping("loadAllNewsForList")
    public List<News> loadAllNewsForList(NewsVo newsVo){
         return newsService.queryAllNewsForList(newsVo);
    }

    /**
     * 加载公告列表返回DataGridView 进行分页处理
     *
     */
    @RequestMapping("loadAllNews")
    public DataGridView loadAllNews(NewsVo newsVo){
        return newsService.queryAllNews(newsVo);

    }

    /**
     * 添加公告
     * @param newsVo
     * @return
     */
    @RequestMapping("addNews")
    public ResultObj addNews(NewsVo newsVo){
        try{
            newsVo.setCreatetime(new Date());
            User user=(User) WebUtils.getHttpSession().getAttribute("user");
            newsVo.setOpername(user.getRealname());
            newsService.addNews(newsVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }

    /**
     * 修改公告     
     * @param newsVo
     * @return
     */
    @RequestMapping("updateNews")
    public ResultObj updateNews(NewsVo newsVo){
        try{
            newsService.upDateNews(newsVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }

    /**
     * 删除公告
     * @param newsVo
     * @return
     */
    @RequestMapping("deleteNews")
    public ResultObj deleteNews(NewsVo newsVo){
       try{
            newsService.deleteNews(newsVo.getId());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除公告
     * @param newsVo
     * @return
     */
    @RequestMapping("deleteBatchNews")
    public ResultObj deleteBatchNews(NewsVo newsVo){
       try{
            newsService.deleteBatchNews(newsVo.getIds());
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
    
    @RequestMapping("loadNewsById")
    public News loadNewsById(Integer id){
        return newsService.loadNewsById(id);
    }
    
}
