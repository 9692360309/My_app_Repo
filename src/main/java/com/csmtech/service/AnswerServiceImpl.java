package com.csmtech.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csmtech.model.Answer;
import com.csmtech.repository.AnswerRepository;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerRepository answerRepository;

	@Override
	public Answer save(Answer ans) {

		return answerRepository.save(ans);
	}

	@Override
	public List<Integer> getMark(Integer candidateId) {
		return answerRepository.getMark(candidateId);
	}

}
