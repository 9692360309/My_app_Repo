package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.CommunicationMaster;
import com.csmtech.repository.CommunicationRepository;

@Service
public class CommunicationServiceImpl implements CommunicationService{
	
	@Autowired
	private CommunicationRepository communicationRepository;

	@Override
	public CommunicationMaster saveAllDetails(CommunicationMaster c) {
		
		return communicationRepository.save(c);
	}
	@Override
	public List<CommunicationMaster> findall() {
		return communicationRepository.findAllRecords();
	}

	@Override
	public List<CommunicationMaster> getReportsByLimit(Integer limit) {
		return communicationRepository.getAllSaveRecords(limit);
	}

}
