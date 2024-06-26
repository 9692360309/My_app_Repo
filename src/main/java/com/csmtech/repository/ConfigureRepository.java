package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.Configure;

@Repository
public interface ConfigureRepository extends JpaRepository<Configure, Integer> {


	@Query("From Configure where subTestTaker.subTestTakerId=:subTestTakerId")
	Configure findConfigureBySubTestTakerId(Integer subTestTakerId);

	@Query("from Configure where subTestTaker.subTestTakerId=:candSubTestTakerId")
	Configure findDetails(Integer candSubTestTakerId);


}
