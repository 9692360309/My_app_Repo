package com.csmtech.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Collections;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.exporter.CandidateExcelExporter;
import com.csmtech.exporter.ResultExcelExporter;
import com.csmtech.model.Candidate;
import com.csmtech.model.Configure;
import com.csmtech.model.Exam;
import com.csmtech.model.Question;
import com.csmtech.model.Role;
import com.csmtech.model.SubTestTaker;
import com.csmtech.model.TestTaker;
import com.csmtech.model.User;
import com.csmtech.service.CandidateService;
import com.csmtech.service.ConfigureService;
import com.csmtech.service.ExamService;
import com.csmtech.service.QuestionService;
import com.csmtech.service.RoleService;
import com.csmtech.service.SubTestTakerService;
import com.csmtech.service.TestTakerService;
import com.csmtech.service.UserService;

@Controller
@RequestMapping("/exam")
public class MyController {

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private CandidateService candService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

	@Autowired
	private ExamService examService;

	@Autowired
	private QuestionService questionService;

	@Autowired
	private ConfigureService configureService;

	@Autowired
	private TestTakerService testTakerService;

	@Autowired
	private SubTestTakerService subTestTakerService;

	@Autowired
	private CandidateController candidateController;

	@GetMapping("/login")
	public String getLoginPage(Model model) {
		System.out.println("getting......");
		return "pageLogin";

	}

//	@GetMapping("/logout")
//	public String getLogout() {
//
//		httpSession.removeAttribute("sessionData");
//		httpSession.removeAttribute("savesubItem");
//		System.out.println(httpSession.getAttribute("sessionData"));
//		System.out.println("I am Inside logout part");
//		return "redirect:./login";
//	}

	@RequestMapping("/error")
	public String handleError() {
		return "error"; // Return the name of your custom error page (error.html)
	}

	@GetMapping("/logout")
	public String getLogout(HttpServletResponse response) {
		// Clear session attributes
		httpSession.removeAttribute("sessionData");
		httpSession.removeAttribute("savesubItem");

		// Prevent caching
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
		response.setHeader("Pragma", "no-cache"); // HTTP 1.0
		response.setHeader("Expires", "0"); // Proxies

		return "redirect:./login?logout=true"; // Add cache-busting parameter
	}

	@PostMapping("/loginHere")

	public String loginAdminHere(@RequestParam String username, @RequestParam String password, Model model,

			RedirectAttributes rd, HttpServletRequest req) throws ParseException {

		// RedirectAttributes rd) {

		boolean flag = true;

		System.out.println("+++++" + username);

		System.out.println(password);

		// String decodedPassword = decodeText(password);

		User user = userService.findUserByUsernameAndPasswordForCheck(username, password);

		flag = userService.findUserByUsernameAndPassword(username, password);

		if (flag) {

			int roleid = userService.findRoleIdByUsernameAndPassword(username, password);

			Role role = roleService.findById(roleid);

			System.out.println(roleid);

			String roleName = role.getRoleName();

			httpSession.setAttribute("sessionData", user);

			if ("Admin".equals(username) && user.getPassword().equals(password)) {

				System.out.println("roleName   " + username);

				rd.addFlashAttribute("alert", "success");

				return "redirect:./adminDashboard";

			} else if ("Proctor".equals(username) && user.getPassword().equals(password)) {

				model.addAttribute("username", user.getName());

				return "proctor/proctorDashboard";

			} else if ("Hr".equals(username) && user.getPassword().equals(password)) {

				model.addAttribute("username", user.getName());

				return "hr/hrDashboard";

			}

			else {
				model.addAttribute("invalid", "login failed");
			}

		}

		else {

			Candidate c = candService.getCandidateByEmail(username);

			try {

				System.out.println(c + " candidate here");

				String pass = CandidateController.decodeText(c.getCandpassword());

			} catch (Exception e) {

				System.out.println("exception handled");

				e.printStackTrace();

				return "redirect:./adminDashboard";

			}

			String pass = CandidateController.decodeText(c.getCandpassword());

			System.out.println("decode password" + pass);

			String candPassword = c.getCandpassword();

			Candidate cand = candService.findCandidateByCandnameAndPassword(username, candPassword);

			System.out.println("INSIDE ELSE");

			System.out.println("____--------------" + cand);

			System.out.println("first password" + password);

			if (pass.equals(password)) {

				System.out.println("password matched successfully");

				if (cand != null) {

					System.out.println("candidate kitne"+cand);

					httpSession.setAttribute("sessionData1", cand);
					Configure config =
					configureService.findConfigureBySubTestTakerId(cand.getSubTestTaker().getSubTestTakerId());
					LocalDateTime of = LocalDateTime.of(config.getTestDate(),
					config.getLoginTime());
					long examLogin = of.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
					LocalDateTime of1 = LocalDateTime.of(config.getTestDate(),
					config.getStartTime());
					long startExam = of1.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
					LocalDateTime of2 = LocalDateTime.of(config.getTestDate(), config.getEndTime());
					long endExam = of2.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
					long currentTime = System.currentTimeMillis();
					HashMap<String, Long> mp = new HashMap<>();
					mp.put("examLogin", examLogin);
					mp.put("startExam", startExam);
					mp.put("endExam", endExam);
					mp.put("currentTime", currentTime);
					model.addAllAttributes(mp);
					return "candidate/candidateDashboard";


				}

			}

		}
		rd.addFlashAttribute("alert","failed");
		return "redirect:./login";

	}

