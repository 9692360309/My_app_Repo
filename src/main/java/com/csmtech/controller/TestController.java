package com.csmtech.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import javax.persistence.NonUniqueResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hpsf.Array;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.bean.QuestionBean;
import com.csmtech.model.Items;
import com.csmtech.model.Question;
import com.csmtech.model.QuestionSubTest;
import com.csmtech.model.QuestionType;
import com.csmtech.model.SubItem;
import com.csmtech.model.SubTest;
import com.csmtech.model.Test;
import com.csmtech.model.User;
import com.csmtech.repository.QuestionRepository;
import com.csmtech.repository.SubTestRepository;
import com.csmtech.service.ItemService;
import com.csmtech.service.QuestionService;
import com.csmtech.service.QuestionSubTestService;
import com.csmtech.service.QuestionTypeService;
import com.csmtech.service.SubItemService;
import com.csmtech.service.SubTestService;
import com.csmtech.service.TestService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("exam")
public class TestController {

	@Autowired
	private QuestionRepository questionRepository;

	@Autowired
	private SubTestRepository subTestRepository;

	@Autowired
	private TestService testService;

	@Autowired
	private SubTestService subTestService;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private SubItemService subItemService;

	@Autowired
	private QuestionTypeService questionTypeService;

	@Autowired
	private ItemService itemService;

	@Autowired
	private QuestionService questionService;

	@Autowired
	private QuestionSubTestService questionSubTestService;

	@GetMapping("/test")
	public String getTest(Model model) {
		model.addAttribute("testList", testService.getAllTest());
		model.addAttribute("test", "yes");
		model.addAttribute("SetDiv", "yes");

		return "admin/testPage";
	}

	@GetMapping("/getAllTest")
	public void getAllItemList(HttpServletResponse resp) throws IOException {
		System.out.println("ajax for get item List");

		List<Test> testList = testService.getAllTest();
		System.out.println("INSIDE 1st AJAX::" + testList);
		String st = "";

		for (Test x : testList) {

			st = st + x.getTestName() + "_" + x.getTestId() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);
	}

	Integer q = 0;

	@GetMapping("/getTestList")
	public String getAllTest(Model model) {
		System.out.println("getting the list");

		model.addAttribute("testList", testService.getAllTest());
		model.addAttribute("test", "yes");
		model.addAttribute("testNav", "yes");
		model.addAttribute("testNave");

		return "admin/testPage";
	}

	@GetMapping(path = "/showSubTest")
	public String getAllSubTest(@RequestParam("testId") Integer testId, Model model, HttpServletRequest req) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("test", "yes");
		model.addAttribute("testNav", "yes");
		model.addAttribute("Tname", "yes");
		req.getSession().setAttribute("testNavName", testService.findTestNameByTestId(testId).getTestName());

		httpSession.setAttribute("testData", testId);
		System.out.println(testId);
		model.addAttribute("testList", testService.getAllTest());
		System.out.println("subTest::" + subTestService.getAllSubTestByTestId(testId));
		model.addAttribute("subTestList", subTestService.getAllSubTestByTestId(testId));
		model.addAttribute("tId", testId);
		return "admin/testPage";

	}

