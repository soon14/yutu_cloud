package com.yutu.filter;

import java.io.IOException;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yutu.configuration.SystemPropertiesConfig;
import com.yutu.util.RedisUtils;
import org.apache.log4j.Logger;
import org.apache.commons.lang3.StringUtils;

import com.yutu.entity.ConfigConstants;
import com.yutu.entity.SessionUser;
import com.yutu.util.BlacklistUitls;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @ClassName: MyFilter
 * @Author: zhaobc
 * @Date: 2019/4/18
 * @Description:
 **/
@Component
@Order(2)
public class MyFilter implements Filter {
    @Resource
    private RedisUtils redisUtils;

    Logger logger = Logger.getLogger(MyFilter.class);

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {
        try {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            HttpServletResponse response = (HttpServletResponse) servletResponse;
            String security = request.getRemoteAddr() + "<yutu_frame>" + request.getHeader("User-Agent");

            //判断是否启动黑名单
            if (SystemPropertiesConfig.System_Blacklist_StartUp.equals("true")) {
                //开始启动黑名单
                BlacklistUitls black = new BlacklistUitls();
                if (!black.judgeBlacklist(request)) {
                    return;
                }
            }
            //判断用户登陆存储方式
            switch (SystemPropertiesConfig.System_LoginStorage_Type) {
                case "session":
                    doFilterSession(request, response, chain, security);
                    break;
                case "redis":
                    //存储到redis
                    doFilterRedis(request, response, chain, security);
                    break;
                default:
                    //存储到session中
                    doFilterSession(request, response, chain, security);
                    break;
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            logger.error(e);
        }
    }

    @Override
    public void destroy() {
    }

    /**
     * @Author: zhaobc
     * @Date: 2019-12-18 17:44
     * @Description: 登陆过滤器Session版
     **/
    private void doFilterSession(HttpServletRequest request, HttpServletResponse response, FilterChain chain, String security) throws IOException, ServletException {
        String url = request.getServletPath();
        //获得session用户信息
        HttpSession session = request.getSession(false);
        SessionUser sessionUser = new SessionUser();
        if (session != null) {
            if (session.getId() != null) {
                //Session版获取数据
                sessionUser = (SessionUser) session.getAttribute(session.getId());
            }
        }
        //判断session是否为null  sesson中存储客户端标识字段，需要进行验证是否是登陆着
        if (session != null && sessionUser != null && sessionUser.getUserSafety().equals(security)) {
            //为session从新赋值
            request.getSession().setAttribute(session.getId(), sessionUser);
            if (url.equals("/")) {
                //重定向到首页
                response.sendRedirect(SystemPropertiesConfig.System_Home_Page);
            }
            chain.doFilter(request, response);
        } else {
            //判断是否需要白名单
            if (StringUtils.isNotBlank(SystemPropertiesConfig.System_Filter_Path)) {
                //白名单判断
                String[] whiteUrl = SystemPropertiesConfig.System_Filter_Path.split(",");
                //如果是白名单里的，放行
                if (isWhiteListUrl(url, whiteUrl)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
            //未登录也不在白名单
            String requestType = request.getHeader("X-Requested-With");
            //判断是否是ajax请求 是ajax请求，返回错误信息
            if (requestType != null && "XMLHttpRequest".equals(requestType)) {
                response.getWriter().write(SystemPropertiesConfig.System_Filter_Path);
            } else {
                //重定向到登录页(需要在static文件夹下建立此html文件)
                //response.sendRedirect(SystemPropertiesConfig.System_Login_Page);
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.write("<html>");
                out.write("<body>");
                out.write("<script type=\"text/javascript\">");
                out.println("window.open ('" + request.getContextPath() + SystemPropertiesConfig.System_Login_Page + "','_top')");
                out.write("</script>");
                out.write("</body>");
                out.write("</html>");
            }
        }
    }

    /**
     * @Author: zhaobc
     * @Date: 2019-12-18 17:44
     * @Description: 登陆过滤器Redis版
     **/
    private void doFilterRedis(HttpServletRequest request, HttpServletResponse response, FilterChain chain, String security) throws IOException, ServletException {
        //活动url地址和token
        String url = request.getServletPath();
        String token = request.getParameter("token");
        //获得session用户信息
        HttpSession session = request.getSession(false);
        SessionUser sessionUser = new SessionUser();
        //判断是否有数据
        boolean isUserData = false;
        String sessionId = "";
        //判断登陆模式 单点登录/密码登录
        if (SystemPropertiesConfig.System_Login_Type.equals("PWD")) {
            if (session != null) {
                if (session.getId() != null) {
                    //Redis版获取数据
                    sessionUser = (SessionUser) redisUtils.get(session.getId());
                    //判断sessionUser是否有值
                    if (sessionUser != null) {
                        isUserData = true;
                        sessionId = session.getId();
                    }
                }
            }
        } else if (SystemPropertiesConfig.System_Login_Type.equals("SSO")) {
            //登陆时候使用
            if (token != null && url.contains("loginSSO")) {
                //Redis版获取数据
                sessionUser = (SessionUser) redisUtils.get(token);
                //判断sessionUser是否有值
                if (sessionUser != null) {
                    isUserData = true;
                    sessionId = token;
                    request.getSession().setAttribute(SystemPropertiesConfig.System_Auth_Token, token);
                }
            } else {
                if(session!=null) {
                    Object auttoken = session.getAttribute(SystemPropertiesConfig.System_Auth_Token);
                    //登陆后使用
                    sessionUser = (SessionUser) redisUtils.get(auttoken.toString());
                    //判断sessionUser是否有值
                    if (sessionUser != null) {
                        isUserData = true;
                        sessionId = token;
                    }
                }
            }
        }
        //判断session是否为null  sesson中存储客户端标识字段，需要进行验证是否是登陆着
        if (isUserData && sessionUser.getUserSafety().equals(security)) {
            //重新设置token过期时间
            redisUtils.expire(sessionId, Long.parseLong(SystemPropertiesConfig.System_Token_TimeOut));
            if (url.equals("/")) {
                //重定向到首页
                response.sendRedirect(SystemPropertiesConfig.System_Home_Page);
            }
            chain.doFilter(request, response);
        } else {
            //判断是否需要白名单
            if (StringUtils.isNotBlank(SystemPropertiesConfig.System_Filter_Path)) {
                //白名单判断
                String[] whiteUrl = SystemPropertiesConfig.System_Filter_Path.split(",");
                //如果是白名单里的，放行
                if (isWhiteListUrl(url, whiteUrl)) {
                    chain.doFilter(request, response);
                    return;
                }
            }
            //未登录也不在白名单
            String requestType = request.getHeader("X-Requested-With");
            //判断是否是ajax请求 是ajax请求，返回错误信息
            if (requestType != null && "XMLHttpRequest".equals(requestType)) {
                response.getWriter().write(SystemPropertiesConfig.System_Filter_Path);
            } else {
                //重定向到登录页(需要在static文件夹下建立此html文件)
                //response.sendRedirect(SystemPropertiesConfig.System_Login_Page);
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.write("<html>");
                out.write("<body>");
                out.write("<script type=\"text/javascript\">");
                out.println("window.open ('" + request.getContextPath() + SystemPropertiesConfig.System_Login_Page + "','_top')");
                out.write("</script>");
                out.write("</body>");
                out.write("</html>");
            }
        }
    }


    /**
     * @Author: zhaobc
     * @Date: 2019/4/21
     * @Description: 判断url是否属于白名单
     **/
    private boolean isWhiteListUrl(String httpUrl, String[] whiteUrl) {
        if (whiteUrl != null) {
            for (String eu : whiteUrl) {
                if (httpUrl.equals(eu.trim()) || (httpUrl.contains("/api/") || httpUrl.contains(".css") || httpUrl.contains(".js") || httpUrl.contains(".png") || httpUrl.contains(".jpg"))) {
                    return true;
                }
            }
        }
        return false;
    }
}
