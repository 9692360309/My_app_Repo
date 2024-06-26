package com.csmtech.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.exporter.CandidateExcelExporter;
import com.csmtech.exporter.ObjectiveQuestionExcelExporter;
import com.csmtech.exporter.SubjectiveQuestionExcelExporter;
import com.csmtech.model.Candidate;
import com.csmtech.model.Exam;
import com.csmtech.model.Items;
import com.csmtech.model.Question;
import com.csmtech.model.QuestionType;
import com.csmtech.model.SubItem;
import com.csmtech.model.User;
import com.csmtech.repository.ItemRepository;
import com.csmtech.service.CandidateService;
import com.csmtech.service.ExamService;
import com.csmtech.service.ItemService;
import com.csmtech.service.QuestionService;
import com.csmtech.service.QuestionTypeService;
import com.csmtech.service.SubItemService;
import com.csmtech.service.TestTakerService;

@Controller
@RequestMapping(path = "exam")
public class FolderController {

	@Autowired
	private ItemService itemService;

	@Autowired
	private SubItemService subItemService;

	@Autowired
	private HttpSession httpSession;

	@Autowired
	private QuestionService questionService;

	@Autowired
	private QuestionTypeService questionTypeService;

	@Autowired
	private CandidateService candService;

	@Autowired
	private TestTakerService testTakerService;

	@GetMapping(path = "/createFolder")
	public String createFolder(Model model, RedirectAttributes rd) {
		model.addAttribute("itemListsss", itemService.findAllItem());
		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("questionTypeList", questionTypeService.getAllQuestionType());

		return "admin/itemsFolder";
	}

	@GetMapping("/getItemList")
	public String getItemList(Model model) {
		model.addAttribute("adressNav", "yes");
		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		System.out.println("item++++++++++" + itemService.findAllItem());
		model.addAttribute("itemListsss", itemService.findAllItem());
		model.addAttribute("itemList", itemService.findAllItem());
		model.addAttribute("questionTypeList", questionTypeService.getAllQuestionType());

		return "admin/itemsFolder";
	}

	@GetMapping("/showQuestionType")
	public String showAllQuestionType(@RequestParam(name = "itemId") Items item, Model model, HttpServletRequest req) {

		System.out.println("jbwdcjbwejbceiubdciucewb" + item);
		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		model.addAttribute("itemNav", "yes");

		httpSession.setAttribute("itemData", "item");

		Integer itemId = item.getItemId();

		req.getSession().setAttribute("itemName", itemService.findItemNameByItemId(itemId).getItemName());

		httpSession.setAttribute("itemIdData", itemId);
		model.addAttribute("adressNav", "yes");
		model.addAttribute("itemListsss", itemService.findAllItem());
		model.addAttribute("itemList", itemService.findAllItem());
		model.addAttribute("questionTypeList", questionTypeService.getAllQuestionType());
		model.addAttribute("ivalue", itemId);

		return "admin/itemsFolder";

	}

	@GetMapping("/showSubItem")
	public String showSubItem(@RequestParam(name = "questionTypeId") QuestionType questionType, Model model,
			HttpServletRequest req) {

		User user = (User) this.httpSession.getAttribute("sessionData");

		httpSession.setAttribute("qTypeData", "questionType");
		Integer questionTypeId = questionType.getQuestionTypeId();
		model.addAttribute("username", user.getName());
		model.addAttribute("itemNav", "yes");
		model.addAttribute("type", "yes");
		req.getSession().setAttribute("subItem",
				questionTypeService.findQuestionTypeByQuestionTypeId(questionTypeId).getQuestionTypeName());

		Integer itemId = (Integer) httpSession.getAttribute("itemIdData");
		httpSession.setAttribute("qTypeIdData", questionTypeId);
		model.addAttribute("adressNav", "yes");
		model.addAttribute("itemListsss", itemService.findAllItem());
		model.addAttribute("itemList", itemService.findAllItem());
		model.addAttribute("questionTypeList", questionTypeService.getAllQuestionType());
		// System.out.println(subItemService.getAllSubItemsByQuestionTypeId(questionTypeId));
		model.addAttribute("listSubItem", subItemService.getAllSubItemsByQuestionTypeId(questionTypeId, itemId));
		model.addAttribute("ivalue", itemId);
		model.addAttribute("key", questionTypeId);

		model.addAttribute("questionListByItem", questionService.getAllQuestionByItemId(itemId, questionTypeId));

		return "admin/itemsFolder";
	}

