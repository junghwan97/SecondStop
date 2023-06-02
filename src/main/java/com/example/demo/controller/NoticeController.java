package com.example.demo.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

import com.example.demo.domain.*;
import com.example.demo.service.*;


@Controller
@RequestMapping("notice")
public class NoticeController {
	
	@Autowired
	NoticeService service;

	@GetMapping("/noticeList")
	public String list(Model model, 
					   @RequestParam(value = "page", defaultValue = "1") Integer page,
					   @RequestParam(value = "search", defaultValue = "") String search,
					   @RequestParam(value = "type", required = false) String type) {

		Map<String, Object> result = service.listNotice(page, search, type); 
		model.addAllAttributes(result);

		return "noticeList";
	}
	
	@GetMapping("/noticeId/{id}")
	public String board(
			@PathVariable("id") Integer id, 
			Model model,
			Authentication authentication) {

		Notice notice = service.getNotice(id);
		model.addAttribute("notice", notice);
		return "getNotice";
	}
	
	@GetMapping("/addNotice")
	public String noticeAddForm() {
		
		return "addNotice";
	}
	
	@PostMapping("/addNotice")
	public String addNoticeProcess(Notice notice) throws Exception {

		boolean ok = service.addNotice(notice);
		if (ok) {
			return "redirect:/notice/noticeId/" + notice.getId();
		} else {
			return "redirect:/notice/addNotice";
		}
	}
	
	
	@PostMapping("removeNotice")
	public String noticeRemoceProcess(Integer id) {
		
		boolean ok = service.removeNotice(id);
		
		if(ok) {
			return "redirect:/notice/noticeList";
		}else {
			return "redirect:/notice/getNotice";			
		}
	}
	
	@GetMapping("update/{id}")
	public String noticeUpdateFrom(@PathVariable ("id") Integer id, Model model) {
		Notice notice = service.getNotice(id);
		model.addAttribute("notice", notice);
		return "updateNotice";
	}
	
	@PostMapping("update/{id}")
	public String noticeUpdateProcess(Notice notice) {
	
		boolean ok = service.update(notice);
		if(ok) {
			return "redirect:/notice/noticeId/" + notice.getId();			
		}else {
			return "redirect:/notice/updateNotice/" + notice.getId();						
		}
	}
}