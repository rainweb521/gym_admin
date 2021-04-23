package com.linln.admin.equipment.controller;

import com.linln.admin.equipment.domain.Equipment;
import com.linln.admin.equipment.service.EquipmentService;
import com.linln.admin.equipment.validator.EquipmentValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22 2020/02/22
 */
@Controller
@RequestMapping("/equipment/equipment")
public class EquipmentController {

    @Autowired
    private EquipmentService equipmentService;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("equipment:equipment:index")
    public String index(Model model, Equipment equipment) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", match -> match.contains())
                .withMatcher("type", match -> match.contains());

        // 获取数据列表
        Example<Equipment> example = Example.of(equipment, matcher);
        Page<Equipment> list = equipmentService.getPageList(example);

        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/equipment/equipment/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("equipment:equipment:add")
    public String toAdd() {
        return "/equipment/equipment/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("equipment:equipment:edit")
    public String toEdit(@PathVariable("id") Equipment equipment, Model model) {
        model.addAttribute("equipment", equipment);
        return "/equipment/equipment/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"equipment:equipment:add", "equipment:equipment:edit"})
    @ResponseBody
    public ResultVo save(@Validated EquipmentValid valid, Equipment equipment) {
        // 复制保留无需修改的数据
        if (equipment.getId() != null) {
            Equipment beEquipment = equipmentService.getById(equipment.getId());
            EntityBeanUtil.copyProperties(beEquipment, equipment);
        }

        // 保存数据
        equipmentService.save(equipment);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("equipment:equipment:detail")
    public String toDetail(@PathVariable("id") Equipment equipment, Model model) {
        model.addAttribute("equipment",equipment);
        return "/equipment/equipment/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("equipment:equipment:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (equipmentService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}