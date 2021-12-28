package com.yangyang.filter;


import com.yangyang.utils.Constants;
import com.yangyang.utils.ExcludeResourceUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "characterEncodingFilter"
        ,urlPatterns = {"/*"},
        initParams = {@WebInitParam(name= Constants.ENCODING,value = "UTF-8")}
)
public class characterEncodingFilter implements Filter {
    private  String ENCODING=null;

    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest=(HttpServletRequest)req;
        HttpServletResponse httpServletResponse=(HttpServletResponse) resp;
        System.out.println("当前req编码"+httpServletRequest.getCharacterEncoding());
        System.out.println("当前resp编码"+httpServletResponse.getCharacterEncoding());
        //过滤器排除静态资源
        String requestURI = httpServletRequest.getRequestURI();
        System.out.println(requestURI);
        if(!ExcludeResourceUtil.shouldExclude(requestURI)){
            //设置字符编码
            httpServletRequest.setCharacterEncoding(ENCODING);
            httpServletResponse.setCharacterEncoding(ENCODING);
        }
        chain.doFilter(req,resp);
    }


    //初始化会回调
    public void init(FilterConfig config) throws ServletException {
        this.ENCODING=config.getInitParameter(Constants.ENCODING);
    }

}