	@GetMapping("/questionList")
	public String getAllQuestion(@RequestParam(name = "subItemId") SubItem subItem, Model model,
			HttpServletRequest req) {

		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@popo");
		User user = (User) this.httpSession.getAttribute("sessionData");
		httpSession.setAttribute("subItemData", subItem);
		model.addAttribute("username", user.getName());
		model.addAttribute("itemNav", "yes");
		model.addAttribute("type", "yes");
		model.addAttribute("question", "yes");

		Integer subItemId = subItem.getSubItemId();
		req.getSession().setAttribute("subItemId", subItemService.findSubItemNameById(subItemId));

		model.addAttribute("adressNav", "yes");

		Integer itemId = (Integer) httpSession.getAttribute("itemIdData");
		Integer questionTypeId = (Integer) httpSession.getAttribute("qTypeIdData");

		String subItemName = subItemService.findSubItemNameById(subItemId);
		System.out.println("subItemName::::" + subItemName);

		String firstOneChar = new Character(subItemName.charAt(0)).toString();

		System.out.println(firstOneChar.toUpperCase() + "%%%%%%%%%%%%%%%%%%%%%%");
		model.addAttribute("firstOneChar", firstOneChar.toUpperCase());

		model.addAttribute("itemList", itemService.findAllItem());
		model.addAttribute("itemListsss", itemService.findAllItem());
		model.addAttribute("questionTypeList", questionTypeService.getAllQuestionType());
		// System.out.println(subItemService.getAllSubItemsByQuestionTypeId(questionTypeId));
		model.addAttribute("listSubItem", subItemService.getAllSubItemsByQuestionTypeId(questionTypeId, itemId));
		model.addAttribute("questionList", questionService.getAllQuestionBySubItemId(subItemId));
		model.addAttribute("ivalue", itemId);
		model.addAttribute("key", questionTypeId);
		model.addAttribute("key1", subItemId);

		return "admin/itemsFolder";

	}

	@PostMapping("/addItems")
	public void addItem(@ModelAttribute Items item, HttpServletResponse resp) throws IOException {
		List<Items> saved = itemService.findAllItem();

		//for duplicacy check
		List<Items> check =saved.stream().filter(m->m.getItemName().equalsIgnoreCase(item.getItemName())).collect(Collectors.toList());
		PrintWriter writer = resp.getWriter();
		if (check.size() == 0) {
			itemService.saveItems(item);
			writer.print("success");
			
		}else {
			writer.print("failed");
		}
		
	}

	@PostMapping(path = "/addSubItem")
	public void addSubItem(@RequestParam(name = "itemName") Items item,
			@RequestParam(name = "subItemName") String subItem, @RequestParam(name = "type") QuestionType qtype,
			Model model, RedirectAttributes rd, HttpServletResponse resp) throws IOException {
		boolean subItemExist = subItemService.findAll().stream()
				.anyMatch(s -> s.getSubItemName().equalsIgnoreCase(subItem) && s.getItem().getItemId() == item.getItemId());
		PrintWriter writer = resp.getWriter();
		if (subItemExist) {	
       writer.print("failed");
		} else {

			SubItem sb = new SubItem();
			sb.setItem(item);
			sb.setQuestionType(qtype);
			sb.setSubItemName(subItem);
			subItemService.saveSubItem(sb);

			model.addAttribute("itemList", itemService.findAllItem());
			writer.print("success");
		}
	}

	@GetMapping("/getSubItemListByQuestionTypeId")
	public void getSubItemListByQuestionTypeId(@RequestParam(name = "questionTypeId") Integer questionTypeId,
			@RequestParam(name = "itemId") Integer itemId, HttpServletResponse resp) throws IOException {

		// Integer itemId = (Integer) httpSession.getAttribute("itemIdData");
		PrintWriter pw = resp.getWriter();
		List<SubItem> subItemList = subItemService.getAllSubItemsByQuestionTypeId(questionTypeId, itemId);
		System.out.println("++++++++++++++++" + subItemList);
		String t = "";
		t += "<option value='" + 0 + "'>" + "--select--" + "</option>";
		for (SubItem x : subItemList) {
			t += "<option value='" + x.getSubItemId() + "'>" + x.getSubItemName() + "</option>";
		}
		pw.print(t);

	}

