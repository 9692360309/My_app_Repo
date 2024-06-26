package com.csmtech.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Table(name = "candidate")
@Entity
public class Candidate {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "candidate_id")
	private Integer candid;

	@Column(name = "candidate_first_name")
	private String candFirstname;

	@Column(name = "candidate_last_name")
	private String candLastname;

	@Column(name = "candidate_password")
	private String candpassword;

	@Column(name = "candidate_email")
	private String candidateemail;

	@Column(name = "candidate_mobile_no")
	private String candMobile;

	@Column(name = "candidate_college_name")
	private String candCollegeName;

	private String status;

	@Column(name = "is_delete")
	private String isdelete;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "subtest_taker_id")
	private SubTestTaker subTestTaker;

	@Column(name = "mark_appear")
	private Integer markAppear;

	@Column(name = "total_mark")
	private Double totalMark;

	@Column(name = "result_status")
	private String resultStatus;

}
