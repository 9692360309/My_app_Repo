package com.csmtech.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.csmtech.model.CommunicationMaster;
import com.csmtech.model.TestTaker;
import com.csmtech.service.CommunicationService;
import com.csmtech.service.TestTakerService;
import com.csmtech.util.EmailServiceMessage;
import com.csmtech.util.FileUploadUtil;
import com.google.gson.Gson;

@Controller
@RequestMapping("exam")
public class CollegeController {

	@Autowired
	private TestTakerService testTakerService;

	@Autowired
	private CommunicationService communicationService;

	@RequestMapping(path = "/addCollege")
	public String addCollege(Model model) {
		model.addAttribute("collegeList", testTakerService.getAllCollege());
		return "admin/addCollege";
	}

	@RequestMapping("/saveCollege")
	public String addTestTaker(@RequestParam(name = "testTakerId", required = false) Integer testTakerId,@RequestParam(name = "testTakerName") String testTakerName,
			@RequestParam(name = "placementOfficer") String placementOfficer,@RequestParam(name = "officerEmail") String officerEmail,
			@RequestParam(name = "phoneNumber") String phoneNumber,@RequestParam(name = "collegeAddress") String collegeAddress, RedirectAttributes rd, Model model) {
		
		boolean anyMatch = testTakerService.getAll().stream()
				.anyMatch(t -> t.getTestTakerName().equalsIgnoreCase(testTakerName));
		TestTaker testTaker = new TestTaker();
		testTaker.setTestTakerName(testTakerName);
		testTaker.setCollegeAddress(collegeAddress);
		testTaker.setPlacementOfficer(placementOfficer);
		testTaker.setPhoneNumber(phoneNumber);
		testTaker.setOfficerEmail(officerEmail);
		testTaker.setIsDeleted("No");

		if (anyMatch == false && testTakerId == null) {
			testTakerService.save(testTaker);
			rd.addFlashAttribute("savecollege", "College saved successfully");
		} else if (anyMatch == false && testTakerId != null) {
			testTaker.setTestTakerId(testTakerId);
			testTakerService.save(testTaker);
			rd.addFlashAttribute("savecollege", "College Details Update successfully");
		} else if (anyMatch && testTakerId != null) {
			TestTaker tst = testTakerService.findById(testTakerId);
			if (tst.getTestTakerName().equalsIgnoreCase(testTakerName)) {
				testTaker.setTestTakerId(testTakerId);
				testTakerService.save(testTaker);
				rd.addFlashAttribute("savecollege", "College Details Update successfully");
			} else {
				rd.addFlashAttribute("errorMessage", "College Already Exist");
			}
		} else {
			rd.addFlashAttribute("errorMessage", "College Already Exist");
		}
		return "redirect:./addCollege";
	}

	@RequestMapping("/deleteCollege")
	public String deleteCollege(@RequestParam(name = "testTakerId") Integer testTakerId, RedirectAttributes rd) {
		TestTaker t = testTakerService.findById(testTakerId);
		if (t.getIsDeleted().equals("No")) {
			System.out.println("##########");
			t.setIsDeleted("Yes");
			testTakerService.save(t);
			rd.addFlashAttribute("delete", t.getTestTakerName());
		}
		return "redirect:./addCollege";
	}

	@RequestMapping("/updateCollege")
	public String updateCollege(@RequestParam(name = "testTakerId") Integer testTakerId, Model model,
			RedirectAttributes rd) {
		TestTaker college = testTakerService.findById(testTakerId);
		rd.addFlashAttribute("updateCollege", college);
		return "redirect:./addCollege";
	}

	@RequestMapping(path = "/getEmailByCollege")
	public void getEmailByCollege(@RequestParam(name = "collegeId") Integer testTakerId, HttpServletResponse resp)
			throws IOException {

		String email = testTakerService.getEmailIdByTestTakerId(testTakerId);
		System.out.println("@@@@@@" + email);
		resp.getWriter().print(email);
	}

	@RequestMapping(path = "/saveMessage")
	public String senEmailToOfficer(@RequestParam(name = "testTakerName") TestTaker testTaker,
			@RequestParam(name = "message") String message,
			@RequestParam(name = "attachments") MultipartFile[] attachment, Model model, RedirectAttributes rd)
			throws IllegalStateException, IOException {
		System.out.println("Hello++++++++++++++++++++++++++++++++++++" + attachment.length);

		CommunicationMaster c = new CommunicationMaster();
		c.setTestTaker(testTaker);
		c.setMessage(message);

		c.setFilePaths(FileUploadUtil.getFilePath(attachment));

		communicationService.saveAllDetails(c);
		rd.addFlashAttribute("saveDetail", "yes");
		EmailServiceMessage.sendEmailGmailTLS(testTaker, c);

		return "redirect:./addCollege";
	}

	// for report in the messages of Communication Tab
	@RequestMapping(path = "fetch_communication_records", method = RequestMethod.GET)
	public void getReportsByLimit(@RequestParam Integer limit, HttpServletResponse resp) {
		System.out.println("Comming");
		List<CommunicationMaster> reportsByLimit;
		if (limit == 0) {
			reportsByLimit = communicationService.findall();
		} else {
			reportsByLimit = communicationService.getReportsByLimit(limit);
		}
		System.out.println(reportsByLimit.size());

		// Convert the list to JSON using Gson
		Gson gson = new Gson();
		String json = gson.toJson(reportsByLimit);

		resp.setContentType("application/json"); // Set content type to JSON
		try {
			resp.getWriter().print(json); // Write the JSON to the response
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
