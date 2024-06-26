package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.SubItem;
import com.csmtech.model.SubTest;
import com.csmtech.repository.SubTestRepository;

@Service
public class SubTestServiceImpl implements SubTestService {

	@Autowired
	private SubTestRepository subTestRepository;

	@Override
	public List<SubTest> getAllSubTestByTestId(Integer testId) {
		return subTestRepository.getAllSubTestByTestId(testId);
	}

	@Override
	public SubTest saveSubTest(SubTest sb) {
		return subTestRepository.save(sb);
	}

	@Override
	public List<SubTest> findAllSubTest() {

		return subTestRepository.findAll();
	}

	@Override
	public SubTest findById(Integer sId) {
		return subTestRepository.findById(sId).get();
	}

	@Override
	public SubTest findSubTest(Integer subTestId) {
		return subTestRepository.findBySubTestId(subTestId);
	}
	
	@Override
	public List<SubTest> findAll() {

		return subTestRepository.findAll();
	}

	@Override
	public SubTest getSubTestById(Integer sId) {
		return subTestRepository.findById(sId).get();
	}


}
