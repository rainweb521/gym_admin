package com.linln.admin.vip.service.impl;

import com.linln.admin.vip.domain.Vip;
import com.linln.admin.vip.repository.VipRepository;
import com.linln.admin.vip.service.VipService;
import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Service
public class VipServiceImpl implements VipService {

    @Autowired
    private VipRepository vipRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Vip getById(Long id) {
        return vipRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Vip> getPageList(Example<Vip> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return vipRepository.findAll(example, page);
    }

    @Override
    public Vip getVipByUserId(Long userid) {
        Vip vip = new Vip();
        vip.setUserId(userid);
        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("user_id", match -> match.contains());

        // 获取数据列表
        Example<Vip> example = Example.of(vip, matcher);
        Optional<Vip> result = vipRepository.findOne(example);
        return result.isPresent()?result.get():null;
    }

    /**
     * 保存数据
     * @param vip 实体对象
     */
    @Override
    public Vip save(Vip vip) {
        return vipRepository.save(vip);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return vipRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}