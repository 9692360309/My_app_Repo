package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Configure;

public interface ConfigureService {

	Configure saveConfigure(Configure cf);


	Configure findConfigureBySubTestTakerId(Integer subTestTakerId);

	Configure getAllConfDetails(Integer candSubTestTakerId);


}
