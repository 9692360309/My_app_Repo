package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.csmtech.model.CommunicationMaster;

public interface CommunicationRepository extends JpaRepository<CommunicationMaster, Integer>{
	
	@Query(value = "SELECT * FROM communication ORDER BY communication_id ASC LIMIT ?1", nativeQuery = true)
	List<CommunicationMaster> getAllSaveRecords(Integer limit);
	
	@Query(value = "SELECT * FROM communication ORDER BY communication_id ASC", nativeQuery = true)
	List<CommunicationMaster> findAllRecords();
}
