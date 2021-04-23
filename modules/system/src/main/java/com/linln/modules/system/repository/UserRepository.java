package com.linln.modules.system.repository;

import com.linln.modules.system.domain.Dept;
import com.linln.modules.system.domain.User;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22
 */
public interface UserRepository extends BaseRepository<User, Long>, JpaSpecificationExecutor<User> {

    /**
     * 根据用户名查询用户数据
     * @param username 用户名
     * @return 用户数据
     */
    public User findByUsername(String username);

    /**
     * 根据用户名查询用户数据,且排查指定ID的用户
     * @param username 用户名
     * @param id 排除的用户ID
     * @return 用户数据
     */
    public User findByUsernameAndIdNot(String username, Long id);

    /**
     * 查找多个相应部门的用户列表
     * @param dept 部门对象
     * @return 用户列表
     */
    public List<User> findByDept(Dept dept);

    /**
     * 删除多条数据
     * @param ids ID列表
     * @return 影响行数
     */
    public Integer deleteByIdIn(List<Long> ids);

//    @Query("SELECT u FROM User u WHERE u.create_date LIKE CONCAT('%',:create_date,'%')")
//    List<User> findByCreateDateLike(@Param("create_date") String create_date);
}
