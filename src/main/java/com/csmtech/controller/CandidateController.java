package com.csmtech.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoField;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.bean.AnswerBean;
import com.csmtech.bean.QuestionBean;
import com.csmtech.exporter.CandidateExcelExporter;
import com.csmtech.model.Answer;
import com.csmtech.model.Candidate;
import com.csmtech.model.Configure;
import com.csmtech.model.QuestionSubTest;
import com.csmtech.model.SubTest;
import com.csmtech.model.SubTestTaker;
import com.csmtech.model.TestTaker;
import com.csmtech.model.User;
import com.csmtech.service.AnswerService;
import com.csmtech.service.CandidateService;
import com.csmtech.service.ConfigureService;
import com.csmtech.service.QuestionService;
import com.csmtech.service.QuestionSubTestService;
import com.csmtech.service.SubTestService;
import com.csmtech.service.SubTestTakerService;
import com.csmtech.service.TestService;
import com.csmtech.service.TestTakerService;
import com.csmtech.util.EmailService;

@Controller
@RequestMapping("exam")
public class CandidateController {

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private CandidateService candService;

	@Autowired
	private TestTakerService testTakerService;

	@Autowired
	private SubTestTakerService subTestTakerService;

	@Autowired
	private TestService testService;

	@Autowired
	private SubTestService subTestService;

	@Autowired
	private ConfigureService configureService;

	@Autowired
	private QuestionSubTestService questionSubTestService;

	private QuestionService questionService;

	@Autowired
	private AnswerService answerService;

//	List<QuestionSubTest> allQuests = new ArrayList();

	@GetMapping("/testTakers")
	public String testTakers(Model model) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("testtakerLists", testTakerService.getAll());

		model.addAttribute("saveBox", "yes");

		Integer invalCol = (Integer) httpSession.getAttribute("colValid");
		System.out.println(invalCol);

		String invalideColumnNames = (String) httpSession.getAttribute("invalideColumnNames");
		model.addAttribute("invalidCol", invalCol);
		model.addAttribute("invalideColumnNames", invalideColumnNames);

		model.addAttribute("testTakerList", testTakerService.getAll());
		model.addAttribute("testList", testService.getAllTest());

