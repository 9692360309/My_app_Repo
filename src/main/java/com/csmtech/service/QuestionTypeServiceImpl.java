package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.QuestionType;
import com.csmtech.repository.QuestionTypeRepository;

@Service
public class QuestionTypeServiceImpl implements QuestionTypeService {

	@Autowired
	private QuestionTypeRepository questionTypeRepository;

	@Override
	public List<QuestionType> getAllQuestionType() {

		return questionTypeRepository.findAll();
	}

	@Override
	public QuestionType findQuestionTypeByQuestionTypeId(Integer questionTypeId) {
		return questionTypeRepository.findQuestionTypeByQuestionTypeId(questionTypeId);
	}

}
