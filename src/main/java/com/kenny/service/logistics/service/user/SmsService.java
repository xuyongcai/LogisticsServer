package com.kenny.service.logistics.service.user;


import com.kenny.service.logistics.exception.ErrorCodeException;
import com.kenny.service.logistics.exception.UserErrorCode;
import com.kenny.service.logistics.mapper.user.SmsMapper;
import com.kenny.service.logistics.mapper.user.SmsTypeMapper;
import com.kenny.service.logistics.model.user.Sms;
import com.kenny.service.logistics.model.user.SmsType;
import com.kenny.service.logistics.service.util.SmsSendService;
import com.kenny.service.logistics.util.AliSmsUtil;
import com.kenny.service.logistics.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * 只返回response对象，boolean
 */
@Service
public class SmsService {

    @Autowired
    private SmsTypeMapper codeTypeMapper;
    @Autowired
    private SmsMapper codeMapper;
    @Autowired
    private SmsSendService smsSendService;

    private int sendTime = 60 * 1000;       //重发时间：60秒
    private int overTime = 5 * 60 * 1000;   //失效时间：5分钟

    //发送注册短信
    public Sms SendRegistMessage(String phone) throws ErrorCodeException {
        int type = 0;
        String number = createCode();
        //发送短信
        smsSendService.UserRegistString(phone,number);
        return SendMessage(phone,number,type);
    }

    /**
     * 发送短信
     * @param phone
     * @param number
     * @param type
     * @return
     * @throws ErrorCodeException
     */
    public Sms SendMessage(String phone,String number,int type) throws ErrorCodeException {
        //手机号参数判断
        if (phone.length() != 11)
            throw new ErrorCodeException(UserErrorCode.PARAM_ERROR);

        //与上一次发送间隔小于60s
        Sms lcode = codeMapper.selectTopByPhone(phone);
        if(lcode != null) {
            long timeCount = new Date().getTime() - lcode.getSendtime().getTime();
            if (timeCount < sendTime)
                throw new ErrorCodeException(UserErrorCode.CODE_FAST);
        }

        //随机生成验证码和Cookie
        String cookie = createCookie(phone, number);

        //存储一条发送信息
        Sms code = new Sms();
        code.setCode(number);
        code.setCookie(cookie);
        code.setPhone(phone);
        code.setSendtime(new Date());
        code.setCode_type_id(type);
        code.setIs_submit(false);
        codeMapper.insert(code);

        code.setCode("");
        return code;
    }

    /**
     * 提交的短信验证码校验
     * 1、校验Cookie存在性
     * 2、校验Time超时性
     * 3、校验Code正确性
     */
    public void CheckCode(String cookie, String sms) throws ErrorCodeException {
        //参数判断
        if (sms.length() != 4)
            throw new ErrorCodeException(UserErrorCode.PARAM_ERROR);
        if (cookie.length() != 16)
            throw new ErrorCodeException(UserErrorCode.PARAM_ERROR);

        //1、校验Cookie存在性
        Sms code = codeMapper.selectByCookie(cookie);
        if (code == null)
            throw new ErrorCodeException(UserErrorCode.COOKIE_ERROR);

        //2、校验Time超时性
        if (new Date().getTime() - code.getSendtime().getTime() > overTime)
            throw new ErrorCodeException(UserErrorCode.CODE_OVERTIME);

        //3、校验Code正确性
        if (!sms.equals(code.getCode()))
            throw new ErrorCodeException(UserErrorCode.CODE_ERROR);

        //4、记录验证码提交
        code.setSubtime(new Date());
        code.setIs_submit(true);

        if (codeMapper.update(code) <= 0)
            throw new ErrorCodeException(UserErrorCode.DB_ERROR);
    }


    /*
    * 生成cokie
    * */
    private String createCookie(String phone, String code) {
        return MD5Util.MD5_16(phone + code + new Date().getTime());
    }

    /**
     * 生成验证码
     */
    private String createCode() {
        //验证码
        String code = "";
        Random random = new Random(System.currentTimeMillis());
        for (int i = 1; i <= 4; i++) {
            code = code + random.nextInt(9);
        }
        return code;
    }


}