	@PostMapping("/saveQuestions")
	public void saveQuestion(@RequestParam String optionStr, @RequestParam String questionText, @RequestParam String correctAns, @ModelAttribute Items itemId, @ModelAttribute QuestionType questionTypeId, @ModelAttribute SubItem sName, HttpServletResponse resp) throws IOException {
		PrintWriter writer = resp.getWriter();
		Question ques = new Question();
		ques.setItem(itemService.findItemNameByItemId(itemId.getItemId()));
		ques.setQuestionType(questionTypeService.findQuestionTypeByQuestionTypeId(questionTypeId.getQuestionTypeId()));
		ques.setQuestionText(questionText);
		if(sName.getSubItemId() == 0 ) {
			ques.setSubItem(null);
		}else {
			SubItem subItem = subItemService.findAll().stream().filter(t->t.getSubItemId() == sName.getSubItemId()).collect(Collectors.toList()).get(0);
			ques.setSubItem(subItem);			
		}
		ques.setCorrectAns(correctAns);
		
		String[] optarr = optionStr.split("#");
		for (int i = 0; i < optarr.length; i++) {
			if (i == 1) {
				ques.setOption1(optarr[0]);
				ques.setOption2(optarr[1]);

			}
			if (i == 2) {

				ques.setOption3(optarr[2]);

			}

			if (i == 3) {

				ques.setOption4(optarr[3]);

			}

			if (i == 4) {

				ques.setOption5(optarr[4]);

			}
		}

		ques.setQuestionStatus("0");
		Question question = questionService.saveQuestion(ques);
		if(question != null) {
			writer.print("success");
		}else {
			writer.print("failed");
		}
		
	}

	@GetMapping("/showQuestion")
	public String getQuestionByQuestionId(@RequestParam("questionId") Integer questionId, Model model) {

		User user = (User) this.httpSession.getAttribute("sessionData");
		model.addAttribute("username", user.getName());
		System.out.println("qid" + questionId);
		Question question = questionService.getQuestionById(questionId);
		System.out.println("list of Question" + question);

		model.addAttribute("question", question);
		return "admin/previewQuestion";
	}

	@GetMapping("/goBack")
	public String backToItem() {
		return "redirect:/exam/createFolder";

	}

	

