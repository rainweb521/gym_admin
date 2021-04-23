package com.linln.admin.course.controller;

import cn.hutool.core.date.DateUtil;
import com.linln.admin.course.domain.Course;
import com.linln.admin.course.domain.MyCourse;
import com.linln.admin.course.repository.MyCourseRepository;
import com.linln.admin.course.service.CourseService;
import com.linln.admin.course.validator.CourseValid;
import com.linln.admin.vip.domain.Vip;
import com.linln.admin.vip.service.VipService;
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

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author wcy
 * @date 2020/02/22
 */
@Controller
@RequestMapping("/course/course")
public class CourseController {

    @Autowired
    private CourseService courseService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private VipService vipService;
    @Autowired
    private MyCourseRepository myCourseRepository;

    /**
     * 列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("course:course:index")
    public String index(Model model, Course course) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", match -> match.contains())
                .withMatcher("type", match -> match.contains());

        // 获取数据列表
        Example<Course> example = Example.of(course, matcher);
        Page<Course> list = courseService.getPageList(example);

        //使用createBy来作为教练员信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/course/course/index";
    }
    /**
     * 课程定制--列表页面
     */
    @GetMapping("/buy")
    @RequiresPermissions("course:course:buy")
    public String buy(Model model, Course course) {

        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", match -> match.contains())
                .withMatcher("type", match -> match.contains());

        // 获取数据列表
        Example<Course> example = Example.of(course, matcher);
        Page<Course> list = courseService.getPageList(example);

        //使用createBy来作为教练员信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/course/course/buy";
    }

    /**
     * 我的课程选择-列表页面
     */
    @GetMapping("/myself")
    @RequiresPermissions("course:course:myself")
    public String myself(Model model, Course course) {

        List<Course> list = new ArrayList<>();
        myCourseRepository.findAll().stream().filter(item-> item.getUserId().equals(ShiroUtil.getSubject().getId()))
                .forEach(item->{
                    Course temp = courseService.getById(item.getCourseId());
//                    将创建时间改为加入时间
                    temp.setCreateDate(DateUtil.parse(item.getCreateDate(),"yyyy-MM-dd"));
                    list.add(temp);
                });

//        // 创建匹配器，进行动态查询匹配
//        ExampleMatcher matcher = ExampleMatcher.matching()
//                .withMatcher("name", match -> match.contains())
//                .withMatcher("type", match -> match.contains());
//
//        // 获取数据列表
//        Example<Course> example = Example.of(course, matcher);
//        Page<Course> list = courseService.getPageList(example);

        //使用createBy来作为教练员信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list);
        model.addAttribute("page", list);
        return "/course/course/myself";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add/{id}")
    @RequiresPermissions("course:course:add")
    public String toAdd(@PathVariable("id") Role role, Model model) {
        model.addAttribute("list", role.getUsers());
        return "/course/course/add";
    }
//    /**
//     * 跳转到拥有该角色的用户列表页面
//     */
//    @GetMapping("/userList/{id}")
//    @RequiresPermissions("system:role:detail")
//    public String toUserList(@PathVariable("id") Role role, Model model){
//        model.addAttribute("list", role.getUsers());
//        return "/system/role/userList";
//    }
    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("course:course:edit")
    public String toEdit(@PathVariable("id") Course course, Model model) {
        Role role = roleService.getById(Long.valueOf(4));
        model.addAttribute("list", role.getUsers());
        model.addAttribute("course", course);
        return "/course/course/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"course:course:add", "course:course:edit"})
    @ResponseBody
    public ResultVo save(@Validated CourseValid valid, Course course) {
        //保存教练信息,可能存在某种拦截器，在切面卡走了数据，暂时不做修改
//        User user = userService.getById(course.getUserId());
//        course.setCreateBy(user);
        // 复制保留无需修改的数据
        if (course.getId() != null) {
            Course beCourse = courseService.getById(course.getId());
            EntityBeanUtil.copyProperties(beCourse, course);
        }

        // 保存数据
        courseService.save(course);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("course:course:detail")
    public String toDetail(@PathVariable("id") Course course, Model model) {
        course.setCreateBy(userService.getById(course.getUserId()));
        model.addAttribute("course",course);
        return "/course/course/detail";
    }
    /**
     * 跳转到购买详细页面
     */
    @GetMapping("/buydetail/{id}")
    public String toBuyDetail(@PathVariable("id") Course course, Model model) {
        course.setCreateBy(userService.getById(course.getUserId()));
        Vip vip = vipService.getVipByUserId(ShiroUtil.getSubject().getId());
        double balance = 0;
        if (vip==null){
            balance = 0.0;
        }else {
            balance = vip.getBalance();
        }
        model.addAttribute("balance",balance);
        model.addAttribute("course",course);
        return "/course/course/buydetail";
    }

    /**
     * 购买课程
     */
    @RequestMapping("/buy/")
    @ResponseBody
    public ResultVo buy( @RequestParam(value = "id", required = false) Long id) {
        Course course = courseService.getById(id);
        Vip vip = vipService.getVipByUserId(ShiroUtil.getSubject().getId());
        double balance = 0;
        if (vip==null){
            balance = 0.0;
        }else {
            balance = vip.getBalance()==null?0.0:vip.getBalance();
        }
        if (balance>course.getPrice()){
            balance = balance - course.getPrice();
            vip.setBalance(balance);
            vipService.save(vip);
            MyCourse myCourse = new MyCourse();
            myCourse.setCourseId(course.getId());
            myCourse.setUserId(ShiroUtil.getSubject().getId());
            myCourse.setCreateDate(DateUtil.format(new Date(),"yyy-MM-dd"));
            myCourseRepository.save(myCourse);
            return ResultVoUtil.success("购买成功");
        }else{
            return ResultVoUtil.error( "购买失败，余额不足");
        }
    }
    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("course:course:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (courseService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}