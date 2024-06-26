package com.csmtech.service;

import java.util.List;

import com.csmtech.model.SubTestTaker;

public interface SubTestTakerService {

	SubTestTaker save(SubTestTaker sub);

	List<SubTestTaker> getAllSubTestTakerByTestTakerId(Integer testTakerId);

	SubTestTaker getSubTestTaker(Integer subTestTakerId);

	SubTestTaker findSubTestTakerName(Integer subTestTakerId);

	SubTestTaker getSubTestTaker1( Integer subTestTaker);


}
