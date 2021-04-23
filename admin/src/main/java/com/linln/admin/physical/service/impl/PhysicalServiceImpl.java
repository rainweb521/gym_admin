package com.linln.admin.physical.service.impl;

import com.linln.admin.physical.domain.Physical;
import com.linln.admin.physical.repository.PhysicalRepository;
import com.linln.admin.physical.service.PhysicalService;
import com.linln.common.data.PageSort;
import com.linln.common.enums.StatusEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Service
public class PhysicalServiceImpl implements PhysicalService {

    @Autowired
    private PhysicalRepository physicalRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Physical getById(Long id) {
        return physicalRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Physical> getPageList(Example<Physical> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return physicalRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param physical 实体对象
     */
    @Override
    public Physical save(Physical physical) {
        return physicalRepository.save(physical);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return physicalRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}