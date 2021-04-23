package com.linln.admin.equipment.service.impl;

import com.linln.admin.equipment.domain.Equipment;
import com.linln.admin.equipment.repository.EquipmentRepository;
import com.linln.admin.equipment.service.EquipmentService;
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
public class EquipmentServiceImpl implements EquipmentService {

    @Autowired
    private EquipmentRepository equipmentRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Equipment getById(Long id) {
        return equipmentRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Equipment> getPageList(Example<Equipment> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return equipmentRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param equipment 实体对象
     */
    @Override
    public Equipment save(Equipment equipment) {
        return equipmentRepository.save(equipment);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return equipmentRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}