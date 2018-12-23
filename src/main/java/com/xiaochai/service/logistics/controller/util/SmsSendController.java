package com.xiaochai.service.logistics.controller.util;

import com.xiaochai.service.logistics.exception.ErrorCode;
import com.xiaochai.service.logistics.exception.ErrorCodeException;
import com.xiaochai.service.logistics.json.JsonBean;
import com.xiaochai.service.logistics.service.util.SmsSendService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;


@Api(value = "/v1/util", description = "帮助模块")
@RequestMapping(value = "/v1/util")
@RestController
public class SmsSendController {
    @Autowired
    SmsSendService smsSendService;

    @ApiOperation(value = "发送订单")
    @RequestMapping(value = "/sms/order_to_driver", method = RequestMethod.GET)
    @ResponseBody
    public JsonBean OrderToDriver(String phone,String from,String to,String order) {
        try {
            smsSendService.OrderToDriver(phone,order,from,to);
            return new JsonBean(ErrorCode.SUCCESS);
        } catch (ErrorCodeException e) {
            return new JsonBean(e.getErrorCode());
        }
    }

}
