package com.xiaochai.service.logistics.service.order;

import com.xiaochai.service.logistics.exception.ErrorCodeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.xiaochai.service.logistics.json.response.PageResponse;
import com.xiaochai.service.logistics.model.order.OrderStatusValue;
import com.xiaochai.service.logistics.mapper.order.OrderStatusValueMapper;

@Service
public class OrderStatusValueService{
	@Autowired
	private OrderStatusValueMapper orderStatusValueMapper;

	public OrderStatusValue insert(String value,String remark){
		OrderStatusValue orderStatusValue = new OrderStatusValue();
		orderStatusValue.setValue(value);
		orderStatusValue.setRemark(remark);
		orderStatusValueMapper.insert(orderStatusValue);
		return orderStatusValue;
	}

	public OrderStatusValue update(Integer id,String value,String remark) throws ErrorCodeException {
		OrderStatusValue orderStatusValue = orderStatusValueMapper.selectByPrimaryKey(id);
		if(orderStatusValue == null){
			throw new ErrorCodeException(ErrorCodeException.DATA_NO_ERROR);
		}
		orderStatusValue.setValue(value);
		orderStatusValue.setRemark(remark);
		orderStatusValueMapper.update(orderStatusValue);
		return orderStatusValue;
	}

	public OrderStatusValue selectByPrimaryKey(Integer id) throws ErrorCodeException{
		OrderStatusValue orderStatusValue = orderStatusValueMapper.selectByPrimaryKey(id);
		if(orderStatusValue == null){
			throw new ErrorCodeException(ErrorCodeException.DATA_NO_ERROR);
		}
		return orderStatusValue;
	}

	public PageResponse<OrderStatusValue> selectPage(Integer offset,Integer pageSize){
		PageResponse<OrderStatusValue> response = new PageResponse();
		response.setItem(orderStatusValueMapper.selectPage(offset,pageSize));
		response.setTotal(orderStatusValueMapper.count());
		response.setOffset(offset);
		response.setPageSize(pageSize);
		return response;
	}

	public int deleteByPrimaryKey(Integer id){
		return orderStatusValueMapper.deleteByPrimaryKey(id);
	}

}
