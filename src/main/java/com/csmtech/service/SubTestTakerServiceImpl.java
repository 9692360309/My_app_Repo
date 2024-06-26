package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.SubTestTaker;
import com.csmtech.repository.SubTestTakerRepository;

@Service
public class SubTestTakerServiceImpl implements SubTestTakerService {

	@Autowired
	private SubTestTakerRepository subTestTakerRepository;

	@Override
	public SubTestTaker save(SubTestTaker sub) {
		return subTestTakerRepository.save(sub);
	}

	@Override
	public List<SubTestTaker> getAllSubTestTakerByTestTakerId(Integer testTakerId) {

		return subTestTakerRepository.getAllSubTestTakerByTestTakerId(testTakerId);
	}

	@Override
	public SubTestTaker getSubTestTaker(Integer subTestTakerId) {

		return subTestTakerRepository.getSubTestTaker(subTestTakerId);
	}

	@Override
	public SubTestTaker findSubTestTakerName(Integer subTestTakerId) {
		return subTestTakerRepository.findSubTestTakerNameBySubTestTakerId(subTestTakerId);
	}

	@Override
	public SubTestTaker getSubTestTaker1(Integer subTestTaker) {
		// TODO Auto-generated method stub
		return subTestTakerRepository.findBytestTaker(subTestTaker);
	}
}
