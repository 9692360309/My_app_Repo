package com.csmtech.model;

import java.sql.Time;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalTime;
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

import lombok.Data;

@Table(name="configure_table")
@Data
@Entity
public class Configure {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="config_id")
	private Integer configId;
	@Column(name="test_date")
	private LocalDate testDate;
	@Column(name="login_time")
	private LocalTime loginTime;
	@Column(name="start_time")
	private LocalTime startTime;
	@Column(name="end_time")
	private LocalTime endTime;
	@Column(name="test_duration")
	private LocalTime testDuration;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "subtest_taker_id")
	private SubTestTaker subTestTaker;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "sub_Test_Id")
	private SubTest subTest;
	@Column(name="enter_no_question")
	private Integer enterNoQuestion;
	
	
	
}
