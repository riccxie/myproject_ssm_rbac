package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.base.entity.Page;
import com.qf.entity.ResultEntity;
import com.qf.entity.Role;
import com.qf.entity.User;
import com.qf.service.IRoleService;
import com.qf.service.IUserService;
import com.qf.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    private IRoleService roleService;

    @RequestMapping(value = "/getRolePage")
    public String getRolePage(Page page, Model model){
        PageInfo<Role> rolePageInfo = roleService.selectPage(page);
        model.addAttribute("pageInfo",rolePageInfo);
        model.addAttribute("url","role/getRolePage");
        return  "role/roleList";
    }


    @RequestMapping(value = "/addRole")
    @ResponseBody
    public ResultEntity addRole(Role role){
        int insert = roleService.insert(role);
        return ResponseUtils.writeResponse(insert);
    }
//
    @RequestMapping(value = "/getRoleById/{id}")
    public String getRoleById(@PathVariable  Integer id,Model model){
        Role role = roleService.selectById(id);
        model.addAttribute("role",role);
        return "role/updateRole";
    }
    @RequestMapping(value = "/updateRole")
    @ResponseBody
    public ResultEntity updateRole(Role role){
       return ResponseUtils.writeResponse(roleService.update(role));
    }
//
//    @RequestMapping(value = "/batchDel")
//    @ResponseBody
//    public ResultEntity batchDel(@RequestParam("ids[]") List<Integer> ids){
//        return  ResponseUtils.writeResponse(userService.batchDel(ids));
//    }
//
//    /**
//     * 删除一条信息
//     * @param id
//     * @return
//     */
//    @RequestMapping("deleteById")
//    @ResponseBody
//    public String deleteById(Integer id) {
//        //判断取值id是否为null，为null则表明删除失败！
//        if (id == null) {
//            return "error";
//        } else {
//            userService.deleteById(id);
//            return "ok";
//        }
//    }

    }
