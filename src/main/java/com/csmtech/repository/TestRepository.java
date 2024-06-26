package com.csmtech.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.Test;

@Repository
public interface TestRepository extends JpaRepository<Test, Integer>{

	Test findTestNameByTestId(Integer testId);

	

}
