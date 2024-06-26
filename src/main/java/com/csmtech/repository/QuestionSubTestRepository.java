package com.csmtech.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.csmtech.model.QuestionSubTest;

@Repository
public interface QuestionSubTestRepository extends JpaRepository<QuestionSubTest, Integer> {

	@Query("from QuestionSubTest where question.questionId=?1")
	List<QuestionSubTest> findByQuestionId(Integer x);

	@Query("FROM QuestionSubTest WHERE subTest.subTestId= :sId")
	List<QuestionSubTest> findAllQuestionBySubTestId(Integer sId);
	
	@Query(nativeQuery = true, value = "SELECT COUNT(*) FROM question_subtest WHERE sub_test_id=:sId")
	Integer countAllQuestionSubtestId(Integer sId);
	@Query(nativeQuery = true, value = "SELECT * FROM question_subtest WHERE sub_test_id=:sId ORDER BY RAND() LIMIT :noQuestion")
	List<QuestionSubTest> findQuestionsRandomlyByGivingAdminInput(Integer noQuestion, Integer sId);

	/*
	 * @Query("from QuestionSubTest where question.questionId=?1") QuestionSubTest
	 * findByQuestionId(Integer x);
	 */

}