	@GetMapping("/adminDashboard")

	public String adminDashboard(Model model, RedirectAttributes rd) {

		User user = (User) this.httpSession.getAttribute("sessionData");

		System.out.println(" here inside admindashboard");

		if (user == null) {
			rd.addFlashAttribute("alert", "failed");

			return "redirect:./login";

		}

		else

			model.addAttribute("username", user.getName());

		return "admin/adminDashboard";

	}

	@GetMapping("/addCandidate")
	public String addCandPage(Model model) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("codelist", examService.findAllExamCode());
		model.addAttribute("allCandidate", candService.findAllCandidate());

		return "admin/addCandidate";

	}

	@GetMapping("/deleteCandidate")
	public String deleteCandidateById(@RequestParam("candid") Integer candid) {

		candService.deleteCandidateById(candid);
		return "redirect:./addCandidate";
	}

	@GetMapping("/updateCandidate")
	public String updateStudentForm(Model model, @RequestParam("candid") Integer candid) {
		System.out.println(candid);
		System.out.println(candService.updateCandidateById(candid));
		model.addAttribute("cand", candService.updateCandidateById(candid));

		return "forward:/exam/addCandidate";
	}

	@GetMapping("/manageUsers")
	public String manageUser(Model model) {
		List<Role> role = roleService.findAllRole();
		model.addAttribute("roleList", role);
		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("allUser", userService.getAllUser());

		return "admin/userManage";

	}

	@PostMapping("getUserById")
	@ResponseBody
	public User getUser(Integer userId) {
		System.out.println("getting+++++++++++++++" + userService.findUserDetailsById(userId));
		return userService.findUserDetailsById(userId);
	}

	@PostMapping("/saveUserDetails")
	public String addUser(@RequestParam(value = "userId", required = false) Integer userId,
			@RequestParam("name") String name, @RequestParam("username") String userName,
			@RequestParam("email") String email, @RequestParam("mobileNo") String mobileNo,
			@RequestParam("gender") String gender, @RequestParam("userAddress") String address,
			@RequestParam("role") Role userRole, Model model, RedirectAttributes rd) throws Exception {
		System.out.println("&&&&&&&&");

		boolean userExist = userService.getAllUser().stream().anyMatch(u -> u.getUsername().equalsIgnoreCase(userName));
		if (userExist) {
			rd.addFlashAttribute("exist", userName);
		} else {

			User user = new User();
			if (userId != null)
				user.setUserId(userId);
			user.setName(name);
			user.setUsername(userName);
			user.setPassword(userName + "@#");
			user.setEmail(email);
			user.setMobileNo(mobileNo);
			user.setGender(gender);
			user.setUserAddress(address);
			user.setRole(userRole);
			user.setIsDelete("No");
			user.setStatus("0");
			userService.saveDetailsOfUser(user);
			System.out.println("+++++++++++++++++++++" + user);
			rd.addFlashAttribute("userAdded", userName);
		}
		return "redirect:./manageUsers";

	}

	@GetMapping("/deleteUser")
	public String deleteUserById(@RequestParam("userId") Integer userId, RedirectAttributes rd) {
		userService.deleteUserById(userId);
		rd.addFlashAttribute("delete", "delete");
		return "redirect:./manageUsers";
	}

	@RequestMapping(path = "/updateUser")
	public String updateUser(@RequestParam(name = "userId") Integer userId, RedirectAttributes rd, Model model) {
		User us = userService.findUserDetailsById(userId);
		rd.addFlashAttribute("us", us);
		// model.addAttribute("us", us);
		System.out.println("!!!!!!!!!!!11" + us);
		return "redirect:./manageUsers";
	}

	@GetMapping(path = "/startExam")
	public String startExam() {
		System.out.println("yes....");
		return "candidate/questions";
	}

	@GetMapping("/getSubById")
	public void searchTest(@RequestParam(name = "testTakerId") Integer testTakerId, HttpServletResponse resp)
			throws IOException {
		System.out.println("&&&" + testTakerId);
		System.out.println("NM***" + subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId));

		List<SubTestTaker> sm = subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId);
		System.out.println("@@@@@" + sm);

		String filterAjaxValue = "<option value='0'>--select--</option>";
		for (SubTestTaker c : sm)

			filterAjaxValue += "<option value=" + c.getSubTestTakerId() + ">" + c.getSubTestTakerName() + "</option>";
		System.out.println("inside controller" + filterAjaxValue);

		resp.getWriter().print(filterAjaxValue);
	}

	@PostMapping("/searchTest")
	public String searchTest(@RequestParam(name = "testTakerName") Integer testTakerId,
			@RequestParam(name = "subTestTakerName") Integer subTetTakerId, Model model, RedirectAttributes rd) {
		System.out.println("test__" + testTakerId + "::" + "subTest___" + subTetTakerId);

		httpSession.setAttribute("subtesttakr", subTetTakerId);
		httpSession.setAttribute("testtaker", testTakerId);
		if (testTakerId == 0 && subTetTakerId == 0) {
			System.out.println("IFF");
			rd.addFlashAttribute("resultList", candService.findAllCandidate());
		} else if (testTakerId != 0 && subTetTakerId == 0) {
			System.out.println("WITH PROID:::" + testTakerId);
			rd.addFlashAttribute("resultList", candService.findCandidateByTestTakerId(testTakerId));
//			System.out.println("BYTEST---" + candService.findCandidateByTestTakerId(testTakerId));
		} else if (testTakerId != 0 && subTetTakerId != 0) {
			rd.addFlashAttribute("resultList",
					candService.findBytestTakerIdAndsubTetTakerId(testTakerId, subTetTakerId));
		}
		return "redirect:./result";
	}

	@RequestMapping("/result")
	public String viewResult(Model model, RedirectAttributes rd) {
		rd.addFlashAttribute("resultList", candService.findAllCandidate());
		model.addAttribute("testTakerList", testTakerService.getAll());

		return "admin/result";
	}

	@GetMapping("/export/Result")
	public void exportResult(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Result" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);
		Integer testTakerId = (Integer) httpSession.getAttribute("testtaker");
		Integer subtestTakerId = (Integer) httpSession.getAttribute("subtesttakr");
		List<Candidate> listCandidates = candService.getBytestTakerIdAndsubTetTakerId(testTakerId, subtestTakerId);

		ResultExcelExporter excelExporter = new ResultExcelExporter(listCandidates);

		excelExporter.export(response);
	}

}
