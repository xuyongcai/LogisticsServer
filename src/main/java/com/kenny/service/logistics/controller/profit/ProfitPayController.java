package com.kenny.service.logistics.controller.profit;

import com.kenny.service.logistics.exception.ErrorCode;
import com.kenny.service.logistics.exception.ErrorCodeException;
import com.kenny.service.logistics.json.JsonBean;
import com.kenny.service.logistics.json.response.PageResponse;
import com.kenny.service.logistics.model.profit.Profit;
import com.kenny.service.logistics.model.user.User;
import com.kenny.service.logistics.pay.PayUtils;
import com.kenny.service.logistics.pay.utils.TransReqBF0040001;
import com.kenny.service.logistics.service.profit.ProfitService;
import com.kenny.service.logistics.service.user.UserBaseService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Api(value = "/v1/profit/pay", description = "")
@RequestMapping(value = "/v1/profit/pay")
@RestController
public class ProfitPayController {

	@ApiOperation(value = "付款")
	@RequestMapping(value = "/paytest",method = RequestMethod.PUT)
	@ResponseBody
	public void pay(){
		try {
			TransReqBF0040001 enty = new TransReqBF0040001();
			enty.setTrans_money("0.01");
			enty.setTo_acc_name("王昆仑");
			enty.setTo_acc_no("6217856300009682629");
			enty.setTo_bank_name("中国银行");
			enty.setTrans_card_id("341282199104260233");
			enty.setTrans_mobile("18949821385");
			enty.setTrans_no("test"+System.currentTimeMillis());
			//收款人姓名、收款人银行帐号、收款人银行名称、银行卡身份证件号、（银行卡预留手机号）
			PayUtils.payToBankCard(enty);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
