package com.csmtech.service;

import java.util.List;

import com.csmtech.model.CommunicationMaster;

public interface CommunicationService {

	CommunicationMaster saveAllDetails(CommunicationMaster c);
	
List<CommunicationMaster> findall();
	
	List<CommunicationMaster> getReportsByLimit(Integer limit);

}
