package com.xiaochai.service.logistics.controller.order;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.*;

/**
 * @author: xiaochai
 * @create: 2018-12-23
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
@Transactional
public class OrderControllerTest {

    @Autowired
    private WebApplicationContext wac;

    private MockMvc mockMvc;

    @Before
    public void setUp(){
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }


    @Test
    public void selectPage() throws Exception {

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/all")
                .param("offset","0")
                .param("pageSize","10")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectByPrimaryKey() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/228")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByCustomerToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String user_token = "2f8c26ee64159fdc";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/customer")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", user_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByCompanyToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String company_token = "9e97986ca15bd0f9";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/company")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", company_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByCompanyOpenToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String company_token = "9e97986ca15bd0f9";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/company/open")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", company_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByCompanyWantToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String company_token = "9e97986ca15bd0f9";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/company/want")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", company_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByDriverToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String driver_token = "6f8c26ee64159fdg";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page/driver")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", driver_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    /**
     * 根据司机Token列出派车的Order
     * @throws Exception
     */
    @Test
    public void selectPageTakingByDriverToken() throws Exception {

        String offset = "0";
        String pageSize = "10";
        String driver_token = "6f8c26ee64159fdg";

        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page_taking/driver")
                .param("offset", offset)
                .param("pageSize",pageSize)
                .param("token", driver_token)
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    /**
     * 列出待处理的Order
     * @throws Exception
     */
    @Test
    public void selectPageByPLACE() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page_place")
                .param("offset","0")
                .param("pageSize","10")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageByREFUSE() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page_refuse")
                .param("offset","0")
                .param("pageSize","10")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    /**
     * 列出已处理的Order
     * @throws Exception
     */
    @Test
    public void selectPageByTAKING() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page_taking")
                .param("offset","0")
                .param("pageSize","10")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void selectPageBySIGN() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.get("/v1/order/page_sign")
                .param("offset","0")
                .param("pageSize","10")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }

    @Test
    public void deleteByPrimaryKey() throws Exception {
        String result = mockMvc.perform(MockMvcRequestBuilders.delete("/v1/order/299")
                .contentType(MediaType.APPLICATION_JSON_UTF8))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.jsonPath("$.success").value("true"))
                .andReturn().getResponse().getContentAsString();

        System.out.println(result);
    }
}