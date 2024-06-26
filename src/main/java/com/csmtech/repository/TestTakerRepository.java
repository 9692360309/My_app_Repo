package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.TestTaker;

@Repository
public interface TestTakerRepository extends JpaRepository<TestTaker, Integer> {

	TestTaker findTestTakerNameByTestTakerId(Integer testTakerId);

	@Query("from TestTaker where isDeleted='No'")
	List<TestTaker> getAllCollege();

	@Query("from TestTaker where testTakerId=:testTakerId")
	TestTaker findTestTakerById(Integer testTakerId);

	@Query("select officerEmail from TestTaker where testTakerId=:testTakerId")
	String getEmailIdByTestTakerId(Integer testTakerId);

	@Query("select testTakerId from TestTaker where testTakerName=:testTakerName")
	Integer getIdByName(String testTakerName);

}
