package com.linln.admin.course.domain;

import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.StatusUtil;
import lombok.Data;
import org.hibernate.annotations.Where;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @Author: wcy
 * @Date: 2020/2/22
 */
@Data
@Entity
@Table(name="sys_mycourse")
@EntityListeners(AuditingEntityListener.class)
@Where(clause = StatusUtil.NOT_DELETE)
public class MyCourse  implements Serializable {
    // 主键ID
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;
    private Long userId;
    private Long courseId;
    private String createDate;
    // 数据状态
    private Byte status = StatusEnum.OK.getCode();
}
