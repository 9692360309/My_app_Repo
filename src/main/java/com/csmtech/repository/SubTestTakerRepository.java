package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.csmtech.model.SubTestTaker;

public interface SubTestTakerRepository extends JpaRepository<SubTestTaker, Integer> {

	@Query("From SubTestTaker where testTaker.testTakerId=:testTakerId")
	List<SubTestTaker> getAllSubTestTakerByTestTakerId(Integer testTakerId);

	@Query("From SubTestTaker where subTestTakerId=:subTestTakerId")
	SubTestTaker getSubTestTaker(Integer subTestTakerId);

	SubTestTaker findSubTestTakerNameBySubTestTakerId(Integer subTestTakerId);

	@Query("from SubTestTaker where testTaker.testTakerId=:subTestTaker")
	SubTestTaker findBytestTaker(Integer subTestTaker);
}