//	@PostMapping(path = "/addTest")
//	
//	public void saveTest(@RequestParam(name = "testName") String testName, Model model,HttpServletResponse resp)throws IOException {
//		boolean testExist = testService.getAllTest().stream().anyMatch(t -> t.getTestName().equalsIgnoreCase(testName));
//		PrintWriter writer = resp.getWriter();
//		if (testExist) {
//			writer.print("failed");
//		} else {
//			Test test = new Test();
//			test.setTestName(testName);
//			testService.saveTest(test);
//			// model.addAttribute("username", user.getName());
//			model.addAttribute("testList", testService.getAllTest());
//			model.addAttribute("test", "yes");
//			model.addAttribute("SetDiv", "yes");
//			writer.print("success");
//		}
//		// return "admin/testPage";
//	}
//
//	@PostMapping(path = "/addSubTest")
//	public void saveSubTest(@RequestParam(name = "testName") Integer test,
//			@RequestParam(name = "subTestName") String subTest, Model model,HttpServletResponse resp)throws IOException {
//
//		boolean subTestExist = subTestService.findAll().stream()
//				.anyMatch(s -> s.getTest().getTestId() == test && s.getSubTestName().equalsIgnoreCase(subTest));
//		
//		PrintWriter writer = resp.getWriter();
//		System.out.println("inside subtest"+test+"ghj"+subTest);
//		
//		if (subTestExist) {
//			 writer.print("failed");
//			 
//		}
//		else {
//			SubTest sb = new SubTest();
//			Test t = testService.findTestNameByTestId(test);
//			sb.setTest(t);
//			sb.setSubTestName(subTest);
//			subTestService.saveSubTest(sb);
//			model.addAttribute("testList", testService.getAllTest());
//			model.addAttribute("test", "yes");
//			model.addAttribute("SetDiv", "yes");
//			writer.print("success");
//		}
//		// return "admin/testPage";
//	}
//
//	@GetMapping("/addSet")
//	public void showTestAndAddQuestionSet(@RequestParam(name = "sId") Integer sId, HttpServletResponse resp,
//			Model model) throws IOException {
//
//		System.out.println("here subtest coming" + sId);
//		httpSession.setAttribute("stestData", sId);
//		System.out.println("here coming for add set");
//		String st = "no";
//		resp.getWriter().print(st);
//
//	}

	
	@PostMapping(path = "/addTest")
	public String saveTest(@RequestParam(name = "testName") String testName, Model model) {
		Test test = new Test();
		test.setTestName(testName);
		testService.saveTest(test);
		model.addAttribute("testList", testService.getAllTest());
		return "admin/testPage";
	}
	
	
	@GetMapping("/checkTestName")
	@ResponseBody
	public String checkTestName(@RequestParam(name = "testName") String testName) {
		boolean testExist = testService.getAllTest().stream().anyMatch(t -> t.getTestName().equalsIgnoreCase(testName));
	    if (testExist) {
	        return "exists";
	    } else {
	        return "notExists";
	    }
	}

	@PostMapping(path = "/addSubTest")
	public String saveSubTest(@RequestParam(name = "testName") Test test,
			@RequestParam(name = "subTestName") String subTest,Model model) {

		SubTest sb = new SubTest();
		sb.setTest(test);
		sb.setSubTestName(subTest);
		subTestService.saveSubTest(sb);
		//model.addAttribute("username", user.getName());
		model.addAttribute("testList", testService.getAllTest());
		model.addAttribute("test", "yes");
		model.addAttribute("SetDiv", "yes");
		return "admin/testPage";
	}

	
	@GetMapping("/checkSubTestName")
	@ResponseBody
	public String checkSubTestName(@RequestParam(name = "testName") Integer test,
			@RequestParam(name = "subTestName") String subTest) {
		boolean subTestExist = subTestService.findAll().stream()
		        .anyMatch(s -> s.getTest().getTestId() == test && s.getSubTestName().equalsIgnoreCase(subTest));

	    if (subTestExist) {
	        return "exists";
	    } else {
	        return "notExists";
	    }
	}
	
	@GetMapping("/addSet")
	public void showTestAndAddQuestionSet(@RequestParam(name = "sId") Integer sId, HttpServletResponse resp,
			Model model) throws IOException {

		System.out.println("here subtest coming"+sId);
		httpSession.setAttribute("stestData", sId);
		System.out.println("here coming for add set");
		String st = "no";
	    resp.getWriter().print(st);
		
	}
	
	@GetMapping("/byItemLink")
	public String byItem(Model model, HttpServletRequest req) throws JsonProcessingException {

		Integer testId1 = (Integer) httpSession.getAttribute("testData");
		Integer subTestId = (Integer) httpSession.getAttribute("stestData");
		System.out.println(testId1 + "##############" + subTestId);

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("test", "yes");
		model.addAttribute("testNav", "yes");
		model.addAttribute("Tname", "yes");
		model.addAttribute("byItemLink", "byItemLink");

		model.addAttribute("itemList", itemService.findAllItem());
		List<QuestionSubTest> qsubTest = questionSubTestService.findAllQuestionBySubTest1(subTestId);
		System.out.println("GetAll question by questionId" + qsubTest);
		List<String> questionIdList = new ArrayList<>();
		int index = 0;

		for (QuestionSubTest q : qsubTest) {

			if (q.getQuestion().getSubItem() == null) {

				questionIdList.add(q.getQuestion().getItem().getItemName() + "-"
						+ q.getQuestion().getQuestionType().getQuestionTypeName() + "_"
						+ q.getQuestion().getQuestionId());
				index++;

			} else {

				questionIdList.add(q.getQuestion().getItem().getItemName() + "-"
						+ q.getQuestion().getQuestionType().getQuestionTypeName() + "-"
						+ q.getQuestion().getSubItem().getSubItemName() + "_" + q.getQuestion().getQuestionId());
				index++;
			}
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String questionIdsJson = objectMapper.writeValueAsString(questionIdList);

		model.addAttribute("questionIdsJson", questionIdsJson);
		System.out.println(Arrays.asList(questionIdList));

		return "admin/addQuestionByItem";
	}

	@GetMapping("/byTestLink")
	public String byTest(Model model, HttpServletRequest req) throws Exception {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		Integer sId = (Integer) httpSession.getAttribute("stestData");
		model.addAttribute("subTestId", sId);
		QuestionBean qb = new QuestionBean();
		System.out.println("{{{{{{{{{{{{{{{{{{{{{{{{{" + qb.getItem());
		List<QuestionBean> qList = questionSubTestService.findAllQuestionBySubTest(sId);
		System.out.println("[[[[[[[[[[[[[[[[[[[[[[[[[[   " + qList);

		List<String> questList = new ArrayList<>();
		int index = 0;
		for (QuestionBean ques : qList) {

			if (ques.getSubItem() == null) {
				questList.add(ques.getItem().getItemName() + "-" + ques.getQuestionType().getQuestionTypeName() + "_"
						+ ques.getQuestionId());
				index++;
			}

			else {
				questList.add(ques.getItem().getItemName() + "-" + ques.getQuestionType().getQuestionTypeName() + "-"
						+ ques.getSubItem().getSubItemName() + "_" + ques.getQuestionId());
				index++;
			}
		}
		List<SubTest> stList = subTestService.findAllSubTest();
		model.addAttribute("allSubTest", stList);
		model.addAttribute("qSet", "byItem");
		model.addAttribute("test", "yes");
		model.addAttribute("testNav", "yes");
		model.addAttribute("Tname", "yes");
		model.addAttribute("byTestLink", "byTestLink");

		model.addAttribute("testList", testService.getAllTest());
		req.getSession().setAttribute("testList1", testService.getAllTest());

		model.addAttribute("allSubTest", stList);
		model.addAttribute("qSet", "byItem");

		ObjectMapper objectMapper = new ObjectMapper();
		String questionSubJson = objectMapper.writeValueAsString(questList);
		System.out.println("+++++++++++++" + questionSubJson);
		model.addAttribute("questionSubJson", questionSubJson);

		return "admin/addQuestionByTest";
	}

	// for add question by test
	@GetMapping("/getAllSubtestByTest")
	public void getAllSubtestByTest(@RequestParam(name = "testId") Integer testId, HttpServletResponse resp,
			Model model) throws IOException {

		System.out.println("INSIDE AJAX ADD QUESTION by TEST" + testId);

		String sts = "";
		PrintWriter pw = resp.getWriter();

		List<SubTest> subtestList = subTestService.getAllSubTestByTestId(testId);

		for (SubTest stest : subtestList) {
			sts = sts + stest.getSubTestName() + "_" + stest.getSubTestId() + ",";

		}

		if (sts.endsWith(",")) {
			sts = sts.substring(0, sts.length() - 1);
		}
		resp.getWriter().print(sts);

	}

	// get all question by testid using ajax
	@GetMapping("/getAllQuestionBySubTestId")
	public void getAllQuestionBySubTestId(@RequestParam("subtestId") Integer sId, HttpServletResponse resp, Model model)
			throws IOException {
		System.out.println("working here____________________");
		List<QuestionBean> qList = questionSubTestService.findAllQuestionBySubTest(sId);
		String st = "";
		// st =
		// qList.get(0).getItem().getItemName()+"-"+qList.get(0).getQuestionType().getQuestionTypeName()+"-"+qList.get(0).getSubItem().getSubItemName()+"_";
		System.out.println("outside for loop" + st);
		StringBuilder stringBuilder = new StringBuilder();

		for (QuestionBean ques : qList) {

			if (ques.getSubItem() == null) {

				st = ques.getItem().getItemName() + "-" + ques.getQuestionType().getQuestionTypeName() + "_";
				st = st + ques.getQuestionId() + ",";

				stringBuilder.append(st);
			} else {
				st = ques.getItem().getItemName() + "-" + ques.getQuestionType().getQuestionTypeName() + "-"
						+ ques.getSubItem().getSubItemName() + "_";
				st = st + ques.getQuestionId() + ",";

				stringBuilder.append(st);

			}
		}

		String result = stringBuilder.toString();

		if (result.endsWith(",")) {
			result = result.substring(0, result.length() - 1);
		}
		resp.getWriter().print(result);

	}

//------------------------------------------------------------------------------------------	
	@GetMapping("/showQuestionTypeById")
	public void showQuestionTypeById(@RequestParam(name = "itemId") Integer itemId, HttpServletResponse resp,
			Model model) throws IOException {
		List<QuestionType> queType = questionTypeService.getAllQuestionType();
		System.out.println("INSIDE 1st AJAX::" + itemId + queType);
		String st = "";

		for (QuestionType x : queType) {

			st = st + x.getQuestionTypeName() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);

		model.addAttribute("test", "yes");
		model.addAttribute("testNav", "yes");
		model.addAttribute("Tname", "yes");
		model.addAttribute("byTestLink", "byTestLink");

	}

	@GetMapping("/getAllsubItem")
	public void getSubitemList(@RequestParam("itemId") Integer itemId,
			@RequestParam("questionTypeId") Integer questionTypeId, HttpServletResponse resp) throws IOException {

		System.out.println("ist coming");
		String st = "";
		PrintWriter pw = resp.getWriter();

		List<SubItem> subList = subItemService.getAllSubItemsByQuestionTypeId(questionTypeId, itemId);
		List<Question> qList = questionService.getAllQuestionByItemId(itemId, questionTypeId);
		// String qcode =
		// qList.get(0).getItem().getItemName()+"-"+qList.get(0).getQuestionType().getQuestionTypeName()+"_";

		// String qt="";
		// System.out.println(qcode+" Outside");
		/*
		 * System.out.println("ist condition working ");
		 * 
		 * for(Question q : qList) {
		 * 
		 * qt = qt +q.getQuestionId() + "," ; System.out.println("qst"+qt);
		 * 
		 * } for (SubItem sitem : subList) { st = st +sitem.getSubItemName() + "_" +
		 * sitem.getSubItemId() + ","; }
		 * 
		 * if(qt!= null && !qt.isEmpty()) {
		 * 
		 * System.out.println("here ist condition working"); st = qcode +qt+":"+st; }
		 * else { System.out.println("here 2nd condition working"); st= "subitem:"+st; }
		 * 
		 * System.out.println("ist condition working "+st);
		 */

		if (qList.isEmpty()) {
			System.out.println("qList is empty.");
			for (SubItem sitem : subList) {
				st = st + sitem.getSubItemName() + "_" + sitem.getSubItemId() + ",";
			}
			st = "" + ":" + st;
			System.out.println("here come with subitem:" + st);
		} else {
			String qcode = qList.get(0).getItem().getItemName() + "-"
					+ qList.get(0).getQuestionType().getQuestionTypeName() + "_";

			String qt = "";
			System.out.println(qcode + " Outside");
			System.out.println("ist condition working ");

			for (Question q : qList) {
				qt = qt + q.getQuestionId() + ",";
				System.out.println("qst" + qt);
			}

			for (SubItem sitem : subList) {
				st = st + sitem.getSubItemName() + "_" + sitem.getSubItemId() + ",";
			}

			if (!qt.isEmpty() && st.isEmpty()) {
				System.out.println("only for questions::::");
				st = qcode + qt + ":";
			} else if (!qt.isEmpty() && !st.isEmpty()) {
				System.out.println("here for question and subitem");
				st = qcode + qt + ":" + st;
			} else {
				System.out.println("nothing will print");
			}
		}

		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);

		System.out.println(st + "***********");

	}

	// show all question with check box
	@GetMapping("/getQuestionBySubId")
	public void getQuestionBySubId(HttpServletResponse resp, @RequestParam(name = "subitemId") Integer subItemId,
			@RequestParam(name = "questionTypeId") Integer questionTypeId, Model model) throws IOException {

		List<Question> questionList = questionService.getAllQuestionBySubItemIdForTest(subItemId, questionTypeId);

		System.out.println(questionList.get(0).getItem().getItemName().toUpperCase().charAt(0));
		System.out.println(questionList.get(0).getQuestionType().getQuestionTypeName().charAt(0));
		System.out.println(questionList.get(0).getSubItem().getSubItemName().charAt(0));
		String st = questionList.get(0).getItem().getItemName() + "-"
				+ questionList.get(0).getQuestionType().getQuestionTypeName() + "-"
				+ questionList.get(0).getSubItem().getSubItemName() + "_";
//		String st = "";
		int index = 0;
		for (Question ques : questionList) {
			st = st + ques.getQuestionId() + ",";

		}

		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);

	}

	@PostMapping("/saveSelectedQuestion")

	public String selectQuestion(@RequestParam("questionArray") String questionIds, RedirectAttributes rd) {

		System.out.println("here come");
		Integer subTestId = (Integer) httpSession.getAttribute("stestData");
		SubTest subTest = subTestService.findSubTest(subTestId);

		System.out.println("saved method");

		// delete
		List<QuestionSubTest> saveQuestionIfNotPresent = questionSubTestService.saveQuestionIfNotPresent(subTestId);
		questionSubTestService.deleteall(saveQuestionIfNotPresent);

		// save
		System.out.println(questionIds);
		String[] str = questionIds.split(",");
		List<String> qIdArray = Arrays.asList(str);
		List<Integer> selectedQList = qIdArray.stream()
				.map(q -> Integer.parseInt(q.substring(q.lastIndexOf("_") + 1, q.length())))
				.collect(Collectors.toList());
		List<Question> questionbyQuestionId = this.questionService.getQuestionbyQuestionId(selectedQList);
		List<QuestionSubTest> questionSubTestList = new ArrayList<>();
		questionbyQuestionId.forEach(ques -> {
			QuestionSubTest questionSubTest = new QuestionSubTest();
			questionSubTest.setQuestion(ques);
			questionSubTest.setSubTest(this.subTestService.getSubTestById(subTestId));
			questionSubTestList.add(questionSubTest);
		});
		questionSubTestService.saveAll(questionSubTestList);

		QuestionSubTest questionSubTest = new QuestionSubTest();

		List<QuestionSubTest> qSubTest = questionSubTestService.findAll();

		System.out.println("getting the page.....");

		return "redirect:./byItemLink?sId=" + subTestId;

	}

	@GetMapping("/getQuestionBodyById")
	public void getQuestionBodyById(HttpServletResponse resp, @RequestParam(name = "questionId") Integer questionId,
			Model model) throws IOException {

		Question question = questionService.getAllQuestionsByQuestionId(questionId);
		StringBuilder st = new StringBuilder();
		st.append(" <p class=\"question-content\">" + question.getQuestionText() + "</p><div class=\"options\">");
		if (question.getOption1() != null) {
			st.append("<div class=\"option\">\r\n" + "      <span class=\"option-letter\">A.</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getOption1() + "</span>\r\n" + "    </div>");
		}
		if (question.getOption2() != null) {
			st.append("<div class=\"option\">\r\n" + "      <span class=\"option-letter\">B.</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getOption2() + "</span>\r\n" + "    </div>");
		}
		if (question.getOption3() != null) {
			st.append("<div class=\"option\">\r\n" + "      <span class=\"option-letter\">C.</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getOption3() + "</span>\r\n" + "    </div>");
		}
		if (question.getOption4() != null) {
			st.append("<div class=\"option\">\r\n" + "      <span class=\"option-letter\">D.</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getOption4() + "</span>\r\n" + "    </div>");
		}
		if (question.getOption5() != null) {
			st.append("<div class=\"option\">\r\n" + "      <span class=\"option-letter\">E.</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getOption5() + "</span>\r\n" + "    </div>");
		}
		st.append("</div>");

		resp.getWriter().print(st);

	}

	@PostMapping("/saveSelectedQuestionBySubtest")
	public String saveSelectedQuestionBySubtest(@RequestParam("questionArrays") String questionIds, RedirectAttributes rd,
	@RequestParam("subTestId") Integer sId) {
		System.out.println("sbjkcbsjc");
	System.out.println(questionIds+"[[[[[[[[[[[[[[[[[["+sId);
	// delete
	
	List<QuestionSubTest> saveQuestionIfNotPresent = questionSubTestService.saveQuestionIfNotPresent(sId);
	
	//questionSubTestService.deleteall(saveQuestionIfNotPresent);
	
	// save
	String[] str = questionIds.split(",");
	List<String> qIdArray = Arrays.asList(str);
	List<Integer> selectedQList = qIdArray.stream()
	.map(q -> Integer.parseInt(q.substring(q.lastIndexOf("_") + 1, q.length())))
	.collect(Collectors.toList());
	System.out.println("/////////////"+selectedQList);
	List<Question> questionbyQuestionId = questionService.getAllQuestionbyQuestionId(selectedQList);
	System.out.println("-------------------"+questionbyQuestionId);
	List<QuestionSubTest> questionSubTestList = new ArrayList<>();
	questionbyQuestionId.forEach(ques -> {
	QuestionSubTest questionSubTest = new QuestionSubTest();
	questionSubTest.setQuestion(ques);
	questionSubTest.setSubTest(this.subTestService.getSubTestById(sId));
	questionSubTestList.add(questionSubTest);
	});
	questionSubTestService.saveAll(questionSubTestList);

	QuestionSubTest questionSubTest = new QuestionSubTest();

	List<QuestionSubTest> qSubTest = questionSubTestService.findAll();

	return "redirect:./byTestLink?sId=" + sId;
	}

	

	

}
