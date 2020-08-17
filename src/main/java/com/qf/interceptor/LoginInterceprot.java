package com.qf.interceptor;

import com.qf.utils.Constants;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;

public class LoginInterceprot implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        Object sysAdmin = request.getSession().getAttribute(Constants.SESSION_USER);
//暂时注释的内容
        if(sysAdmin != null){
            return  true; // 放行
        }else{

            String contextPath = request.getContextPath();
//            response.sendRedirect(contextPath+"/toLogin");
//            response.getWriter().write("<script>locaiton.href='"+contextPath+"/toLogin'</script>");
            response.getWriter().write("<script>window.open('"+contextPath+"/toLogin','_parent')</script>");
            return false;
        }
    }
}
