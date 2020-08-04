package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.base.entity.Page;
import com.qf.entity.User;
import com.qf.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jws.WebParam;

@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping("/getUserPage")
    public String getUserPage(Page page, Model model){
        PageInfo<User> userPageInfo = userService.selectPage(page);
        model.addAttribute("pageInfo",userPageInfo);
        model.addAttribute("url","user/getUserPage");
        return  "user/userList";
    }

//    @RequestMapping(value = "/toAddUserPage")
//    public String toAddUserPage(){
//        return "user/addUser";
//    }

    @RequestMapping(value = "/addUser")
    @ResponseBody
    public String addUser(User user){
        System.out.println("user = [" + user + "]");
        return "ok";
    }


}
