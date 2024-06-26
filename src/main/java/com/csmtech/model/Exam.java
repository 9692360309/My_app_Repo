package com.csmtech.model;

import java.io.Serializable;
import java.sql.Time;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.Data;

@Data
@Table(name="exam")
@Entity
public class Exam implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="exam_id")
	private Integer examId;
	
	@Column(name="exam_name")
	private String examName;
	
	private String description;
	
	@Column(name="time_limit")
	private Integer timeLimit;
	
	@Column(name="pass_score")
	private Double passScore;
	
	@Column(name="total_score")
	private Double totalScore;
	
	@Column(name="exam_code")
	private String examCode;
	
}
