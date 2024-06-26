package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.SubTest;

@Repository
public interface SubTestRepository extends JpaRepository<SubTest, Integer> {

	@Query("FROM SubTest WHERE test.testId=:testId")
	List<SubTest> getAllSubTestByTestId(Integer testId);

	@Query("FROM SubTest WHERE subTestId=:subTestId")
	SubTest findBySubTestId(Integer subTestId);

}
