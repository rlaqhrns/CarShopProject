package com.shop.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.mapper.product.CheckOutMapper;

import lombok.Setter;

@Service
public class CheckOutServiceImple {
	@Setter(onMethod_ =@Autowired)
	private CheckOutMapper mapper;
}
