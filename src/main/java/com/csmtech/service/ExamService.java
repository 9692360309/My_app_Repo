package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Exam;

public interface ExamService {

	Exam saveExamDetails(Exam exam);
	
	List<Exam> findAllExamCode();


}
