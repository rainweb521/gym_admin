package com.linln.admin.survey.service.impl;

import com.linln.admin.survey.domain.Survey;
import com.linln.admin.survey.repository.SurveyRepository;
import com.linln.admin.survey.service.SurveyService;
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
public class SurveyServiceImpl implements SurveyService {

    @Autowired
    private SurveyRepository surveyRepository;

    /**
     * 根据ID查询数据
     * @param id 主键ID
     */
    @Override
    @Transactional
    public Survey getById(Long id) {
        return surveyRepository.findById(id).orElse(null);
    }

    /**
     * 获取分页列表数据
     * @param example 查询实例
     * @return 返回分页数据
     */
    @Override
    public Page<Survey> getPageList(Example<Survey> example) {
        // 创建分页对象
        PageRequest page = PageSort.pageRequest();
        return surveyRepository.findAll(example, page);
    }

    /**
     * 保存数据
     * @param survey 实体对象
     */
    @Override
    public Survey save(Survey survey) {
        return surveyRepository.save(survey);
    }

    /**
     * 状态(启用，冻结，删除)/批量状态处理
     */
    @Override
    @Transactional
    public Boolean updateStatus(StatusEnum statusEnum, List<Long> idList) {
        return surveyRepository.updateStatus(statusEnum.getCode(), idList) > 0;
    }
}