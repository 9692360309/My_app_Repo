package com.csmtech.service;

import java.util.List;

import com.csmtech.model.Answer;

public interface AnswerService {

	Answer save(Answer ans);

	List<Integer> getMark(Integer candidateId);

}
