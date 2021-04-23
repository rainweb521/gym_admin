package com.linln.admin.survey.controller;

import com.linln.admin.course.service.CourseService;
import com.linln.admin.survey.domain.Survey;
import com.linln.admin.survey.service.SurveyService;
import com.linln.admin.survey.validator.SurveyValid;
import com.linln.common.enums.StatusEnum;
import com.linln.common.utils.EntityBeanUtil;
import com.linln.common.utils.ResultVoUtil;
import com.linln.common.utils.StatusUtil;
import com.linln.common.vo.ResultVo;
import com.linln.component.shiro.ShiroUtil;
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
@RequestMapping("/survey/survey")
public class SurveyController {

    @Autowired
    private SurveyService surveyService;
    @Autowired
    private UserService userService;
    @Autowired
    private CourseService courseServicel;

    /**
     * 课程列表页面
     */
    @GetMapping("/index")
    @RequiresPermissions("survey:survey:index")
    public String index(Model model, Survey survey) {

        survey.setType(1);
        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", match -> match.contains());

        // 获取数据列表
        Example<Survey> example = Example.of(survey, matcher);
        Page<Survey> list = surveyService.getPageList(example);

        //使用createBy来作为创建用户信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/survey/survey/index";
    }
    /**
     * 教练列表页面
     */
    @GetMapping("/index2")
    @RequiresPermissions("survey:survey:index2")
    public String index2(Model model, Survey survey) {

        survey.setType(2);
        // 创建匹配器，进行动态查询匹配
        ExampleMatcher matcher = ExampleMatcher.matching()
                .withMatcher("name", match -> match.contains());

        // 获取数据列表
        Example<Survey> example = Example.of(survey, matcher);
        Page<Survey> list = surveyService.getPageList(example);

        //使用createBy来作为创建用户信息的暂存
        list.forEach(item->{
            item.setCreateBy(userService.getById(item.getUserId()));
        });
        // 封装数据
        model.addAttribute("list", list.getContent());
        model.addAttribute("page", list);
        return "/survey/survey/index2";
    }

    /**
     * 跳转到添加页面
     */
    @GetMapping("/add/{type}/{id}")
//    @RequiresPermissions("survey:survey:add")
    public String toAdd(@PathVariable("type") String type,
                        @PathVariable("id") Long id,Model model) {
        String name;
        if ("1".equals(type)){
            //这是课程
            name = courseServicel.getById(id).getName();
        }else{
            name = userService.getById(courseServicel.getById(id).getUserId()).getNickname();
        }
        model.addAttribute("name",name);
        model.addAttribute("type",type);
        return "/survey/survey/add";
    }

    /**
     * 跳转到编辑页面
     */
    @GetMapping("/edit/{id}")
    @RequiresPermissions("survey:survey:edit")
    public String toEdit(@PathVariable("id") Survey survey, Model model) {
        model.addAttribute("survey", survey);
        return "/survey/survey/add";
    }

    /**
     * 保存添加/修改的数据
     * @param valid 验证对象
     */
    @PostMapping("/save")
    @RequiresPermissions({"survey:survey:add", "survey:survey:edit"})
    @ResponseBody
    public ResultVo save(@Validated SurveyValid valid, Survey survey) {
        survey.setUserId(ShiroUtil.getSubject().getId());
        // 复制保留无需修改的数据
        if (survey.getId() != null) {
            Survey beSurvey = surveyService.getById(survey.getId());
            EntityBeanUtil.copyProperties(beSurvey, survey);
        }

        // 保存数据
        surveyService.save(survey);
        return ResultVoUtil.SAVE_SUCCESS;
    }

    /**
     * 跳转到详细页面
     */
    @GetMapping("/detail/{id}")
    @RequiresPermissions("survey:survey:detail")
    public String toDetail(@PathVariable("id") Survey survey, Model model) {
        model.addAttribute("survey",survey);
        return "/survey/survey/detail";
    }

    /**
     * 设置一条或者多条数据的状态
     */
    @RequestMapping("/status/{param}")
    @RequiresPermissions("survey:survey:status")
    @ResponseBody
    public ResultVo status(
            @PathVariable("param") String param,
            @RequestParam(value = "ids", required = false) List<Long> ids) {
        // 更新状态
        StatusEnum statusEnum = StatusUtil.getStatusEnum(param);
        if (surveyService.updateStatus(statusEnum, ids)) {
            return ResultVoUtil.success(statusEnum.getMessage() + "成功");
        } else {
            return ResultVoUtil.error(statusEnum.getMessage() + "失败，请重新操作");
        }
    }
}