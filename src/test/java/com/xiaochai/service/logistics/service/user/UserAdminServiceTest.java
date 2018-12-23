package com.xiaochai.service.logistics.service.user;

import com.xiaochai.service.logistics.exception.ErrorCodeException;
import com.xiaochai.service.logistics.model.user.User;
import com.xiaochai.service.logistics.model.user.UserInfo;
import com.xiaochai.service.logistics.model.user.UserSet;
import com.xiaochai.service.logistics.model.user.UserToken;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * @author: xiaochai
 * @create: 2018-12-23
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class UserAdminServiceTest {

    @Autowired
    UserAdminService userAdminService;

    @Test
    public void login() throws ErrorCodeException {
        String username = "admin";
        String password = "123456";
        UserToken result = null;

        result = userAdminService.login(username, password);

        assertNotNull(result.getToken());
        System.out.println(result.getToken());
    }

    @Test
    public void getUserEx() throws ErrorCodeException {
        UserSet result = null;
        String token = "23df8c31f2567676";

        result = userAdminService.getUserEx(token);
        assertNotNull(result.getUser().getId());
    }

    @Test
    public void insertUserName() throws ErrorCodeException {
        String username = "test";
        String password = "123456";
        User result = null;
        result = userAdminService.insertUserName(username, password);
        assertNotNull(result.getId());
    }

    /**
     * 根据token修改用户信息
     * @throws ErrorCodeException
     */
    @Test
    public void updateUserInfo() throws ErrorCodeException {
        String token = "23df8c31f2567676"; //必须存在
        String nickname = "测试";
        String sex = "男";
        String img = "/static/img/avatar.jpg";
        Date birthday = new Date();
        String company = "测试公司";
        Float money = new Float(99);

        UserInfo result = userAdminService.updateUserInfo(token, nickname, sex, img, birthday, company, money);
        assertNotNull(result.getId());
    }

    @Test
    public void logout() throws ErrorCodeException {
        String token = "23df8c31f2567676";

        userAdminService.logout(token);
    }

    @Test
    public void updatePassword() throws ErrorCodeException {
        String token = "23df8c31f2567676";
        String old_password = "123456";
        String new_password = "123456";
        userAdminService.updatePassword(token,old_password,new_password);
    }
}