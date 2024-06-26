package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Test;
import com.csmtech.repository.TestRepository;

@Service
public class TestServiceImpl implements TestService {

	@Autowired
	private TestRepository testRepository;

	@Override
	public List<Test> getAllTest() {

		return testRepository.findAll();
	}

	@Override
	public Test saveTest(Test test) {
		return testRepository.save(test);
	}

	@Override
	public Test findTestNameByTestId(Integer testId) {
		return testRepository.findTestNameByTestId(testId);
	}

	

}
