package com.csmtech.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "sub_test_taker")
public class SubTestTaker {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "subtest_taker_id")
	private Integer subTestTakerId;

	@Column(name = "subtest_taker_name")
	private String subTestTakerName;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "test_taker_id")
	private TestTaker testTaker;

}

