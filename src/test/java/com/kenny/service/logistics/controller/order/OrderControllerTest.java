package com.kenny.service.logistics.controller.order;

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
import org.springframework.web.context.WebApplicationContext;

import static org.junit.Assert.*;

/**
 * @author: xiaochai
 * @create: 2018-12-23
 **/
@RunWith(SpringRunner.class)
@SpringBootTest
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
    public void selectByPrimaryKey() {
    }

    @Test
    public void selectPageByCustomerToken() {
    }

    @Test
    public void selectPageByCompanyToken() {
    }

    @Test
    public void selectPageByCompanyOpenToken() {
    }

    @Test
    public void selectPageByCompanyWantToken() {
    }

    @Test
    public void selectPageByDriverToken() {
    }

    @Test
    public void selectPageTakingByDriverToken() {
    }

    @Test
    public void selectPageByPLACE() {
    }

    @Test
    public void selectPageByREFUSE() {
    }

    @Test
    public void selectPageByTAKING() {
    }

    @Test
    public void selectPageBySIGN() {
    }

    @Test
    public void deleteByPrimaryKey() {
    }
}