		return "admin/testTakerPage";

	}

	@PostMapping("/addTest-Taker")
	public String addTestTaker(@RequestParam(name = "testTakerName") String testTakerName, Model model,
			RedirectAttributes rd) {

		TestTaker testTaker = new TestTaker();
		testTaker.setTestTakerName(testTakerName);
		TestTaker t = testTakerService.save(testTaker);
		System.out.println("testTaker::" + t);
		model.addAttribute("testtakerLists", testTakerService.getAll());
		return "admin/testTakerPage";
	}

	/*
	 * @GetMapping("/testTakersList") public String addTestTakers(Model model) {
	 * User user = (User) this.httpSession.getAttribute("sessionData");
	 * model.addAttribute("username", user.getName()); model.addAttribute("saveBox",
	 * "yes"); model.addAttribute("collegeList", testTakerService.getAllCollege());
	 * model.addAttribute("testtakerList", testTakerService.getAll());
	 * System.out.println(testTakerService.getAll() + "$$$$$$$$$$$$");
	 * model.addAttribute("adressNav", "yes"); return "admin/testTakerPage";
	 * 
	 * }
	 */

	@GetMapping("gettestTakersList")
	public void getAllTestTakerList(HttpServletResponse resp) throws IOException {
		System.out.println("ajax for get test Taker List");

		List<TestTaker> testtakerList = testTakerService.getAll();
		System.out.println("INSIDE 1st AJAX::" + testtakerList);
		String st = "";

		for (TestTaker x : testtakerList) {

			st = st + x.getTestTakerName() + "_" + x.getTestTakerId() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);
	}

	@PostMapping("/addSubTest-Taker")
	public String addSubTestTaker(@RequestParam(name = "testTakerName") TestTaker testTaker,
			@RequestParam(name = "SubTestTakerName") String subTestTaker, RedirectAttributes rd, Model model) {
		Integer testTakerId = testTaker.getTestTakerId();
		List<SubTestTaker> subTestTakerList = subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId);

		boolean subTakerExist = subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId).stream()
				.anyMatch(sub -> sub.getSubTestTakerName().equalsIgnoreCase(subTestTaker));

		if (subTakerExist) {
			System.out.println("############");
			rd.addFlashAttribute("exist", "Name alredy Exist");
		} else {
			SubTestTaker sub = new SubTestTaker();
			sub.setTestTaker(testTaker);
			sub.setSubTestTakerName(subTestTaker);
			subTestTakerService.save(sub);
			rd.addFlashAttribute("saveSubt", subTestTaker);
			model.addAttribute("addressNav", "yes");
		}

		return "admin/testTakerPage";
	}

	/*
	 * @GetMapping("/getTestTaker") public String
	 * getSubTestTaker(@RequestParam("testTakerId") Integer testTakerId, Model
	 * model, HttpServletRequest req) { User user = (User)
	 * this.httpSession.getAttribute("sessionData"); model.addAttribute("username",
	 * user.getName());
	 * 
	 * httpSession.setAttribute("testTakerData", testTakerId);
	 * model.addAttribute("saveBox", "yes"); model.addAttribute("collegeList",
	 * testTakerService.getAllCollege()); model.addAttribute("testtakerList",
	 * testTakerService.getAll());
	 * System.out.println(subTestTakerService.getAllSubTestTakerByTestTakerId(
	 * testTakerId)); model.addAttribute("listSubTestTaker",
	 * subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId));
	 * model.addAttribute("ttId", testTakerId);
	 * 
	 * model.addAttribute("adressNav", "yes"); model.addAttribute("navTestTaker",
	 * "yes"); req.getSession().setAttribute("TestTakerName",
	 * testTakerService.getTestTakerName(testTakerId).getTestTakerName()); return
	 * "admin/testTakerPage";
	 * 
	 * }
	 */

	// getSubTestTaker List
	@GetMapping("getSubtestTakerByTestTaker")
	public void getAllSubTestTakerList(HttpServletResponse resp,
			@RequestParam(name = "testTakerId") Integer testTakerId) throws IOException {
		System.out.println("ajax for get Sub test Taker List" + testTakerId);

		List<SubTestTaker> subtesttakerList = subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId);
		System.out.println("INSIDE 1st AJAX::" + subtesttakerList);
		String st = "";

		for (SubTestTaker x : subtesttakerList) {

			st = st + x.getSubTestTakerName() + "_" + x.getSubTestTakerId() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);
	}

	@GetMapping("/addTestTakerByExcel")
	public String addTestTakerByExcel(Model model, @RequestParam("subTestTakerId") Integer subTestTakerId,
			HttpServletRequest req) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		Integer testTakerId = (Integer) httpSession.getAttribute("testTakerData");
		System.out.println(subTestTakerId);
		httpSession.setAttribute("subTestTakerData", subTestTakerId);
		model.addAttribute("testtakerList", testTakerService.getAll());
		System.out.println(subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId));
		model.addAttribute("listSubTestTaker", subTestTakerService.getAllSubTestTakerByTestTakerId(testTakerId));
		System.out.println("++++++++" + candService.findCandidateBySubTestTakerId(subTestTakerId));
		model.addAttribute("listCandidates", candService.findCandidateBySubTestTakerId(subTestTakerId));
		model.addAttribute("ttId", testTakerId);
		model.addAttribute("stId", subTestTakerId);
		model.addAttribute("saveBoxExcel", "no");

		model.addAttribute("adressNav", "yes");
		model.addAttribute("navTestTaker", "yes");
		model.addAttribute("navSubTestTaker", "yes");
		req.getSession().setAttribute("SubTestTakerName",
				subTestTakerService.findSubTestTakerName(subTestTakerId).getSubTestTakerName());

		// for configure page
		model.addAttribute("testList", testService.getAllTest());

		return "admin/testTakerPage";

	}

	@GetMapping("/testTakerByExcel")
	public void showTestAndAddQuestionSet(@RequestParam(name = "subtestTakerId") Integer subtestTakerId,
			HttpServletResponse resp, Model model) throws IOException {

		System.out.println("here subtest coming" + subtestTakerId);
		httpSession.setAttribute("stestDataId", subtestTakerId);
		model.addAttribute("saveBoxExcel", "no");
		System.out.println("here coming for add set");

		// model.addAttribute("SetDiv", "no");
//		model.addAttribute("test", "yes");
//		model.addAttribute("testNav", "yes");
//		model.addAttribute("Tname", "yes");
//		req.getSession().setAttribute("subTestNav", subTestService.findById(sId).getSubTestName());

		String st = "no";

		resp.getWriter().print(st);

	}

	@GetMapping("/getSubTestNameByTestId")
	public void getSubItemListByQuestionTypeId(@RequestParam(name = "tId") Integer testId, HttpServletResponse resp)
			throws IOException {

		PrintWriter pw = resp.getWriter();
		System.out.println("inside AJAX:::" + testId);

		List<SubTest> subtestList = subTestService.getAllSubTestByTestId(testId);
		System.out.println("++++++++++++++++" + subtestList);
		String t = "";
		t += "<option value='" + "select" + "'>" + "--select--" + "</option>";
		for (SubTest x : subtestList) {
			t += "<option value='" + x.getSubTestId() + "'>" + x.getSubTestName() + "</option>";
		}
		pw.print(t);

	}

