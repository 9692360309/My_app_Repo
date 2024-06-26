package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.csmtech.model.Question;
import com.csmtech.model.QuestionType;
import com.csmtech.repository.QuestionRepository;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionRepository questionRepository;

	@Override
	public Question saveQuestion(Question ques) {

		return questionRepository.save(ques);
	}

	@Override
	public List<Question> findAllQuestion() {

		return questionRepository.findAll();
	}

	@Override
	public Question getDetailsByQuestionId(Integer questionId) {

		return questionRepository.getDetailsByQuestionId(questionId);
	}

	@Override
	public List<Question> getAllQuestionBySubItemId(Integer subItemId) {

		return questionRepository.getAllQuestionBySubItemId(subItemId);
	}

	@Override
	public Question getQuestionById(Integer questionId) {

		return questionRepository.getQuestionById(questionId);
	}

//	@Override
//	public List<QuestionType> getAllQuestionByItemId(Integer itemId) {
//
//		return questionRepository.getAllQuestionByItemId(itemId);
//	}

	@Override
	public List<Question> getAllQuestionBySubItemIdForTest(Integer subItemId, Integer questionTypeId) {
		return questionRepository.getAllQuestionBySubItemIdForTest(subItemId, questionTypeId);
	}

	@Override
	public Question getAllQuestionsByQuestionId(Integer questionId) {
		return this.questionRepository.findById(questionId).get();
	}


	@Override
	public Question findQuestionByQuestionId(Integer qId) {

		return questionRepository.findQuestionByQuestionId(qId);
	}

	@Override
	public List<Question> getQuestionbyQuestionId(List<Integer> selectedQList) {
		System.out.println("jjjjjjjjjjjjjjjjjjjjjjj"+selectedQList);
		System.out.println(questionRepository.findAllById(selectedQList));
		return questionRepository.findAllById(selectedQList);
	}

	@Override
	public String getCorrectAns(Integer questionId) {
		return questionRepository.getCorrectAns(questionId);
	}

	@Override
	public List<Question> getAllQuestionByItemId(Integer itemId, Integer questionTypeId) {
		
		return questionRepository.getAllQuestionByItemId(itemId,questionTypeId);
	}

	@Override
	public List<Question> getAllQuestionbyQuestionId(List<Integer> selectedQList) {
		System.out.println("************************888"+selectedQList);
		return questionRepository.findAllById(selectedQList);
	}

	@Override
	public void saveAll(List<Question> ques) {
		questionRepository.saveAll(ques);
		
	}

}
