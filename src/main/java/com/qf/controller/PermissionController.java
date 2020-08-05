package com.qf.controller;

import com.github.pagehelper.PageInfo;
import com.qf.base.entity.Page;
import com.qf.entity.Permission;
import com.qf.entity.ResultEntity;
import com.qf.service.IPermissionService;
import com.qf.utils.ResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/per")
public class PermissionController {

    @Autowired
    private IPermissionService permissionService;

    @RequestMapping(value = "/getPermissionPage")
    public String getPermissionPage(Page page, Model model){

        PageInfo<Permission> permissionPageInfo = permissionService.selectPage(page);
        model.addAttribute("pageInfo",permissionPageInfo);
        model.addAttribute("url","per/getPermissionPage");
        return "per/perList";
    }

    @RequestMapping(value = "/addPer")
    @ResponseBody
    public ResultEntity addPer(Permission permission){
        return ResponseUtils.writeResponse(permissionService.insert(permission));
    }
}
