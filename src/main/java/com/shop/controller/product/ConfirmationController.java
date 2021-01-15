package com.shop.controller.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.service.product.ConfirmationService;
import com.shop.vo.Order_Histroy_Tbl;
import com.shop.vo.Return_End_Tbl;
import com.shop.vo.Return_Tbl;
import com.shop.vo.User_Tbl;

import lombok.Setter;


@Controller
@RequestMapping("/carshop/*")
public class ConfirmationController {
	
	@Setter(onMethod_ = @Autowired)
	private ConfirmationService service;
	
	@GetMapping("/confirmation")
	public String getConfirmation(Model model, HttpSession session, Order_Histroy_Tbl order, User_Tbl user) {
		
		//유저의 주문 결제이력 창 (재원/21.0.13)
		try {
			
			//세션의 get attribute로 id 가져옴 (재원/20.12.31)
			String getId = (String)session.getAttribute("id"); 
			
			//유저 테이블에 id가 없을 경우 NullPointerException이 발생하므로 try catch로 예외처리 (재원/21.0.13)
			//userList는 getId가 db의 유저테이블에 데이터로 있는지 판단하기 위함 (재원/21.01.13)
			//유저테이블에 id가 같을 경우 가져옵니다. (재원/21.0.13)
			String userList = "";			
			try {
					userList = service.isUser(getId).getU_id();	
				}catch(NullPointerException e) {
					userList = null;
			}
			
			//일반 유저가 아닌 경우 에러페이지로 이동합니다.(재원/21.0.13)
			if(userList == null || userList.equals("") || userList.equals(null)) {
				return "carshop/errorForbidden";
			}
			else {
			//일반 유저가 맞는 경우 setter로 id 가져옵니다. (재원/21.0.13)
				user.setU_id(getId);
				
				//교환 반품 폼 작성 확인용 List들 (재원/21.01.12)
				
				//현재 주문이력을 조회합니다. (재원/21.01.12)
				List<Order_Histroy_Tbl> list = service.formList(user.getU_id());
				//교환 반품을 신청한 이력을 조회합니다. (재원/21.01.12)
				List<Return_Tbl> listr = service.findRefund(user.getU_id());
				//판매자에게 교환반품 확인을 받은 이력을 조회합니다. (재원/21.01.12)
				List<Return_End_Tbl> listre = service.findrealRefund(user.getU_id());
				
				//list 들에 걸리지 않는 예외 발생 할 수 있어, try catch (재원/21.01.12)
				try {
					
					for(int i=0; i<list.size();i++) {
						for(int j=0; j<listr.size(); j++) {
							//구매자의 주문이력 중 교환반품 신청한 이력의 list들과 동일한 ono가 존재할시 vo의 o_no에 ono를 setter로 저장합니다. (재원/21.01.12)
							if(listr.get(j).getOno() == list.get(i).getOno())
							{
								list.get(i).setO_no(list.get(i).getOno());
								System.out.println(list.get(i).getO_no());
							}
						}
						
						for(int k=0; k<listre.size(); k++) {
							//구매자의 주문이력 중 판매자가 승인한 교환반품 list들과 동일한 ono가 존재할시 vo의 o_no2에 ono를 setter로 저장합니다. (재원/21.01.12)
							if(listre.get(k).getOno() == list.get(i).getOno())
							{
								
								list.get(i).setO_no2(list.get(i).getOno());
								System.out.println(list.get(i).getO_no2());
							}
						}
					}
					
					list.stream().forEach(System.out::println);
					
				}catch(Exception e) {
					e.getMessage();
				}
				
				//model addAttribut를 통해 for문을 통과한 list를 key value로 jsp로 태웁니다. (재원/21.01.12)
				model.addAttribute("buylist",  list);

				return "carshop/confirmation";
				
			}	
			
		}
		catch(Exception e) {
			e.printStackTrace();
			return "carshop/error";
		}
		
		
	}
	
