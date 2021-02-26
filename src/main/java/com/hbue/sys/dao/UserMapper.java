package com.hbue.sys.dao;

import com.hbue.sys.entity.User;
import com.hbue.sys.vo.UserVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    /**
     * 登录
     *
     */
    User login(User user);

    /**
     * 根据用户id删除角色用户关联表中数据
     * @param userid
     */
    void deleteRoleUserByUid(@Param("uid") Integer userid);

    //查询所有
    List<User> queryAllUser(UserVo userVo);

    /*
    根据用户id和角色id向角色和用户关联表中插入数据
     */
    void insertUserRole(@Param("uid") Integer userid,@Param("rid") Integer rid);
}