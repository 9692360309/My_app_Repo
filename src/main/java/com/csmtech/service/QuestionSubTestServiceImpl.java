package com.csmtech.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.bean.QuestionBean;
import com.csmtech.model.QuestionSubTest;
import com.csmtech.repository.QuestionSubTestRepository;

@Service
public class QuestionSubTestServiceImpl implements QuestionSubTestService {

	@Autowired
	QuestionSubTestRepository questionSubTestRepository;

	@Override
	public List<QuestionSubTest> findAll() {
		return questionSubTestRepository.findAll();
	}

	@Override
	public List<QuestionSubTest> findQuestionByQuestionId(Integer x) {
		return questionSubTestRepository.findByQuestionId(x);
	}

	@Override
	public void saveQS(QuestionSubTest questionSubTest) {
		questionSubTest.setQStId(null);
		questionSubTestRepository.save(questionSubTest);
	}

	@Override
	public List<QuestionBean> findAllQuestionBySubTest(Integer sId) {

		QuestionBean obj = null;
		List<QuestionBean> objlist = new ArrayList<>();
		try {
			List<QuestionSubTest> questionList = questionSubTestRepository.findAllQuestionBySubTestId(sId);
			for (QuestionSubTest q : questionList) {
				obj = new QuestionBean();
				obj.setQuestionId(q.getQStId());
				obj.setQuestionText(q.getQuestion().getQuestionText());
				obj.setOption1(q.getQuestion().getOption1());
				obj.setOption2(q.getQuestion().getOption2());
				obj.setOption3(q.getQuestion().getOption3());
				obj.setOption4(q.getQuestion().getOption4());
				obj.setCorrectAns(q.getQuestion().getCorrectAns());
				obj.setItem(q.getQuestion().getItem());
				obj.setSubItem(q.getQuestion().getSubItem());
				obj.setQuestionType(q.getQuestion().getQuestionType());


				objlist.add(obj);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return objlist;
	}

	@Override
	public List<QuestionSubTest> saveQuestionIfNotPresent(Integer sId) {

		return questionSubTestRepository.findAllQuestionBySubTestId(sId);
	}

	@Override
	public void deleteall(List<QuestionSubTest> saveQuestionIfNotPresent) {
		questionSubTestRepository.deleteAll(saveQuestionIfNotPresent);
	}

	@Override
	public void saveAll(List<QuestionSubTest> saveQuestionIfNotPresent) {
		questionSubTestRepository.saveAll(saveQuestionIfNotPresent);
	}

	@Override
	public List<QuestionSubTest> findAllQuestionBySubTest1(Integer sId) {
		return questionSubTestRepository.findAllQuestionBySubTestId(sId);
	}

	@Override
	public List<QuestionBean> findQuestionsRandomlyByGivingAdminInput(Integer noQuestion, Integer sId) {
		System.out.println(sId);
		System.out.println(noQuestion);
		QuestionBean obj1 = null;
		List<QuestionBean> objlist1 = new ArrayList<>();
		try {
			List<QuestionSubTest> questionList = questionSubTestRepository.findQuestionsRandomlyByGivingAdminInput(noQuestion,sId);
			for (QuestionSubTest q : questionList) {
				obj1 = new QuestionBean();
				obj1.setQuestionId(q.getQuestion().getQuestionId());
				obj1.setQuestionText(q.getQuestion().getQuestionText());
				obj1.setOption1(q.getQuestion().getOption1());
				obj1.setOption2(q.getQuestion().getOption2());
				obj1.setOption3(q.getQuestion().getOption3());
				obj1.setOption4(q.getQuestion().getOption4());
				obj1.setCorrectAns(q.getQuestion().getCorrectAns());
				obj1.setItem(q.getQuestion().getItem());
				obj1.setSubItem(q.getQuestion().getSubItem());
				obj1.setQuestionType(q.getQuestion().getQuestionType());


				objlist1.add(obj1);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return objlist1;
	}

	@Override
	public Integer countAllQuestionBySubtestId(Integer sId) {
		return questionSubTestRepository.countAllQuestionSubtestId(sId);
	}
}
