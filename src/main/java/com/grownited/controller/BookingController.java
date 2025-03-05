package com.grownited.controller;

import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookingController {

	//booking jsp
	@GetMapping("/bookingservice")
	public String bookingService(@RequestParam("categoryId") UUID categoryId,@RequestParam("providerId") UUID providerId,@RequestParam("serviceId") UUID serviceId,@RequestParam("packageId") UUID packageId) {
		
		
		return "BookingService";
	}
	
}
