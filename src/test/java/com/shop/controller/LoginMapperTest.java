package com.shop.controller;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.shop.mapper.member.LoginMapper;
import com.shop.service.member.LoginServiceImple;
import com.shop.vo.All_User_Tbl;
import com.shop.vo.Login;

import lombok.Setter;
 
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class LoginMapperTest {
 
	@Setter(onMethod_=@Autowired)
	private LoginMapper logmapper;
    
    @Test
    public void testUpdatePw() {
    	All_User_Tbl aut = new All_User_Tbl();
    	aut.setPw("!!123456");
    	aut.setEmail("bomvll@naver.com");

    	logmapper.updatepw(aut);
    }
 
}