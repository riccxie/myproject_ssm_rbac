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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

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

    //注释掉的内容*
//    @RequestMapping(value = "/getPerListByPid")
//    @ResponseBody
//    public List<Map<String,Object>> getPerListByPid(Integer id){
//
//        // 1.判断如果pid为空，说明是第一次查询
//        if(id == null){
//            id = -1;
//        }
//
//        // 2.根据pid查询子权限
//        List<Permission> permissionList = permissionService.getPerListByPid(id);
//
//        // 3.准备一个map，把permissionList中的数据放到map中
////        List<Map<String,Object>> data = new ArrayList<>();
//        List<Map<String,Object>> data = new ArrayList<Map<String, Object>>();
//
//        for (Permission per:permissionList) {
////            Map<String,Object> map = new HashMap<>();
//            Map<String,Object> map = new HashMap<>();
//            map.put("id",per.getId()); //节点id，点击节点发送请求时要用到id
//            map.put("name",per.getPerName()); // 节点名字用来显示
//            map.put("pid",per.getPerPid()); // 用来构建树结构
//            map.put("isParent",per.getIsParent()); // 用来构建树结构
//            // 添加到集合中
//            data.add(map);
//        }
//
//        // 返回数据
//        return  data;
//
//    }

    @RequestMapping(value = "/getPerById/{id}")
    public String getPerById(@PathVariable Integer id,Model model){
        Permission permission = permissionService.selectById(id);
        model.addAttribute("per",permission);
        return "per/updatePer";
    }

    @RequestMapping(value = "/updatePer")
    @ResponseBody
    public ResultEntity updatePer(Permission permission){
        return  ResponseUtils.writeResponse(permissionService.update(permission));
    }
}
