package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.Region;
import com.ssafy.happyhouse.model.service.RegionService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@Controller
@RequestMapping("/region")
public class RegionController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";
	
	@Autowired
	private RegionService regionService;
	
	@GetMapping("/Gu/{city}")
	@ResponseBody
	@ApiOperation(value = "도시에 해당하는 구 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> select(@PathVariable String city) {
		try {
			return new ResponseEntity<List<String>>(regionService.selectGu(city), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping("/Dong/{gu}")
	@ResponseBody
	@ApiOperation(value = "도시에 해당하는 구 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> selectDong(@PathVariable String gu) {
		try {
			return new ResponseEntity<List<Region>>(regionService.selectDong(gu), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	
	
	
}
