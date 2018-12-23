package com.xiaochai.service.logistics.mapper.order;

import com.xiaochai.service.logistics.model.order.Order;
import com.xiaochai.service.logistics.model.system.Defind;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @author: xiaochai
 * @create: 2018-12-23
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class OrderMapperTest {

    @Autowired
    OrderMapper orderMapper;

    @Test
    public void insert() {
        Order order = new Order();
        order.setOrder_number("00000");
        order.setSerial_number("00000");
        order.setFk_customer_id(251);
        order.setIs_company(true);
        order.setFk_want_company_id(135);
        order.setStatus(Defind.ORDER_PLACE);
        order.setTime(new Date());
        int result = orderMapper.insert(order);
        assertEquals(1, result);
    }

    @Test
    public void update() {
        Order order = new Order();
        order.setId(475);
        order.setOrder_number("00000");
        order.setSerial_number("11111");
        order.setFk_customer_id(250);
        order.setIs_company(true);
        order.setFk_want_company_id(135);
        order.setStatus(Defind.ORDER_TAKING);
        order.setTime(new Date());
        int result = orderMapper.update(order);
        assertEquals(1, result);
    }

    @Test
    public void selectByPrimaryKey() {
        Order result = orderMapper.selectByPrimaryKey(300);
        assertNotNull(result.getId());
    }

    @Test
    public void selectPage() {
        List<Order> result = orderMapper.selectPage(0, 10);
        assertNotEquals(0, result.size());
    }

    @Test
    public void count() {
        int result = orderMapper.count();
        assertNotEquals(-1, result);
    }

    @Test
    public void deleteByPrimaryKey() {
        int result = orderMapper.deleteByPrimaryKey(300);
        assertEquals(1, result);
    }

    @Test
    public void selectPageByStatus() {
        List<Order> orderList = orderMapper.selectPageByStatus(0, 10, Defind.ORDER_PLACE);
        assertNotEquals(0, orderList.size());
    }

    @Test
    public void countByStatus() {
        int result = orderMapper.countByStatus(Defind.ORDER_TAKING);
        assertNotEquals(-1, result);
    }

    @Test
    public void selectPageByCustomer() {
        Integer offset = 0;
        Integer pageSize = 10;
        Integer fk_customer_id = 251;
        List<Order> orderList = orderMapper.selectPageByCustomer(offset, pageSize, fk_customer_id);
        assertNotNull(orderList);
    }

    @Test
    public void countByCustomer() {
        Integer fk_customer_id = 251;
        int result = orderMapper.countByCustomer(fk_customer_id);
        assertNotEquals(-1, result);
    }

    @Test
    public void selectPageByCompany() {
        Integer offset = 0;
        Integer pageSize = 10;
        Integer fk_company_id = 135;
        List<Order> orderList = orderMapper.selectPageByCompany(offset, pageSize, fk_company_id);
        assertNotNull(orderList);
    }

    @Test
    public void countByCompany() {
        Integer fk_company_id = 251;
        int result = orderMapper.countByCompany(fk_company_id);
        assertNotEquals(-1, result);
    }

    @Test
    public void selectPageByCompanyAndStatus() {
        Integer offset = 0;
        Integer pageSize = 10;
        Integer fk_company_id = 135;
        String status = Defind.ORDER_TAKING;

        List<Order> orderList = orderMapper.selectPageByCompanyAndStatus(offset, pageSize, fk_company_id, status);
        assertNotNull(orderList);
    }

}