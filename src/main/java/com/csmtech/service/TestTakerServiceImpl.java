package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.TestTaker;
import com.csmtech.repository.TestTakerRepository;

@Service
public class TestTakerServiceImpl implements TestTakerService {

	@Autowired
	private TestTakerRepository testTakerRepository;

	@Override
	public TestTaker save(TestTaker testTaker) {
		return testTakerRepository.save(testTaker);
	}

	@Override
	public List<TestTaker> getAll() {
		return testTakerRepository.findAll();
	}

	@Override
	public TestTaker getTestTakerName(Integer testTakerId) {
		return testTakerRepository.findTestTakerNameByTestTakerId(testTakerId);
	}

	@Override
	public List<TestTaker> getAllCollege() {
		return testTakerRepository.getAllCollege();
	}

	@Override
	public TestTaker findById(Integer testTakerId) {
		return testTakerRepository.findTestTakerById(testTakerId);
	}

	@Override
	public String getEmailIdByTestTakerId(Integer testTakerId) {
		return testTakerRepository.getEmailIdByTestTakerId(testTakerId);
	}

	@Override
	public Integer getIdByName(String testTakerName) {
		return testTakerRepository.getIdByName(testTakerName);
	}

	@Override
	public TestTaker getById(Integer testTakerNameId) {
		// TODO Auto-generated method stub
		return testTakerRepository.getById(testTakerNameId);
	}

	

}
