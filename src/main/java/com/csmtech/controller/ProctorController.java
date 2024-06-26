package com.csmtech.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.csmtech.model.Exam;
import com.csmtech.model.Items;
import com.csmtech.model.Question;
import com.csmtech.model.User;
import com.csmtech.service.ExamService;
import com.csmtech.service.ItemService;
import com.csmtech.service.QuestionService;
import com.csmtech.service.UserService;

@Controller
@RequestMapping("exam")
public class ProctorController {

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private UserService userService;
	
	@Autowired
	private QuestionService questionService;

	@Autowired
	private ExamService examService;
	
	@Autowired
	private ItemService itemService;

	@GetMapping("/forgetPassword")
	public String forgetPassword(Model model) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());

		System.out.println("get............");
		return "proctor/resetPassword";

	}

	@PostMapping("/changepassword")
	public String changePassword(@RequestParam("newpassword") String newPassword,
			@RequestParam("cpassword") String cpassword, Model model,
			@RequestParam(value = "userid", required = false) Integer userid) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("userid", user.getUserId());

		// User userchnage = new User();
		if (newPassword.equals(cpassword)) {
			if (userid != null)
				user.setPassword(cpassword);
			userService.saveDetailsOfUser(user);

		} else {
			model.addAttribute("msg", "Entered password is wrong..!! ");
			System.out.println("error");
		}

		return "proctor/resetPassword";
	}

	@GetMapping("/manageProfile")
	public String getmanageProfile(Model model) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		return "proctor/manageProfile";
	}
	
	@GetMapping("/getQuestion")
	public String getQuestion(Model model) {
		model.addAttribute("codelist", examService.findAllExamCode());
		System.out.println(itemService.findAllItem());
		model.addAttribute("allListItem",itemService.findAllItem());
		return "proctor/addQuestion";
	}

	@PostMapping("/questionAdd")
	public String addQuestion( @RequestParam("examCode") Exam examId,
			 @RequestParam("itemName") Items itemId,
			@RequestParam("questionText") String questText,
			@RequestParam("questionType") String questType,Model model) {
		Question qs = new Question();
		
		qs.setQuestionText(questText);
		//qs.setQuestionType(questType);
//		qs.setExam(examId);
		//qs.setItem(itemId);
		qs.setQuestionStatus("0");
//		qs.setExamCode(examId.getExamCode());
		System.out.println(qs + "SDFGHJKI");
		questionService.saveQuestion(qs);
		System.out.println("inside save qst......");
		return "redirect:/exam/getQuestion";
	}

	
}