//	@PostMapping("/getCandidatesByExcel")
//	public String saveCandidatesByExcel(@RequestParam("excelfile") MultipartFile candidateDetails,
//			RedirectAttributes rd) {
//
//		Integer subTestTakerId = (Integer) httpSession.getAttribute("subTestTakerData");
//		SubTestTaker subTestTaker = subTestTakerService.getSubTestTaker(subTestTakerId);
//		System.out.println(subTestTaker);
//
//		String contentType = candidateDetails.getContentType();
//		if (contentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
//			DataFormatter dataFormatter = new DataFormatter();
//			try (FileInputStream file = (FileInputStream) candidateDetails.getInputStream()) {
//				XSSFWorkbook workbook = (XSSFWorkbook) WorkbookFactory.create(file);
//				Row row;
//				Sheet sheet = workbook.getSheetAt(0);
//
//				for (int i = 1; i <= sheet.getLastRowNum(); i++) {
//					row = sheet.getRow(i);
//					Candidate cd = new Candidate();
//
//					System.out.println(row.getCell(1).getStringCellValue());
//					String fname = dataFormatter.formatCellValue(row.getCell(0));
//					String lname = dataFormatter.formatCellValue(row.getCell(1));
//					String email = dataFormatter.formatCellValue(row.getCell(2));
//					String mobileNo = dataFormatter.formatCellValue(row.getCell(3));
//					String clgName = dataFormatter.formatCellValue(row.getCell(4));
//
//					boolean cExist = candService.findAllCandidate().stream()
//							.anyMatch(c -> c.getCandidateemail().equalsIgnoreCase(email));
//					if (cExist) {
//						rd.addFlashAttribute("cExistExcel", "yes");
//					}
//
//					cd.setCandFirstname(fname);
//					cd.setCandLastname(lname);
//					cd.setCandidateemail(email);
//					cd.setCandpassword(fname.trim() + "@#");
//					String encodeTxt = encodeText(cd.getCandFirstname() + "@#");
//					cd.setCandpassword(encodeTxt);
//					cd.setCandMobile(mobileNo);
//					cd.setCandCollegeName(clgName);
//
//					cd.setSubTestTaker(subTestTaker);
//					cd.setIsdelete("No");
//					cd.setStatus("inactive");
//					System.out.println("+++++++++++++++++++++" + cd);
//					candService.saveCandidate(cd);
//					rd.addFlashAttribute("saveCandExcel", "yes");
//
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//
//		return "redirect:./testTakers";
//
//	}

	@PostMapping("/getCandidatesByExcel")
	public String saveCandidatesByExcel(@RequestParam("excelfile") MultipartFile candidateDetails, Model model,
			RedirectAttributes redirectAttrs) {

		boolean flag = true;

		Integer subTestTakerId = (Integer) httpSession.getAttribute("subTestTakerData");
		SubTestTaker subTestTaker = subTestTakerService.getSubTestTaker(subTestTakerId);
		System.out.println(subTestTaker);

		Pattern namePattern = Pattern.compile("^[a-zA-Z]+([\\s-][a-zA-Z]+)*$");
		Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
		Pattern mobilePattern = Pattern.compile("^[0-9]{10}$");

		int totalColumns = 0;
		String contentType = candidateDetails.getContentType();
		if (contentType.equals("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet")) {
			DataFormatter dataFormatter = new DataFormatter();
			try (FileInputStream file = (FileInputStream) candidateDetails.getInputStream()) {
				XSSFWorkbook workbook = (XSSFWorkbook) WorkbookFactory.create(file);
				Row row;

				Sheet sheet = workbook.getSheetAt(0);
				totalColumns = sheet.getRow(0).getLastCellNum();
				List<String> invalideColumnNames = new ArrayList<String>();
				List<String> valideColumnNames = new ArrayList<String>();
				valideColumnNames.add("Candidate First Name");
				valideColumnNames.add("Candidate Last Name");
				valideColumnNames.add("Candidate Email");
				valideColumnNames.add("Candidate MobileNo");
				boolean invalide = false;
				Row header = sheet.getRow(0);
				String invalideNames = "Invalide Columns :";
				for (Cell cell : header) {
					String columnName = cell.getStringCellValue();
					System.out.println("Column name: " + columnName);
					if (!valideColumnNames.contains(columnName)) {
						invalideColumnNames.add(columnName);

					}

				}

				for (String name : invalideColumnNames) {
					invalideNames = invalideNames + "," + name;
				}

				System.out.println("Invalide Column names: " + invalideNames);

				List<String> columnHeaders = new ArrayList<>();
				Row headerRow = sheet.getRow(0);
				for (int columnIndex = 0; columnIndex < totalColumns; columnIndex++) {
					String headerValue = dataFormatter.formatCellValue(headerRow.getCell(columnIndex)).trim();
					columnHeaders.add(headerValue);
				}

				if (totalColumns != 4) {

					System.out.println("inavlid Column" + totalColumns);
					httpSession.setAttribute("colValid", totalColumns);
					httpSession.setAttribute("invalideColumnNames", invalideNames);
					// redirectAttrs.addFlashAttribute("totCol", totalColumns);

				} else {
					invalideNames = "WRONG COLUMN NAMES :";
					header = sheet.getRow(0);
					invalideColumnNames.clear();
					for (Cell cell : header) {
						String columnName = cell.getStringCellValue();
						System.out.println("Column name: " + columnName);
						if (!valideColumnNames.contains(columnName)) {
							invalideColumnNames.add(columnName);

						}

					}

					if (invalideColumnNames.size() > 0) {

						for (String name : invalideColumnNames) {
							invalideNames = invalideNames + "," + name;
						}
					}

					if (!"WRONG COLUMN NAMES :".equals(invalideNames)) {

						System.out.println("Invalide Column names: " + invalideNames);
						httpSession.setAttribute("colValid", totalColumns);
						httpSession.setAttribute("invalideColumnNames", invalideNames);

					} else {

						System.out.println(totalColumns + "VALIDE COLUMN COMES......");

						List<String> fnameList = new ArrayList<String>();
						List<String> lnameList = new ArrayList<String>();
						List<String> emailList = new ArrayList<String>();
						List<String> mobileNoList = new ArrayList<String>();

						for (int i = 1; i <= sheet.getLastRowNum(); i++) {
							row = sheet.getRow(i);
							Candidate cd = new Candidate();

							String fname = dataFormatter.formatCellValue(row.getCell(0)).trim();
							String lname = dataFormatter.formatCellValue(row.getCell(1)).trim();
							String email = dataFormatter.formatCellValue(row.getCell(2)).trim();
							String mobileNo = dataFormatter.formatCellValue(row.getCell(3)).trim();

							Matcher match = namePattern.matcher(fname);
							if (match.matches()) {
								System.out.println("firstName field is valide....");
							} else {
								System.out.println("firstName field is invalide.....");
								fnameList.add(fname);
								redirectAttrs.addFlashAttribute("invalidFname", fname);
							}

							if (fnameList.size() > 0) {
								String wrongfnames = fnameList.toString();
								System.out.println("wrongfnames :" + wrongfnames);
								System.out.println("DATABASE SAVING STOP DUE TO INVALIDE FNAME...");
								flag = false;
							}

							// for Last Name
							match = namePattern.matcher(lname);
							if (match.matches()) {
								System.out.println("LastName field is valide....");
							} else {
								System.out.println("LastName field is invalide.....");
								lnameList.add(lname);
								redirectAttrs.addFlashAttribute("invalidLname", lname);

							}

							if (lnameList.size() > 0) {
								String wrongfnames = lnameList.toString();
								System.out.println("wrongfnames :" + wrongfnames);
								System.out.println("DATABASE SAVING STOP DUE TO INVALIDE LastName...");
								flag = false;
							}

							// for email validation
							match = emailPattern.matcher(email);
							if (match.matches()) {
								System.out.println("email field is valide....");
							} else {
								System.out.println("email field is invalide.....");
								emailList.add(email);
								redirectAttrs.addFlashAttribute("invalidemail", email);

							}

							if (emailList.size() > 0) {
								String wrongemails = emailList.toString();
								System.out.println("wrongemail :" + wrongemails);
								System.out.println("DATABASE SAVING STOP DUE TO INVALIDE EMAIL...");
								flag = false;
							}

							// FOR MOBILE NUMBER
							match = mobilePattern.matcher(mobileNo);
							if (match.matches()) {
								System.out.println("mobileNo field is valide....");
							} else {
								System.out.println("mobileNo field is invalide.....");
								mobileNoList.add(mobileNo);
								redirectAttrs.addFlashAttribute("invalidmobileNo", mobileNo);

							}

							if (mobileNoList.size() > 0) {
								String wrongemails = mobileNoList.toString();
								System.out.println("wrongemail :" + wrongemails);
								System.out.println("DATABASE SAVING STOP DUE TO INVALIDE MobileNo...");
								flag = false;
							}

							if (flag) {

								Candidate cand = candService.getCandidateByEmail(email);
								System.out.println("++++++++++++++++" + cand);
								if (cand != null) {
									System.out.println("This Candidate is Present!!!");
									String result = "error";
									redirectAttrs.addFlashAttribute("invalidemail", result);
									// httpSession.setAttribute("resultData", result);
								} else {
									System.out.println("database saving start");
									// If all validations pass, save the candidate
									cd.setCandFirstname(fname);
									cd.setCandLastname(lname);
									cd.setCandidateemail(email);
									cd.setCandpassword(fname + "@#");
									String encodeTxt = encodeText(cd.getCandFirstname() + "@#");
									cd.setCandpassword(encodeTxt);
									cd.setCandMobile(mobileNo);
									// cd.setCandCollegeName(clgName);
									cd.setSubTestTaker(subTestTaker);
									cd.setIsdelete("No");
									cd.setStatus("inactive");
									candService.saveCandidate(cd);

									String result = "success";
									redirectAttrs.addFlashAttribute("invalidemail", result);
									// httpSession.setAttribute("resultData", result);

								}
							}

						}

					}

				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		return "redirect:./testTakers";

	}

	@GetMapping("/candidate/export/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=Candidates" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);
		// model.addAttribute("allCandidate",candService.findAllCandidate());
		// List<Candidate> listCandidates = candService.findAllCandidate();

		CandidateExcelExporter excelExporter = new CandidateExcelExporter();

		excelExporter.export(response);
	}

	@PostMapping("/saveCandidate")
	public String saveCandidate(@RequestParam(name = "candFirstname") String candFirstname,
			@RequestParam(name = "candLastname") String candLastname,
			@RequestParam(name = "candidateemail") String candidateemail,
			@RequestParam(name = "candMobile") String candMobile, RedirectAttributes rd)
	/* @RequestParam(name = "candCollegeName") String candCollegeName) */ {

		Integer subTestTakerId = (Integer) httpSession.getAttribute("subTestTakerData");
		SubTestTaker subTestTaker = subTestTakerService.getSubTestTaker(subTestTakerId);
		System.out.println(subTestTaker);

		boolean candExist = candService.findAllCandidate().stream()
				.anyMatch(c -> c.getCandidateemail().equalsIgnoreCase(candidateemail));
		if (candExist) {
			rd.addFlashAttribute("candExist", "yes");

		} else {

			Candidate cand = new Candidate();
			cand.setCandFirstname(candFirstname);
			cand.setCandLastname(candLastname);
			cand.setCandidateemail(candidateemail);
			cand.setCandMobile(candMobile);
			cand.setCandpassword(candFirstname.trim() + "@#");
			String encodeTxt = encodeText(cand.getCandFirstname() + "@#");
			cand.setCandpassword(encodeTxt);
			cand.setStatus("inactive");
			cand.setIsdelete("No");
			cand.setSubTestTaker(subTestTaker);
			candService.saveCandidate(cand);
			rd.addFlashAttribute("candy", "yes");
			String DecodeText = decodeText(encodeTxt);
			System.out.println("DecodeText" + DecodeText);
		}
		return "redirect:./testTakers";
	}

	@PostMapping("/saveConfigure")
	public String saveConfigureTime(@RequestParam(name = "subtestName") SubTest subTest,
			@RequestParam(name = "noOfQuestion") Integer noQuestion, @RequestParam(name = "testDate") String testDate,
			@RequestParam(name = "loginTime") String loginTime, @RequestParam(name = "startTime") String startTime,
			@RequestParam(name = "endTime") String endTime, RedirectAttributes rd) throws IOException {

		httpSession.setAttribute("noQuestionData", noQuestion);
		Integer subTestTakerId = (Integer) httpSession.getAttribute("subTestTakerData");
		SubTestTaker subTestTaker = subTestTakerService.getSubTestTaker(subTestTakerId);
		Configure cf = new Configure();
		cf.setSubTest(subTest);
		cf.setTestDate(LocalDate.parse(testDate));
		cf.setLoginTime(LocalTime.parse(loginTime));
		LocalTime stTime = LocalTime.parse(startTime);
		LocalTime enTime = LocalTime.parse(endTime);
		cf.setStartTime(stTime);
		cf.setEndTime(enTime);
		long long1 = enTime.getLong(ChronoField.MINUTE_OF_DAY) - stTime.getLong(ChronoField.MINUTE_OF_DAY);
		cf.setTestDuration(LocalTime.of((int) long1 / 60, (int) long1 % 60));
		cf.setEnterNoQuestion(noQuestion);
		cf.setSubTestTaker(subTestTaker);
		configureService.saveConfigure(cf);
		rd.addFlashAttribute("config", "yes");
		return "redirect:./testTakers";
	}

	@GetMapping("checkQuestionAviableOrNot")
	public void checkQuestionAviableOrNot(@RequestParam(name = "testId") Integer tId,
			@RequestParam(name = "sId") Integer sId, HttpServletResponse resp, Model model) throws IOException {

		Integer totalQuestions = questionSubTestService.countAllQuestionBySubtestId(sId);
		System.out.println(totalQuestions + " you want to add :" + tId);
		model.addAttribute("totalQuestionsinSet", totalQuestions);
		resp.getWriter().print(totalQuestions);
	}

	@GetMapping("/sendEmailToCandidates")
	public String getCandidateBySubTestTakerId(Model model, RedirectAttributes rd) {

		System.out.println("getting email");
		Integer subTestTakerId = (Integer) httpSession.getAttribute("subTestTakerData");
		List<Candidate> candidateList = candService.findCandidateBySubTestTakerId(subTestTakerId);
		Configure config = configureService.findConfigureBySubTestTakerId(subTestTakerId);
		EmailService.sendEmails(candidateList, config);
		rd.addFlashAttribute("emailSent", "yes");
		System.out.println(candService.findCandidateBySubTestTakerId(subTestTakerId));

		return "redirect:./testTakers";
	}

	@PostMapping("/candidateQuestion")
	public String getQuestion(RedirectAttributes rd, HttpServletRequest req, Model model) throws ParseException {
		
		Candidate cand = (Candidate) httpSession.getAttribute("sessionData1");
		Configure config = configureService.findConfigureBySubTestTakerId(cand.getSubTestTaker().getSubTestTakerId());
		LocalDateTime of = LocalDateTime.of(config.getTestDate(), config.getLoginTime());
		long examLogin = of.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();
		LocalDateTime of1 = LocalDateTime.of(config.getTestDate(), config.getStartTime());
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
		
		//Change------------------------------------------------
		
		Integer sId = config.getSubTest().getSubTestId();
		Integer noQuestion = config.getEnterNoQuestion();
		System.out.println(noQuestion + "GETTING NO. OF QUESTIONS");
		List<QuestionBean> randomQuestions = questionSubTestService
				.findQuestionsRandomlyByGivingAdminInput(noQuestion, sId);
		System.out.println("+++++++++++++++++++++++++++++++" + randomQuestions);
		Collections.shuffle(randomQuestions);
		if (cand.getStatus().equals("inactive")) {
		httpSession.setAttribute("quests", randomQuestions);
		model.addAttribute("questions", randomQuestions.get(0));
		cand.setStatus("1");
		candService.saveCandidate(cand);
		return "candidate/questions";
		}else {
			rd.addFlashAttribute("TimeOut", "TimeFailed");
			return "redirect:/exam/login";
		}
	
	}

	@PostMapping(value = "/saveExam", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<String> saveExam(@RequestBody List<AnswerBean> answerBeans) {
		System.out.println("answerBeans" + answerBeans);
		Candidate candidate = (Candidate) httpSession.getAttribute("sessionData1");
		List<QuestionBean> questions = (List<QuestionBean>) httpSession.getAttribute("quests");
		Integer noOfQuestion = questions.size();
		System.out.println("NM::" + noOfQuestion);
		Double totalMark = (double) (noOfQuestion * 2);
		double seventyFivePercent = totalMark * 0.75;
		System.out.println("75%%%%:::" + seventyFivePercent);
		Integer seventyFivePercentRounded = (int) Math.round(seventyFivePercent);

		Random random = new Random();
		int randomQuestionIndex = random.nextInt(noOfQuestion);

		System.out.println("randomQuestionIndex::" + randomQuestionIndex);
		System.out.println("noOfQuestion:::" + noOfQuestion);
		System.out.println("seventyFivePercentRounded***" + seventyFivePercentRounded);
		List<AnswerBean> answers = answerBeans;
		Integer marks = 0;
		Answer answer;

		for (int i = 0; i < answers.size(); i++) {
			if (i < questions.size()) {
				AnswerBean answerBean = answers.get(i);
				QuestionBean question = questions.get(i);

				System.out.println("***" + answerBean);
				if (answerBean != null) {
					answer = new Answer();
					answer.setCandidate(candidate.getCandid());
					answer.setQuestion(answerBean.getQuestionId());
					answer.setOptChoose(answerBean.getOption());

					if (answerBean.getOption().equalsIgnoreCase(question.getCorrectAns())) {
						System.out.println("Correct answer");
						answer.setStatus("correct");
						answer.setMark(2);
						marks += 2;
					} else {
						System.out.println("Wrong answer");
						answer.setStatus("wrong");
						answer.setMark(0);
					}

					answerService.save(answer);

				}
			} else {
				System.out.println("EXAM OVER");
			}
		}

		System.out.println("Total marks: " + marks);

		candidate.setTotalMark(totalMark);
		candidate.setMarkAppear(marks);
		if (marks >= seventyFivePercentRounded) {
			System.out.println("PASS");
			candidate.setResultStatus("PASS");
		} else {
			candidate.setResultStatus("FAIL");
			System.out.println("FAIL");
		}
		candService.saveCandidate(candidate);
		// You can perform further actions with the total marks if needed.

		return ResponseEntity.ok("Exam saved successfully.");
	}

	public static String decodeText(String encText) {
		try {
			byte[] result = Base64.getUrlDecoder().decode(encText);
			return new String(result);
		} catch (IllegalArgumentException e) {
			// Handle the error (e.g., log the error, provide a default value, etc.)
			e.printStackTrace();
			return null; // Or a default value indicating decoding failure
		}
	}

	public static String encodeText(String plainTxt) {

		// REverse the plaintext
		StringBuffer revereTxt = new StringBuffer(plainTxt);
		System.out.println(revereTxt);
		return Base64.getEncoder().encodeToString(revereTxt.toString().getBytes());

	}

	@GetMapping("getAllCandidatesByStId")
	public void getAllCandidatesBySubTestTakerId(@RequestParam(name = "subtestTakerId") Integer subtestTakerId,
			HttpServletResponse resp) throws IOException {

		System.out.println(subtestTakerId + "////////////////////");

		httpSession.setAttribute("subTestTakerData", subtestTakerId);

		PrintWriter pw = resp.getWriter();
		System.out.println("inside AJAX:::" + subtestTakerId);

		List<Candidate> candidates = candService.findCandidateBySubTestTakerId(subtestTakerId);
		System.out.println("++++++++++++++++" + candidates);
		String st = "";

		for (Candidate x : candidates) {

			st = st + x.getCandidateemail() + "_" + x.getCandid() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);

	}

}

//-------------------------------------------
