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

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Entity
@Table(name="subitem")
public class SubItem {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_item_id")
	private Integer subItemId;
	
	@Column(name="sub_item_name")
	private String subItemName;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "item_id")
	private Items item;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name = "question_type_id")
	private QuestionType questionType;
}
