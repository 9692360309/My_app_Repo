package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Candidate;

public interface CandidateService {

	Candidate findCandidateByCandnameAndPassword(String username, String password);

	Candidate saveCandidate(Candidate candidate);

	List<Candidate> findAllCandidate();

	void deleteCandidateById(Integer candid);

	Candidate updateCandidateById(Integer candid);

	Candidate findDetailsById(Integer candid);

	Candidate findCandidateByCandnameAndPasswordForCheck(String username, String password);

	List<Candidate> findCandidateBySubTestTakerId(Integer subTestTakerId);

	List<Integer> getCandidateMarkList();

	List<Candidate> findCandidateByTestTakerId(Integer testTakerId);

	List<Candidate> findBytestTakerIdAndsubTetTakerId(Integer testTakerId, Integer subTetTakerId);

	Candidate getCandidateByEmail(String username);

	List<Candidate> getBytestTakerIdAndsubTetTakerId(Integer testTakerId, Integer subtestTakerId);


	

}
