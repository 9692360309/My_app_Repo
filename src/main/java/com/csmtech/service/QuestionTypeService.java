package com.csmtech.service;

import java.util.List;

import com.csmtech.model.QuestionType;

public interface QuestionTypeService {

	List<QuestionType> getAllQuestionType();

	QuestionType findQuestionTypeByQuestionTypeId(Integer questionTypeId);

}
