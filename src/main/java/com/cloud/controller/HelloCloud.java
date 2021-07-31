package com.cloud.controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import java.net.InetAddress;
import com.cloud.model.CloudBasic;

@RestController
@RequestMapping("/cloud/v1")
public class HelloCloud {
	private static final Logger LOGGER = LogManager.getLogger();
	private static final String ENV_KEY_HOSTNAME = "HOSTNAME";
	private static final String HOSTNAME_NOTFOUND = "HOSTNAME_NOTFOUND";
	@Autowired
	private Environment env;

	@GetMapping("/basic1")
	public ResponseEntity<?> getCloudBasicDetails() {
		LOGGER.info("** START OF THE REQUEST ****#");
		CloudBasic basic = new CloudBasic();
		basic.setGreeting("Hello World");
		LOGGER.info("** END OF THE RESPONSE {} ****#", basic);
		return new ResponseEntity<>(basic, generateResponseHeader(), HttpStatus.OK);
	}
	@GetMapping("/basic2")
	public HttpHeaders generateResponseHeader() {
		HttpHeaders responseHeaders = new HttpHeaders();
		InetAddress ip;
		try{
			ip=InetAddress.getLocalHost();
			String hostName=ip.getHostName();
			System.out.println("########"+hostName);
			LOGGER.info("** instanceId {} ****", hostName);
		responseHeaders.set("instanceId", hostName != null ? hostName : HOSTNAME_NOTFOUND);
			
			
		}catch(Exception e){
		}
		//String hostName = env.getProperty(ENV_KEY_HOSTNAME);
		
		return responseHeaders;
	}
}
