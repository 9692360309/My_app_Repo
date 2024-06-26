package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Exam;
import com.csmtech.repository.ExamRepository;

@Service
public class ExamServiceImpl implements ExamService{

	@Autowired
	private ExamRepository examRepository;

	@Override
	public Exam saveExamDetails(Exam exam) {
		
		return examRepository.save(exam);
	}

	

	@Override
	public List<Exam> findAllExamCode() {
		
		return examRepository.findAll();
	}

}
