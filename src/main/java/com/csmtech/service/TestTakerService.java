package com.csmtech.service;

import java.util.List;

import com.csmtech.model.TestTaker;

public interface TestTakerService {

	TestTaker save(TestTaker testTaker);

	List<TestTaker> getAll();

	TestTaker getTestTakerName(Integer testTakerId);

	List<TestTaker> getAllCollege();

	TestTaker findById(Integer testTakerId);

	String getEmailIdByTestTakerId(Integer testTakerId);

	Integer getIdByName(String testTakerName);

	TestTaker getById(Integer testTakerNameId);


}