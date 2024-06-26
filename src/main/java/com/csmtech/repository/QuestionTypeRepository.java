package com.csmtech.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.csmtech.model.QuestionType;

public interface QuestionTypeRepository extends JpaRepository<QuestionType, Integer>{

	QuestionType findQuestionTypeByQuestionTypeId(Integer questionTypeId);

}
