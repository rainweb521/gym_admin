package com.linln.admin.vip.controller;

import com.linln.admin.vip.domain.Vip;
import com.linln.admin.vip.service.VipService;
import com.linln.admin.vip.validator.VipValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.component.shiro.ShiroUtil;
import com.linln.modules.system.domain.Role;
import com.linln.modules.system.domain.User;
import com.linln.modules.system.service.RoleService;
import com.linln.modules.system.service.UserService;
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
@RequestMapping("/vip/vip")
public class VipController {

    @Autowired
    private VipService vipService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("vip:vip:index")
    public String index(Model model, Vip vip) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("card", match -> match.contains());

        // 获取数据列表
        Example<Vip> example = Example.of(vip, matcher);
        Page<Vip> list = vipService.getPageList(example);

        //使用createBy来作为创建用户信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/vip/vip/index";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add")
    @RequiresPermissions("vip:vip:add")
    public String toAdd(Model model) {
        Role role = roleService.getById(Long.valueOf(3));
        model.addAttribute("list", role.getUsers());
        return "/vip/vip/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("vip:vip:edit")
    public String toEdit(@PathVariable("id") Vip vip, Model model) {
        Role role = roleService.getById(Long.valueOf(3));
        model.addAttribute("list", role.getUsers());
        model.addAttribute("vip", vip);
        return "/vip/vip/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"vip:vip:add", "vip:vip:edit"})
    @ResponseBody
    public ResultVo save(@Validated VipValid valid, Vip vip) {
        // 复制保留无需修改的数据
        if (vip.getId() != null) {
            Vip beVip = vipService.getById(vip.getId());
            EntityBeanUtil.copyProperties(beVip, vip);
        }

        // 保存数据
        vipService.save(vip);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("vip:vip:detail")
    public String toDetail(@PathVariable("id") Vip vip, Model model) {
        User user = userService.getById(vip.getUserId());
        vip.setCreateBy(user);
        model.addAttribute("vip",vip);
        return "/vip/vip/detail";
    }

    /**
     * 跳转到我的详细页面
     */
    @GetMapping("/detail")
    @RequiresPermissions("vip:vip:selfdetail")
    public String toSelfDetail(Model model) {
        User user = ShiroUtil.getSubject();
        Vip vip = vipService.getVipByUserId(user.getId());
        if (vip==null){
            model.addAttribute("vip",new Vip());
        }else {
            model.addAttribute("vip",vip);
        }
        return "/vip/vip/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("vip:vip:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (vipService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}