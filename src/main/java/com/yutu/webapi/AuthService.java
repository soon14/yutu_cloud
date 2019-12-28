package com.yutu.webapi;

import com.alibaba.fastjson.JSON;
import com.yutu.entity.MsgPack;
import com.yutu.service.ILoginService;
import com.yutu.util.TokenManager;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

/**
 * @Author: zhaobc
 * @Date: 2019-12-19 13:53
 * @Description:认证服务接口服务 restful
 */
@Component
@Path("auth")
public class AuthService {
    @Resource
    private ILoginService loginService;

    /**
     * @Author: zhaobc
     * @Date: 2019-12-19 15:27
     * @Description: 对外普通密码登录
     **/
    @GET
    @Path(value = "login")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public MsgPack login(@FormParam("userAccount") String userAccount, @FormParam("userPwd") String userPwd) {
        MsgPack msgPack = new MsgPack();
        msgPack = loginService.getAuthPwdLogin(userAccount, userPwd);
        return msgPack;
    }

    /**
     * @Author: zhaobc
     * @Date: 2019-12-19 16:00
     * @Description:对外单点登录
     **/
    @GET
    @Path(value = "loginSSO")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public MsgPack loginSSO(@QueryParam("APPKEY") String APPKEY, @QueryParam("TOKEN") String TOKEN) {
        MsgPack msgPack = new MsgPack();
        msgPack = loginService.getAuthSSOLogin(APPKEY, TOKEN);
        return msgPack;
    }

    /**
     * @Author: zhaobc
     * @Date: 2019-12-19 18:51
     * @Description: 验证token 无需apk
     **/
    @GET
    @Path(value = "/verification")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.APPLICATION_JSON)
    public MsgPack token(@QueryParam("token") String token) {

        MsgPack msgPack = new MsgPack();
        if (TokenManager.verificationToken(token)) {
            msgPack.setStatus(1);

        } else {
            msgPack.setStatus(0);
        }
        return msgPack;
    }


}
