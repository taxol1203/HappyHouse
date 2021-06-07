package com.ssafy.happyhouse.controller;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.House;
import com.ssafy.happyhouse.model.Interest;
import com.ssafy.happyhouse.model.service.HouseService;

import io.swagger.annotations.ApiOperation;

@CrossOrigin(origins = { "*" }, maxAge = 6000)
@RequestMapping("/house")
@Controller
public class HouseController {
	
	private static final Logger logger = LoggerFactory.getLogger(HouseController.class);
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	HouseService houseService;
	
	@GetMapping("/map")
	@ResponseBody
	@ApiOperation(value = "건물의 위치에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> select() {
		try {
			return new ResponseEntity<List<House>>(houseService.select(), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping("/dongList/{dong}")
	@ResponseBody
	@ApiOperation(value = "동 위치에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> selectAptDong(@PathVariable String dong) {
		try {
			return new ResponseEntity<List<House>>(houseService.selectDong(dong), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping("/aptList/{aptName}")
	@ResponseBody
	@ApiOperation(value = "아파트 이름에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> selectAptName(@PathVariable String aptName) {
		try {
			return new ResponseEntity<List<House>>(houseService.selectName(aptName), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	@GetMapping("/aptSearch/{aptName}")
	@ResponseBody
	@ApiOperation(value = "아파트 이름에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> searchAptName(@PathVariable String aptName) {
		try {
			aptName = "%" + aptName + "%";
			return new ResponseEntity<List<House>>(houseService.searchName(aptName), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	// 관심 아파트 가져오기
	@GetMapping("/interest/{userId}")
	@ResponseBody
	@ApiOperation(value = "아파트 이름에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> selectInterApt(@PathVariable String userId) {
		try {
			return new ResponseEntity<List<House>>(houseService.selectInterApt(userId), HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}	
	
	// 관심 아파트 등록
	@GetMapping("/interest_ins/{aptName}/{userId}/{dong}")
	@ResponseBody
	@ApiOperation(value = "관심 아파트를 등록한다.", response = List.class)
	public ResponseEntity<?> insertInterApt(@PathVariable String dong, @PathVariable String userId, @PathVariable String aptName) {
		Interest inte = new Interest(aptName, dong, userId );
		try {
			houseService.insertInterApt(inte);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	// 관심 아파트 삭제
	@GetMapping("/interest_del/{userId}/{aptName}")
	@ResponseBody
	@ApiOperation(value = "아파트 이름에 해당하는 리스트를 반환한다.", response = List.class)
	public ResponseEntity<?> deleteInterApt(@PathVariable String userId, @PathVariable String aptName) {
		Interest inte = new Interest(aptName, userId );
		System.out.println(aptName);
		try {
			houseService.deleteInterApt(inte);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (SQLException e) {
			e.printStackTrace();
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	
	
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
//	public String list(@RequestParam Map<String, String> map, Model model) throws Exception {
//		String searchField = map.get("searchField");
//		String searchText = map.get("searchText");
//		if (searchField == null)
//			searchField = "";
//		if (searchText == null)
//			searchText = "";
//		
//		try {
//			List<House> houses = null;
//			switch (searchField) {
//			case "NAME": // 건물명
//				System.out.println("검색 : " + searchText);
//				houses = houseService.selectName("%" + searchText + "%"); // %요소% 하면 앞뒤 글자 몇개 오던지 상관없이 다검색
//				break;
//			case "DONG": // 건물명
//				System.out.println("검색 : " + searchText);
//				houses = houseService.selectDong("%" + searchText + "%");
//				break;
//			case "PRICE": // 가격별
//				System.out.println("검색 : " + searchText);
//				houses = houseService.selectPrice(Integer.parseInt(searchText));
//				break;
//			default: // 기본은 전 목록
//				houses = houseService.select();
//				break;
//			}
//
//			// 어떤걸로 검색했는지 화면에 보여주기 위해서 세팅
//			model.addAttribute("houses", houses);
//			model.addAttribute("searchField", searchField);
//			model.addAttribute("searchText", searchText);
//			return "index";
//		} catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
	
	/*
	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ResponseEntity<?> list(@RequestParam Map<String, String> map) throws Exception {
		String searchField = map.get("searchField");
		String searchText = map.get("searchText");
		if (searchField == null)
			searchField = "";
		if (searchText == null)
			searchText = "";
		
		try {
			List<House> houses = null;
			switch (searchField) {
			case "NAME": // 건물명
				System.out.println("검색 : " + searchText);
				houses = houseService.selectName("%" + searchText + "%"); // %요소% 하면 앞뒤 글자 몇개 오던지 상관없이 다검색
				break;
			case "DONG": // 건물명
				System.out.println("검색 : " + searchText);
				houses = houseService.selectDong("%" + searchText + "%");
				break;
			case "PRICE": // 가격별
				System.out.println("검색 : " + searchText);
				houses = houseService.selectPrice(Integer.parseInt(searchText));
				break;
			default: // 기본은 전 목록
				houses = houseService.select();
				break;
			}
			
			System.out.println(houses);
			// 어떤걸로 검색했는지 화면에 보여주기 위해서 세팅
//			model.addAttribute("houses", houses);
//			model.addAttribute("searchField", searchField);
//			model.addAttribute("searchText", searchText);
			
			//return "index";
			return new ResponseEntity<List<House>>(houses, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			//model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
		}
	}
	*/
	
//	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
//	public String view(@PathVariable("no") String no, Model model) throws Exception {
//		try {
//			House house= houseService.selectOne(Integer.parseInt(no));
//			model.addAttribute("house", house);
//			return "view_house";
//		}catch (Exception e) {
//			e.printStackTrace();
//			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
//			return "error/error";
//		}
//	}
}