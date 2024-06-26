package com.csmtech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.Data;

@Data
@Entity
@Table(name="question_subtest")
public class QuestionSubTest {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="question_subtest_id")
	private Integer qStId;
	
	@ManyToOne
	@JoinColumn(name="questioin_id")
	private Question question;

	@ManyToOne
	@JoinColumn(name="sub_test_id")
	private SubTest subTest;
	
	@Transient
	private String status;
	
}
