package com.shop.controller;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.shop.mapper.member.LoginMapper;
import com.shop.vo.All_User_Tbl;
 
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PwSettingTest {
 
	@Inject
    private LoginMapper logmapper;
    
    @Test
    public void testSetting() {
    	All_User_Tbl aut = new All_User_Tbl();
    	aut.setPw("6667777");
    	aut.setEmail("bomvll@naver.com");
    	
    	int a = logmapper.updatepw(aut);
    	System.out.println("몇개가 변경되는가 "+ a);
    }
 
}