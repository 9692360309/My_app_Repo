package com.csmtech.service;

import java.util.List;

import com.csmtech.model.SubItem;
import com.csmtech.model.SubTest;

public interface SubTestService {

	List<SubTest> getAllSubTestByTestId(Integer testId);

	SubTest saveSubTest(SubTest sb);

	List<SubTest> findAllSubTest();

	SubTest findById(Integer sId);

	SubTest findSubTest(Integer subTestId);
	
	List<SubTest> findAll();

	SubTest getSubTestById(Integer sId);

}
