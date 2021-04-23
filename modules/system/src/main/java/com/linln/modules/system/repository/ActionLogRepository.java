package com.linln.modules.system.repository;

import com.linln.modules.system.domain.ActionLog;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22
 */
public interface ActionLogRepository extends JpaRepository<ActionLog, Long> {

    /**
     * 根据模型和数据ID查询日志列表
     * @param model 模型（表名）
     * @param recordId 数据ID
     * @return 日志列表
     */
    public List<ActionLog> findByModelAndRecordId(String model, Long recordId);
}
