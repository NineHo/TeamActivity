package com.lgy.xiaoyou_index.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.lgy.tools.common.utils.MailUtils;
import com.lgy.tools.common.utils.QueryObj;
import com.lgy.tools.entity.TbActivity;
import com.lgy.tools.entity.TbActivityJoin;
import com.lgy.tools.entity.TbAssstu;
import com.lgy.tools.entity.TbStu;
import com.lgy.xiaoyou_index.service.ITbActivityJoinService;
import com.lgy.xiaoyou_index.service.ITbActivityService;
import com.lgy.xiaoyou_index.service.ITbStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author lgy
 * @since 2020-02-11
 */
@Controller
@RequestMapping("/act")
public class TbActivityController {

    @Autowired
    private ITbActivityService activityService;

    @Autowired
    private ITbActivityJoinService activityJoinService;

    @Autowired
    private ITbStuService stuService;



    /**
     * 分页获取所有活动
     * @param m
     * @param page
     * @param limit
     * @param queryObj
     * @return
     */
    @RequestMapping("/getAllAct")
    public String getAllAct(Model m, @RequestParam(defaultValue = "1") long page, @RequestParam(defaultValue = "10") long limit, QueryObj queryObj){
        QueryWrapper<QueryObj> wrapper = new QueryWrapper<>();
        wrapper.setEntity(queryObj);
        IPage<TbActivity> actPage = activityService.getAllAct(page,limit,wrapper);
        m.addAttribute("actPage",actPage);
        m.addAttribute("page",page);
        m.addAttribute("queryObj",queryObj);
        return "/act/act-list";
    }

    /**
     * 根据id获取活动信息
     * @param m
     * @param acId
     * @return
     */
    @RequestMapping(value = "getActById")
    public String getActById(Model m,Integer acId){
        TbActivity act=activityService.getActById(acId);
        m.addAttribute("act",act);
        return "/act/act-look";
    }

    /**
     * 报名参加活动
     * @param acId
     * @param session
     * @return
     */
    @RequestMapping("/addStuToAct")
    @ResponseBody
    public Integer addStuToAct(Integer acId, HttpSession session){
        TbStu tbStu= (TbStu) session.getAttribute("tbStu");
        TbActivityJoin activityJoin = new TbActivityJoin();
        activityJoin.setUserId(tbStu.getUserId());
        activityJoin.setAcId(acId);
        List<TbActivityJoin> activityJoins = activityJoinService.list(new QueryWrapper<TbActivityJoin>().eq("user_id", tbStu.getUserId()));
        for (TbActivityJoin join : activityJoins) {
            if(join.getAcId().equals(acId)){
                return 2;
            }
        }
        Integer ac_count = activityJoinService.count(new QueryWrapper<TbActivityJoin>().eq("ac_id", acId));
        TbActivity activity = activityService.getActById(acId);
        if(ac_count.equals(activity.getAcCount())){
            return 3;
        }
        boolean b = activityJoinService.save(activityJoin);
        if(b){
            return 1;
        }else {
            return 0;
        }
    }

    /**
     * 跳转到创建活动的页面
     * @return
     */
    @RequestMapping("/createNewAct")
    public String createNewAct(){
        return "act/act-add";
    }
    /**
     * 创建活动
     * @param tbActivity
     * @param session
     * @return
     */
    @RequestMapping("/addAct")
    @ResponseBody
    public Integer addAct(TbActivity tbActivity,HttpSession session){
        TbStu tbStu= (TbStu) session.getAttribute("tbStu");
        if (tbActivity.getAcTitle() != null && !"".equals(tbActivity.getAcTitle().trim()) && tbActivity.getAcDesc() != null && !"".equals(tbActivity.getAcDesc().trim()) && tbActivity.getAcStartTime() != null && tbActivity.getAcEndTime() != null) {
            tbActivity.setAcPer(tbStu.getUserId());
            tbActivity.setAcStatus(1);
            tbActivity.setAcCreateTime(LocalDateTime.now());
            List<TbActivity> list = activityService.list(new QueryWrapper<TbActivity>().eq("ac_title", tbActivity.getAcTitle()).select("ac_title"));
            if (list != null) {
                for (TbActivity activity : list) {
                    if (activity.getAcTitle().equals(tbActivity.getAcTitle())) {
                        return 2;
                    }
                }
            }
            boolean b = activityService.save(tbActivity);
            if (b) {
                return 1;
            } else {
                return 0;
            }
        }
        return 0;

    }


    /**
     * 查询参与活动的校友
     * @param m
     * @param acId
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/getActJoinById")
    public String getActJoinById(Model m,Integer acId,@RequestParam(defaultValue = "1") long page, @RequestParam(defaultValue = "10") long limit){
        IPage<TbStu> stuPage = stuService.getActJoinById(new Page<TbStu>(page,limit),acId);
        m.addAttribute("stuPage",stuPage);
        m.addAttribute("page",page);
        m.addAttribute("acId",acId);
        return "act/actStu-look";
    }
    /**
     * 根据id删除
     * @param acIds
     * @return
     */
    @RequestMapping("/delActById")
    public String delActById(@RequestParam("acId") List<Integer> acIds){
        activityService.removeByIds(acIds);
        QueryWrapper<TbActivityJoin> wrapper = new QueryWrapper<>();
        wrapper.in("ac_id",acIds);
        activityJoinService.remove(wrapper);
        return "redirect:act/getAllAct";
    }


    /**
     * 删除加入活动的校友
     * @param userIds
     * @param acId
     * @return
     */
    @RequestMapping("/delActJoinById")
    public String delActJoinById(@RequestParam("userId") List<Integer> userIds,Integer acId){
        QueryWrapper<TbActivityJoin> wrapper = new QueryWrapper<>();
        wrapper.in("user_id",userIds);
        activityJoinService.remove(wrapper);
        return "redirect:act/getActJoinById?acId="+acId;
    }


    /**
     * 根据Id更新活动
     * @param tbActivity
     * @return
     */
    @RequestMapping("/updateActById")
    @ResponseBody
    public Integer updateActById(TbActivity tbActivity) {
//        activityService.updateById(tbActivity);
//        TbActivityJoin activityJoin = new TbActivityJoin();
//        activityJoin.setUserId(tbActivity.getAcPer());
//        activityJoin.setAcId(tbActivity.getAcId());
//        boolean b = activityJoinService.save(activityJoin);
//        if (b) {
        TbStu tbStu = stuService.getOne(new QueryWrapper<TbStu>().select("name", "email").eq("user_id", tbActivity.getAcPer()));
        if (tbActivity.getAcStatus() == 1 && tbStu.getEmail() != null) {
            try {
                MailUtils.sendMail(tbStu.getEmail(), "您已成功创建活动", " ");
                return 1;
            } catch (MessagingException e) {
                e.printStackTrace();
                return 2;
            }
        }
//            if (tbActivity.getAcStatus() == 2 && tbStu.getEmail() != null) {
//                try {
//                    MailUtils.sendMail(tbStu.getEmail(), "你申请的校友活动未通过审核", "请重新申请活动");
//                    return 1;
//                } catch (MessagingException e) {
//                    e.printStackTrace();
//                    return 2;
//                }
//            }

      return 2;}}
//    }}

