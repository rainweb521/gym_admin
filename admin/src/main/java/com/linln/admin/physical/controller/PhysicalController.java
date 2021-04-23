package com.linln.admin.physical.controller;

import com.linln.admin.physical.domain.Physical;
import com.linln.admin.physical.service.PhysicalService;
import com.linln.admin.physical.validator.PhysicalValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.component.shiro.ShiroUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.Subject;
import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22
 */
@Controller
@RequestMapping("/physical/physical")
public class PhysicalController {

    @Autowired
    private PhysicalService physicalService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("physical:physical:index")
    public String index(Model model, Physical physical) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("title", match -> match.contains())
                .withMatcher("user_id",match -> match.contains());

        physical.setUserId(ShiroUtil.getSubject().getId());
        // 获取数据列表
        Example<Physical> example = Example.of(physical, matcher);
        Page<Physical> list = physicalService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/physical/physical/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("physical:physical:add")
    public String toAdd() {
        return "/physical/physical/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("physical:physical:edit")
    public String toEdit(@PathVariable("id") Physical physical, Model model) {
        model.addAttribute("physical", physical);
        return "/physical/physical/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"physical:physical:add", "physical:physical:edit"})
    @ResponseBody
    public ResultVo save(@Validated PhysicalValid valid, Physical physical) {
        physical.setUserId(ShiroUtil.getSubject().getId());
        // 复制保留无需修改的数据
        if (physical.getId() != null) {
            Physical bePhysical = physicalService.getById(physical.getId());
            EntityBeanUtil.copyProperties(bePhysical, physical);
        }

        // 保存数据
        physicalService.save(physical);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("physical:physical:detail")
    public String toDetail(@PathVariable("id") Physical physical, Model model) {
        model.addAttribute("physical",physical);
        return "/physical/physical/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("physical:physical:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (physicalService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}