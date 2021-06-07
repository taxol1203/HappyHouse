package com.ssafy.happyhouse.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.model.Region;
import com.ssafy.happyhouse.model.User;
import com.ssafy.happyhouse.model.service.RegionService;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService uSvc;
	@Autowired
	private RegionService regionService;

	@GetMapping({ "/", "/index"})
	public String index(HttpSession session) {
		session.removeAttribute("dongInfo");
		return "index";
	}	
	
	@GetMapping("/selDong/{dong}")
	public String selectOneDong(@PathVariable String dong, HttpSession session, Model m) {
		Region region = null;
		try {
			region = regionService.selectOneDong(dong);
//			System.out.println(region);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("dongInfo", region);
		return "index";
	}
	
	@RequestMapping("/error/404")
	public String error404() {
		return "error/404";
	}

	@RequestMapping("/error/500")
	public String error500() {
		return "error/500";
	}

	@PostMapping("/login")
	public String login(User user, HttpSession session, Model m) {
		User selected = uSvc.userSelect(user.getId());
		if (selected != null && selected.getPass().equals(user.getPass())) {
			session.setAttribute("userinfo", selected);
			return "redirect:/";
		} else {
			m.addAttribute("msg", "로그인 실패");
			return "index";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

	@PostMapping("/join")
	public String join(User user, Model m) {
		if (user.getId().equals("") || user.getPass().equals("") || user.getName().equals("")
				|| user.getAddr().equals("") || user.getPhone().equals("")) {
			m.addAttribute("msg", "빈칸을 모두 입력해 주세요.");
			return "index";
		}
		uSvc.userRegister(user);
		return "redirect:/index";
	}

	@PostMapping("/modify")
	public String modify(HttpSession session, User user, Model m) {
		if (user.getPass().equals("") || user.getName().equals("") || user.getAddr().equals("")
				|| user.getPhone().equals("")) {
			m.addAttribute("msg", "빈칸을 모두 입력해 주세요.");
			return "index";
		}
		uSvc.userModify(user);
		session.invalidate();
		return "redirect:/index";
	}

	@GetMapping("/delete")
	public String delete(HttpSession session, String id) {
		uSvc.userDelete(id);
		session.invalidate();
		return "redirect:/index";
	}
}
