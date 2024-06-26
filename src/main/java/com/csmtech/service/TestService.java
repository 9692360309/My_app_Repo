package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Test;

public interface TestService {

	List<Test> getAllTest();

	Test saveTest(Test test);

	Test findTestNameByTestId(Integer testId);

}
