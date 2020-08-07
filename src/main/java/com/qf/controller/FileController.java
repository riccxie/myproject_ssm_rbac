package com.qf.controller;

import com.qf.entity.BusinessException;
import com.qf.entity.ResultEntity;
import com.qf.entity.User;
import com.qf.service.IUserService;
import javafx.scene.chart.ValueAxis;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.UUID;

@Controller
@RequestMapping(value = "/file")
@Slf4j
public class FileController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/uploadFile")
    @ResponseBody
    public ResultEntity uploadFile(MultipartFile file, HttpServletRequest request){

        String originalFilename = file.getOriginalFilename();

        // 1.获取文件上传的路径
        String path = request.getSession().getServletContext().getRealPath("png");

        // 2.创建新的文件名称
        String newFileName = UUID.randomUUID().toString().replaceAll("-","");

        // 3.创建输出位置
        FileOutputStream ops = null;
        File file1 = new File(path+ File.separator+newFileName+"_"+originalFilename);
        try {
            ops = new FileOutputStream(file1);

            // 4.IO流的拷贝
            IOUtils.copy(file.getInputStream(),ops);
        } catch (FileNotFoundException e) {
            log.error("文件名称找到",e);
            return ResultEntity.error("文件没有找到");
        } catch (IOException e) {
            log.error("文件上传失败",e);
            return ResultEntity.error("文件上传失败");
        }finally {
            IOUtils.closeQuietly(ops);
        }
        return ResultEntity.success(file1.getAbsolutePath());
    }

    @RequestMapping(value = "/showFile/{id}")
    @ResponseBody
    public void showFile(@PathVariable Integer id, HttpSession session, HttpServletResponse response){

        // 1.根据id查询对象
        User user = userService.selectById(id);

        if(user != null){

            // 2.获取头像的决定路径
            String png = user.getPng();


            if(png == null ||"".equals(png)){
                throw new BusinessException(1001,"用户头像为空");
            }

            FileInputStream ips = null;
            try {

                // 3.读取文件
                ips = new FileInputStream(png);

                // 4.拷贝文件
                IOUtils.copy(ips,response.getOutputStream());
            } catch (FileNotFoundException e) {
                throw  new BusinessException(1002,"文件没有找到");
            } catch (IOException e) {
                e.printStackTrace();
                throw  new BusinessException(1003,"文件读取异常");
            }finally {
                IOUtils.closeQuietly(ips);
            }
        }
    }
}
