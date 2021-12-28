//package com.yangyang.filter;
//
//
//import com.yangyang.pojo.AdminDO;
//import com.yangyang.utils.ExcludeResourceUtil;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//@WebFilter(filterName = "authorizationFilter"
//        ,urlPatterns = {"/*"}
//)
//
////授权管理
//public class AuthorizationFilter implements Filter{
//
//    public void destroy() {
//    }
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//
//    }
//
//    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest httpServletRequest = (HttpServletRequest) req;
//        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
//        //过滤器排除静态资源
//        String requestURI = httpServletRequest.getRequestURI();
//        if (ExcludeResourceUtil.shouldExclude(requestURI)) {
//            chain.doFilter(req, resp);
//        }
//        else {
//            HttpSession session = httpServletRequest.getSession();
//            AdminDO admin = (AdminDO) session.getAttribute("admin");
//            String contextPath = httpServletRequest.getContextPath();
//            String path = requestURI.substring(contextPath.length());
//            if(admin==null){
//                if("/loginServlet1".equals(path)){
//                    chain.doFilter(req, resp);
//                }
//                else{//未登录且访问路径不是公共路径
//                    httpServletRequest.getRequestDispatcher("/WEB-INF/login1.jsp")
//                            .forward(req,resp);
//                }
//            }
//            else{
//                chain.doFilter(req, resp);
//            }
//        }
//
//    }
//}