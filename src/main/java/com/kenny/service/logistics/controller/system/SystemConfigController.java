package com.kenny.service.logistics.controller.system;

import com.kenny.service.logistics.model.user.User;
import com.kenny.service.logistics.service.user.UserBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import io.swagger.annotations.*;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
import com.kenny.service.logistics.json.JsonBean;
import com.kenny.service.logistics.json.response.PageResponse;
import com.kenny.service.logistics.exception.ErrorCodeException;
import com.kenny.service.logistics.exception.ErrorCode;
import com.kenny.service.logistics.model.system.SystemConfig;
import com.kenny.service.logistics.service.system.SystemConfigService;

@Api(value = "/v1/system/config", description = "系统配置表")
@RequestMapping(value = "/v1/system/config")
@RestController
public class SystemConfigController{
	@Autowired
	private SystemConfigService systemConfigService;
	@Autowired
	private UserBaseService userBaseService;

	@ApiOperation(value = "增加SystemConfig")
	@RequestMapping(value = "",method = RequestMethod.POST)
	@ResponseBody
	public JsonBean<SystemConfig> Insert(@ApiParam(value = "用户token",required = true)@RequestParam(value = "token",required = true)String token,
										 @ApiParam(value = "名称",required = false)@RequestParam(value = "name",required = false)String name,
	                                     @ApiParam(value = "编码",required = false)@RequestParam(value = "code",required = false)String code,
	                                     @ApiParam(value = "值",required = false)@RequestParam(value = "value",required = false)String value){
		try {
			User user = userBaseService.getUserByToken(token);
			return new JsonBean(ErrorCode.SUCCESS, systemConfigService.insert(name,code,value,user.getId()));
		} catch (ErrorCodeException e) {
			return new JsonBean(e.getErrorCode());
		}
	}
	@ApiOperation(value = "修改指定的SystemConfig")
	@RequestMapping(value = "/{id}",method = RequestMethod.PUT)
	@ResponseBody
	public JsonBean<SystemConfig> update(@ApiParam(value = "查询主键", required = true)@PathVariable()Integer id,
										 @ApiParam(value = "值",required = false)@RequestParam(value = "value",required = false)String value){
		try{
			return new JsonBean(ErrorCode.SUCCESS, systemConfigService.update(id,value));
		}catch(ErrorCodeException e){
			return new JsonBean(e.getErrorCode());
		}
	}

	@ApiOperation(value = "获取指定的SystemConfig")
	@RequestMapping(value = "/{id}",method = RequestMethod.GET)
	@ResponseBody
	public JsonBean<SystemConfig> selectByPrimaryKey(@ApiParam(value = "查询主键", required = true)@PathVariable()Integer id){
		try{
			return new JsonBean(ErrorCode.SUCCESS, systemConfigService.selectByPrimaryKey(id));
		}catch(ErrorCodeException e){
			return new JsonBean(e.getErrorCode());
		}
	}

	@ApiOperation(value = "列出所有的SystemConfig")
	@RequestMapping(value = "/page",method = RequestMethod.GET)
	@ResponseBody
	public JsonBean<PageResponse<SystemConfig>> selectPage(@ApiParam(value = "用户token",required = true)@RequestParam(value = "token",required = true)String token,
														   @ApiParam(value = "从第几个开始列出") @RequestParam(required = false, defaultValue = "0")Integer offset,
	                                                       @ApiParam(value = "每页内容数量") @RequestParam(required = false, defaultValue = "10")Integer pageSize){
		try {
			User user = userBaseService.getUserByToken(token);
			return new JsonBean(ErrorCode.SUCCESS, systemConfigService.selectPageByBelong(offset,pageSize,user.getId()));
		} catch (ErrorCodeException e) {
			return new JsonBean(e.getErrorCode());
		}
	}

	@ApiOperation(value = "删除指定的SystemConfig")
	@RequestMapping(value = "/{id}",method = RequestMethod.DELETE)
	@ResponseBody
	public JsonBean deletePrimaryKey(@ApiParam(value = "查询主键", required = true)@PathVariable()Integer id){
		return new JsonBean(ErrorCode.SUCCESS, systemConfigService.deleteByPrimaryKey(id));
	}

}
