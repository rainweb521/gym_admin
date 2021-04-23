package com.linln.admin.system.controller;

import cn.hutool.core.date.DateUtil;
import com.linln.admin.physical.domain.Physical;
import com.linln.admin.physical.repository.PhysicalRepository;
import com.linln.component.shiro.ShiroUtil;
import com.linln.modules.system.domain.User;
import com.linln.modules.system.repository.UserRepository;
import com.linln.modules.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.ParseException;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Author: wcy
 * @Date: 2020/2/22
 */
@Controller
@RequestMapping("/system/chart")
public class ChartController {

    public static final String FORMAT = "yyyy-MM-dd";
    @Autowired
    private UserService userService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PhysicalRepository physicalRepository;

    @RequestMapping(value="/area",method= RequestMethod.GET)
    public String index(Model model, String content) throws ParseException {

        //获取七天前的日期
        List<Date> lDate = new ArrayList<>();
        int off = -7;
        for (int i = 0;i < 7 ;i++){
            lDate.add(DateUtil.offsetDay(new Date(),off));
            off = off + 1;
        }
        Map<String,Integer> map = new HashMap();
        int i = 1;

        List<User> userlist = userRepository.findAll();
        for (Date date : lDate){
            map.put("data"+i, Math.toIntExact(userlist.stream().filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date,FORMAT))).count()));
            i++;
        }
        model.addAttribute("data", map);
        return "/system/charts/index";
    }

    @RequestMapping(value="/line",method= RequestMethod.GET)
    public String line(Model model, String content) throws ParseException {
        //获取七天前的日期
        List<Date> lDate = new ArrayList<>();
        int off = -7;
        for (int i = 0;i < 7 ;i++){
            lDate.add(DateUtil.offsetDay(new Date(),off));
            off = off + 1;
        }
        LinkedList<Map<String,Object>> datelist = new LinkedList<>();
        int l = 1;
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            map.put("date",DateUtil.format(date,FORMAT));
            map.put("offset","date"+l);
            datelist.add(map);
            l++;
        }

        int i = 1;

        List<Map<String,Object>> alllist = new LinkedList<>();
        List<Physical> phylist = physicalRepository.findAll();
        Long userid = ShiroUtil.getSubject().getId();
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            List<String> result = phylist.stream()
                    .filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date, FORMAT))
                            && item.getUserId().equals(userid)).map(Physical::getWeight).collect(Collectors.toList());
            if (result.size()>0){
                map.put("data", result.get(0));
            }else {
                map.put("data", 0);
            }
            map.put("offset","data"+i);
            alllist.add(map);
            i++;
        }
        model.addAttribute("list", alllist);
        i = 1;
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            List<String> result = phylist.stream()
                    .filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date, FORMAT))
                            && item.getUserId().equals(userid)).map(Physical::getFat).collect(Collectors.toList());
            if (result.size()>0){
                map.put("data", result.get(0));
            }else {
                map.put("data", 0);
            }
            map.put("offset","fat"+i);
            alllist.add(map);
            i++;
        }
        model.addAttribute("fatlist", alllist);
        i = 1;
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            List<String> result = phylist.stream()
                    .filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date, FORMAT))
                            && item.getUserId().equals(userid)).map(Physical::getMuscle).collect(Collectors.toList());
            if (result.size()>0){
                map.put("data", result.get(0));
            }else {
                map.put("data", 0);
            }
            map.put("offset","muscle"+i);
            alllist.add(map);
            i++;
        }
        model.addAttribute("musclelist", alllist);
        i = 1;
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            List<String> result = phylist.stream()
                    .filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date, FORMAT))
                            && item.getUserId().equals(userid)).map(Physical::getMoisture).collect(Collectors.toList());
            if (result.size()>0){
                map.put("data", result.get(0));
            }else {
                map.put("data", 0);
            }
            map.put("offset","moisture"+i);
            alllist.add(map);
            i++;
        }
        model.addAttribute("moisturelist", alllist);
        i = 1;
        for (Date date : lDate){
            Map<String,Object> map = new HashMap();
            List<String> result = phylist.stream()
                    .filter(item -> DateUtil.format(item.getCreateDate(), FORMAT).contains(DateUtil.format(date, FORMAT))
                            && item.getUserId().equals(userid)).map(Physical::getProtein).collect(Collectors.toList());
            if (result.size()>0){
                map.put("data", result.get(0));
            }else {
                map.put("data", 0);
            }
            map.put("offset","protein"+i);
            alllist.add(map);
            i++;
        }
        model.addAttribute("proteinlist", alllist);
        model.addAttribute("datelist", datelist);
        return "/system/charts/line";
    }


}
