package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.csmtech.model.Candidate;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Integer> {

	@Query("SELECT c From  Candidate c where c.candidateemail=:username and c.candpassword=:password")
	Candidate findCandidateByCandnameAndPassword(@Param("username") String username, @Param("password") String password);

	@Transactional
	@Modifying
	@Query("Update Candidate set isdelete='Yes' where candid=:candid")
	void deleteCandidateById(Integer candid);

	@Query("From Candidate where isdelete='No'")
	List<Candidate> findAllNotDeleted();
	
	@Query(nativeQuery = true, value = "select * from Candidate where candid=:candid")
	Candidate findDetailsById(Integer candid);

	@Query("SELECT c From  Candidate c where c.candidateemail=:username and c.candpassword=:password")
	Candidate findCandidateByCandnameAndPasswordForCheck(@Param("username") String username, @Param("password") String password);

	@Query("From Candidate where subTestTaker.subTestTakerId=:subTestTakerId")
	List<Candidate> findCandidateBySubTestTakerId(Integer subTestTakerId);

	@Query("select markAppear from Candidate")
	List<Integer> getCandidateMarkList();

	@Query("From Candidate where subTestTaker.testTaker.testTakerId=:testTakerId")
	List<Candidate> findCandidateByTestTakerId(Integer testTakerId);

	@Query("From Candidate where subTestTaker.testTaker.testTakerId=:testTakerId and subTestTaker.subTestTakerId=:subTetTakerId")
	List<Candidate> findBytestTakerIdAndsubTetTakerId(Integer testTakerId, Integer subTetTakerId);
	
	@Query("SELECT c From  Candidate c where c.candidateemail=:username")
	Candidate getCandidateByEmail(@Param("username") String username);

	@Query("From Candidate where subTestTaker.testTaker.testTakerId=:testTakerId and subTestTaker.subTestTakerId=:subtestTakerId and markAppear!='null'")
	List<Candidate> getBytestTakerIdAndsubTetTakerId(Integer testTakerId, Integer subtestTakerId);

}
