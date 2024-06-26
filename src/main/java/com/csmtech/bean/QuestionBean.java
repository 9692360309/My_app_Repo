package com.csmtech.bean;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.csmtech.model.Items;
import com.csmtech.model.QuestionType;
import com.csmtech.model.SubItem;

import lombok.Data;

@Data
public class QuestionBean {

	private Integer questionId;

	private String questionText;

	private String option1;

	private String option2;

	private String option3;

	private String option4;

	private String correctAns;
	
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


}
