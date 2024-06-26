package com.csmtech.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.csmtech.bean.QuestionBean;
import com.csmtech.model.QuestionSubTest;

@Service
public interface QuestionSubTestService {

	List<QuestionSubTest> findAll();

	List<QuestionSubTest> findQuestionByQuestionId(Integer x);

	void saveQS(QuestionSubTest questionSubTest);

	List<QuestionBean> findAllQuestionBySubTest(Integer sId);

	List<QuestionSubTest> findAllQuestionBySubTest1(Integer sId);

	List<QuestionSubTest> saveQuestionIfNotPresent(Integer sId);

	void deleteall(List<QuestionSubTest> saveQuestionIfNotPresent);

	Integer countAllQuestionBySubtestId(Integer sId);
	
	void saveAll(List<QuestionSubTest> saveQuestionIfNotPresent);

	List<QuestionBean> findQuestionsRandomlyByGivingAdminInput(Integer noQuestion, Integer sId);

}
