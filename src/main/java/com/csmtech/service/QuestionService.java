package com.csmtech.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.csmtech.model.Question;
import com.csmtech.model.QuestionType;

public interface QuestionService {

	Question saveQuestion(Question ques);

	List<Question> findAllQuestion();

	Question getDetailsByQuestionId(Integer questionId);

	List<Question> getAllQuestionBySubItemId(Integer subItemId);

	Question getQuestionById(Integer questionId);

	// <QuestionType> getAllQuestionByItemId(Integer itemId);

	List<Question> getAllQuestionBySubItemIdForTest(Integer subItemId, Integer questionTypeId);

	Question getAllQuestionsByQuestionId(Integer questionId);

	Question findQuestionByQuestionId(Integer qId);

	List<Question> getQuestionbyQuestionId(List<Integer> selectedQList);

	String getCorrectAns(Integer questionId);

	List<Question> getAllQuestionByItemId(Integer itemId, Integer questionTypeId);

	List<Question> getAllQuestionbyQuestionId(List<Integer> selectedQList);

	void saveAll(List<Question> ques);

}