	@PostMapping("/getQuestionsByExcel")
	public void addQuestionsByExcel(@RequestParam("excelQuestionfile") MultipartFile questionsByExcel,
			@RequestParam("itId") Items itemId, @RequestParam("qtypeId") QuestionType qTypeId,
			@RequestParam(name = "subName", required = false) SubItem subItemId,HttpServletResponse resp, RedirectAttributes redDirectAtt) throws IOException {
		PrintWriter writer = resp.getWriter();
		InputStream inputStream;
		try {
			inputStream = questionsByExcel.getInputStream();
			Workbook workbook = new XSSFWorkbook(inputStream);
			Sheet firstSheet = workbook.getSheetAt(0);
			int totalRows = firstSheet.getLastRowNum()+1;
			Boolean successCheck = false;
			
			if(totalRows >= 1) {
				Row next3 = firstSheet.getRow(0);
				
				 if(next3.getLastCellNum() != 7) {
						writer.print("columnsNotEqual");
					}else if(next3.getLastCellNum() == 7) {
						
						String result = "";
					for (int i = 0; i < next3.getLastCellNum(); i++) {
						String value = String.valueOf(next3.getCell(i)).trim();
						
						if(i == 0) {
							if(value.equalsIgnoreCase("question text") == false) {
								result+= i+1+" "+value+" , ";
								
							}
						}
						if(i == 1) {
							if(value.equalsIgnoreCase("option 1") == false) {
								result+= i+1+" "+value+" , ";
							}
						}
						if(i == 2) {
							if(value.equalsIgnoreCase("option 2") == false) {
								result+= i+1+" "+value+" , ";
							}
						}
						if(i == 3) {
							if(value.equalsIgnoreCase("option 3") == false) {
								result+= i+1+" "+value+" , ";
							}
						}
						if(i == 4) {
							if(value.equalsIgnoreCase("option 4") == false) {
								result+= i+1+" "+value+" , ";
							}
						}
						if(i == 5) {
							if(value.equalsIgnoreCase("option 5") == false) {
								result+= i+1+" "+value+" , ";
								System.out.println("helllo bro"+i);
							}
						}
						if(i == 6) {
							if(value.equalsIgnoreCase("correct Answer") == false) {
								result+= i+1+" "+value+" , ";
							}
						}		
						
					}
					
					if(result.length() > 0) {
						writer.print("Columns Name"+result);
					}
					if(result.length() == 0) {
						successCheck = true;
					}
					
				}
				
					
			}
					
			if(totalRows > 1 && successCheck) {
				List<Question> ques = new ArrayList<>();
				for (int i = 1; i < totalRows; i++) {
					Row next3 = firstSheet.getRow(i);
					Question que = new Question();
					for (int j = 0; j < 7; j++) {
						que.setQuestionText(String.valueOf(next3.getCell(0)));
						que.setOption1(String.valueOf(next3.getCell(1)));
						que.setOption2(String.valueOf(next3.getCell(2)));
						que.setOption3(String.valueOf(next3.getCell(3)));
						que.setOption4(String.valueOf(next3.getCell(4)));
						que.setOption5(String.valueOf(next3.getCell(5)));
						que.setCorrectAns(String.valueOf(next3.getCell(6)));
					}
					que.setItem(itemId);
					if(subItemId == null) {
						que.setSubItem(null);
					}else {
						que.setSubItem(subItemId);						
					}
					que.setQuestionStatus("0");
					que.setQuestionType(qTypeId);
					ques.add(que);
				}
				
				//save ques write
				System.out.println(ques);
				questionService.saveAll(ques);
				writer.print("success");
			}	
			workbook.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			writer.print("failed");
		}
		
		
	}
	
	@GetMapping("/questions/export/excel")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=regd_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);
		ObjectiveQuestionExcelExporter excelExporter = new ObjectiveQuestionExcelExporter(/* listQuestions */);

		excelExporter.export(response);
	}

	// For Subjective Question
	@GetMapping("/subjectiveQuestions/export/excel")
	public void exportToExcelSubjective(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=regd_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);
		SubjectiveQuestionExcelExporter excelExporter = new SubjectiveQuestionExcelExporter();

		excelExporter.export(response);
	}

	// for modal pop-up
	@GetMapping("/getQuestionBodyForModelById")
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
		if (question.getCorrectAns() != null) {
			st.append("<br>" + "<div style=\"color:red\" class=\"option\">\r\n"
					+ "      <span class=\"option-letter\">Correct Ans :-</span>\r\n"
					+ "      <span class=\"option-text\">" + question.getCorrectAns() + "</span>\r\n" + "    </div>");

		}
		st.append("</div>");

		resp.getWriter().print(st);

	}

	// for folder ajax for get all item
	@GetMapping("/getAllItems")
	public void getAllItemList(HttpServletResponse resp) throws IOException {
		System.out.println("ajax for get item List");

		List<Items> itemlist = itemService.findAllItem();
		System.out.println("INSIDE 1st AJAX::" + itemlist);
		String st = "";

		for (Items x : itemlist) {

			st = st + x.getItemName() + "_" + x.getItemId() + ",";

		}
		if (st.endsWith(",")) {
			st = st.substring(0, st.length() - 1);
		}
		resp.getWriter().print(st);
	}

	Integer q = 0;

	@GetMapping("/getTabInfo")
	public void getTabInfo(HttpServletResponse resp, @RequestParam(name = "Tab", required = false) Integer tab)
			throws IOException {
		Integer t;
		t = tab;
		if (t != null) {
			q = t;
			System.out.println("value of q is " + q);
			resp.getWriter().print(q);
		} else if (t == null) {
			System.out.println("value of q is " + q);
			resp.getWriter().print(q);
		}
	}

	// for downloading Result

}
