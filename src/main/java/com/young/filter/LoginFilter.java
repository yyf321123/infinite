package com.young.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;
        // 获取请求地址
        String uri = req.getRequestURI();
        // 放行css文件
        if(uri.toString().contains(".css")){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        // 如果是登录页面和处理登录请求的URL就不拦截
        if (uri.endsWith("login.jsp") || uri.endsWith("login") || uri.endsWith("signup") || uri.endsWith("signup.jsp")
            || uri.endsWith("find") || uri.endsWith("find.jsp") || uri.endsWith("update") || uri.endsWith("update.jsp")) {
            // 放行
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }

        HttpSession session = req.getSession();
        // 如果用户未登录，拦截除登录之外的所有请求，给出提示后跳转到登录界面
        if (session == null || session.getAttribute("user_id") == null) {
            resp.setContentType("text/html;charset=utf-8");
            resp.getWriter().write("<script>"
                    + "alert('您还未登录系统，请登录系统后查看！！！');"
                    + "var path = 'http://118.89.58.79:8232/'+'pages/login.jsp';"
                    + "window.location.href=path;"
                    + "</script>");
            return;
        }
        else {
            // 如果用户已登录，就不拦截，放行
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {

    }
}
