package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.aop.bean.Permission;
import com.qf.base.entity.Page;
import com.qf.entity.BusinessException;
import com.qf.entity.ResultEntity;
import com.qf.entity.Role;
import com.qf.entity.User;
import com.qf.service.IAuthService;
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
import java.util.Map;



@Controller
@RequestMapping(value = "/auth")
public class AuthController {

    @Autowired
    private IAuthService authService;

    @RequestMapping("/toAuthList")
    public String toAuthList(Model model){
        List<Role> roleList = authService.getRoleList();
        model.addAttribute("roleList",roleList);
        return "auth/authList";
    }

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/getUserPage/{roleId}")
    public String getUserPage(@PathVariable Integer roleId, Page page, Model model){
        PageInfo<User> userPageInfo = userService.selectPage(page);
        model.addAttribute("pageInfo",userPageInfo);
        model.addAttribute("roleId",roleId);
        model.addAttribute("url","auth/getUserPage/"+roleId);
        return  "auth/showUserList";
    }

    @RequestMapping(value = "/addUserRole")
    @ResponseBody
    public ResultEntity addUserRole(@RequestParam("ids[]") List<Integer> ids, Integer roleId){

        // 1.用户选择的数据中是否已经存在这个角色
        int count = authService.getRoleByUids(ids,roleId);

        if(count > 0){
            throw new BusinessException(1005,"您选择的用户已经存在【这个角色】");
        }


        return  ResponseUtils.writeResponse(authService.addUserRole(ids,roleId));
    }

    @RequestMapping(value = "/getUserListByRoleId/{roleId}")
    public String getUserListByRoleId(@PathVariable Integer roleId,Model model){
        // 根据角色id查询用户
        List<User> userList = authService.getUserListByRoleId(roleId);
        model.addAttribute("userList",userList);
        return "auth/tableUserList";
    }

    @RequestMapping(value = "/toAuthPerZtree/{roleId}")
    public String toAuthPerZtree(@PathVariable Integer roleId,Model model){
        return "auth/authPerZtree";
    }

    @RequestMapping(value = "/getPerListByRoleId/{roleId}")
    @ResponseBody
    public List<Map<String,Object>> getPerListByRoleId(@PathVariable Integer roleId){
        return authService.getPerListByRoleId(roleId);
    }

    @RequestMapping("/addPerByRoleId")
    @ResponseBody
    public ResultEntity addPerByRoleId(@RequestParam("perIds[]") List<Integer> perIdList,Integer roleId){

        // 添加之前先删除角色拥有的权限
        authService.deleteRolePer(perIdList,roleId);

        return ResponseUtils.writeResponse(authService.addPerByRoleId(perIdList,roleId));
    }
}