	@PostMapping("/isRefundTrue") 
	@ResponseBody
	public boolean isRefundTrue (@RequestParam(value = "ono") int ono) {

		//교환반품 신청이 된 주문번호를 확인합니다.(재원/21.01.12)
		//returntbl에 없으면 true 있으면 false(재원/21.01.12)
		return service.returnOne(ono);
		
	}
	

	@GetMapping("/clickdateOrder")
	@ResponseBody
	public List<Order_Histroy_Tbl> order_dates(@RequestParam("order_date") String order_date, @RequestParam("u_id") String u_id) {

		//캘린더의 날짜를 클릭했을 때 해당 날짜에 구매한 상품들을 확인할 수 있습니다.(재원/21.01.12)
		//ajax로 데이터를 보내주기 때문에 list odr를 return함 (재원/21.01.12)
		
		//해당 날짜에 구매한 상품들을 odr list에 담습니다. (재원/21.01.13)
		List<Order_Histroy_Tbl> odr = service.orderListDate(u_id, order_date);
		//confirmation getMapping의 교환반품 확인과 이하 동문  (재원/21.01.12)
		List<Return_Tbl> listr = service.findRefund(u_id);
		List<Return_End_Tbl> listre = service.findrealRefund(u_id);
		
		try {
		
			for(int i=0; i<odr.size();i++) {
				for(int j=0; j<listr.size(); j++) {
					if(listr.get(j).getOno() == odr.get(i).getOno())
					{
						odr.get(i).setO_no(odr.get(i).getOno());
						System.out.println(odr.get(i).getO_no());
					}
				}
				
				for(int k=0; k<listre.size(); k++) {
					if(listre.get(k).getOno() == odr.get(i).getOno())
					{
						
						odr.get(i).setO_no2(odr.get(i).getOno());
						System.out.println(odr.get(i).getO_no2());
					}
				}
			}
			
			//odr.stream().forEach(System.out::println);	
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		

		return odr;

	}
	
	@GetMapping("/clickeventOrder")
	@ResponseBody
	public List<Order_Histroy_Tbl> order_events(@RequestParam("ono") int ono, @RequestParam("order_date") String order_date, @RequestParam("u_id") String u_id) {
		
		//캘린더의 주문 이벤트를 클릭했을 때 해당 날짜에 특정 주문번호로 구매한 상품들을 확인할 수 있습니다.(재원/21.01.12)
		//ajax로 데이터를 보내주기 때문에 list odr를 return함 (재원/21.01.12)
		
		//해당 날짜에 구매한 특정 주문번호의 상품들을 odr list에 담습니다. (재원/21.01.13)
		List<Order_Histroy_Tbl> odr = service.orderEventLists(u_id, order_date, ono);
		//confirmation getMapping의 교환반품 확인과 이하 동문  (재원/21.01.12)
		List<Return_Tbl> listr = service.findRefund(u_id);
		List<Return_End_Tbl> listre = service.findrealRefund(u_id);

		try {

			for(int i=0; i<odr.size();i++) {
				//System.out.println("들어오는지");
				for(int j=0; j<listr.size(); j++) {
					if(listr.get(j).getOno() == odr.get(i).getOno())
					{
						odr.get(i).setO_no(odr.get(i).getOno());
						System.out.println(odr.get(i).getO_no());
					}
				}
				
				for(int k=0; k<listre.size(); k++) {
					if(listre.get(k).getOno() == odr.get(i).getOno())
					{
						
						odr.get(i).setO_no2(odr.get(i).getOno());
						System.out.println(odr.get(i).getO_no2());
					}
				}
			}
			
			//odr.stream().forEach(System.out::println);	
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return odr;

	}
	
	@PostMapping("/confirmation")
	@ResponseBody
	public String getCallenderTitle(Return_Tbl returntbl) {
		
		//returntbl에 교환 폼의 정보를 insert 합니다.(재원/21.01.13)
		service.insertForms(returntbl);
		return "redirect:/carshop/confirmation";
		
	}
	
	
}
