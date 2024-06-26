package com.csmtech.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "question")
public class Question implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "question_id")
	private Integer questionId;

	@Column(name = "question_text")
	private String questionText;

	@Column(name = "option_1")
	private String option1;

	@Column(name = "option_2")
	private String option2;

	@Column(name = "option_3")
	private String option3;

	@Column(name = "option_4")
	private String option4;

	@Column(name = "option_5")
	private String option5;

	@Column(name = "correct_ans")
	private String correctAns;

	@Column(name = "question_status")
	private String questionStatus;

	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "item_id")
	private Items item;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "sub_item_id")
	private SubItem subItem;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "question_type_id")
	private QuestionType questionType;
	

	@Override
	public String toString() {
		return "Question [questionId=" + questionId + ", questionText=" + questionText + ", option1=" + option1
				+ ", option2=" + option2 + ", option3=" + option3 + ", option4=" + option4 + ", option5=" + option5
				+ ", correctAns=" + correctAns + ", questionStatus=" + questionStatus + ", item=" + item + ", subItem="
				+ subItem + ", questionType=" + questionType + "]";
	}

	
}
