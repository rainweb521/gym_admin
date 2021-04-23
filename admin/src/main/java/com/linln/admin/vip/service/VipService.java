package com.linln.admin.vip.service;

import com.linln.admin.vip.domain.Vip;
import com.linln.common.enums.StatusEnum;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
public interface VipService {

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    Page<Vip> getPageList(Example<Vip> example);

    Vip getVipByUserId(Long userid);
    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    Vip getById(Long id);

    /**
     * 保存数据
     * @param vip 实体对象
     */
    Vip save(Vip vip);

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Transactional
    Boolean updateStatus(StatusEnum statusEnum, List<Long> idList);
}