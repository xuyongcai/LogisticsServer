package com.xiaochai.service.logistics.service.user;

import com.xiaochai.service.logistics.exception.ErrorCodeException;
import com.xiaochai.service.logistics.model.user.User;
import com.xiaochai.service.logistics.model.user.UserInfo;
import com.xiaochai.service.logistics.model.user.UserSet;
import com.xiaochai.service.logistics.model.user.UserToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Kenny on 2017/7/20.
 */

@Service
public class UserAdminService {
    @Autowired
    private UserBaseService userBaseService;
    @Autowired
    private UserInfoService userInfoService;

    private String type = "admin";
    /**
     * 登录
     * @param username
     * @param password
     * @return
     * @throws ErrorCodeException
     */
    public UserToken login(String username,String password) throws ErrorCodeException {
        return userBaseService.loginUserName(username,password,type);
    }

    public UserSet getUserEx(String token) throws ErrorCodeException {
        return userBaseService.getUserByTokenEx(token);
    }
    /**
     * 根据用户名密码创建用户
     *
     * @param username
     * @return
     */
    public User insertUserName(String username,String password) throws ErrorCodeException {
        return userBaseService.insertByUserName(username,password,type);
    }

    /**
     * 根据token修改用户信息
     * @param token
     * @param nickname
     * @param sex
     * @param img
     * @param birthday
     * @param company
     * @param money
     * @return
     * @throws ErrorCodeException
     */
    public UserInfo updateUserInfo(String token,String nickname, String sex, String img, Date birthday,String company, Float money) throws ErrorCodeException {
        User user = userBaseService.getUserByToken(token);
        return userInfoService.update(user.getId(),nickname,sex,img,birthday,company,money);
    }
    /**
     * 退出登陆
     *
     * @param token
     * @return
     */
    public void logout(String token) throws ErrorCodeException {
        userBaseService.logout(token);
    }


    public void updatePassword(String token, String old_password, String new_password) throws ErrorCodeException {
        userBaseService.updatePassword(token,old_password,new_password);
    }
}
