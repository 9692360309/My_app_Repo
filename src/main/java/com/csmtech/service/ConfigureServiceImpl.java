package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Configure;
import com.csmtech.repository.ConfigureRepository;

@Service
public class ConfigureServiceImpl implements ConfigureService {

	@Autowired
	private ConfigureRepository configureRepository;

	@Override
	public Configure saveConfigure(Configure cf) {

		return configureRepository.save(cf);
	}

	@Override

	public Configure findConfigureBySubTestTakerId(Integer subTestTakerId) {
		
		return configureRepository.findConfigureBySubTestTakerId(subTestTakerId);
	}

	public Configure getAllConfDetails(Integer candSubTestTakerId) {
		return configureRepository.findDetails(candSubTestTakerId);

	}

}
