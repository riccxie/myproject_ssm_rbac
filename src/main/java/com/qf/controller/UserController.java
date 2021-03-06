package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.base.entity.Page;
import com.qf.entity.ResultEntity;
import com.qf.entity.User;
import com.qf.service.IUserService;
import com.qf.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/getUserPage")
    public String getUserPage(Page page, Model model){
        PageInfo<User> userPageInfo = userService.selectPage(page);
        model.addAttribute("pageInfo",userPageInfo);
        model.addAttribute("url","user/getUserPage");
        return  "user/userList";
    }

    @RequestMapping(value = "/addUser")
    @ResponseBody
    public ResultEntity addUser(User user){
        int insert = userService.insert(user);
        return ResponseUtils.writeResponse(insert);
    }

    @RequestMapping(value = "/getUserById/{id}")
    public String getUserById(@PathVariable  Integer id,Model model){
        User user = userService.selectById(id);
        model.addAttribute("user",user);
        return "user/updateUser";
    }
    @RequestMapping(value = "/getUserpassById/{id}")
    public String getUserpassById(@PathVariable  Integer id,Model model){
        User user = userService.selectById(id);
        model.addAttribute("user",user);
        return "user/updatepassUser";
    }
    @RequestMapping(value = "/updatepassUser")
    @ResponseBody
    public ResultEntity updatepassUser(User user){

        return ResponseUtils.writeResponse(userService.update(user));
    }


    @RequestMapping(value = "/updateUser")
    @ResponseBody
    public ResultEntity updateUser(User user){
       return ResponseUtils.writeResponse(userService.update(user));
    }

    @RequestMapping(value = "/batchDel")
    @ResponseBody
    public ResultEntity batchDel(@RequestParam("ids[]") List<Integer> ids){
        return  ResponseUtils.writeResponse(userService.batchDel(ids));
    }

    /**
     * 删除一条信息
     * @param id
     * @return
     */
    @RequestMapping("deleteById")
    @ResponseBody
    public String deleteById(Integer id) {
        //判断取值id是否为null，为null则表明删除失败！
        if (id == null) {
            return "error";
        } else {
            userService.deleteById(id);
            return "ok";
        }
    }

    }
