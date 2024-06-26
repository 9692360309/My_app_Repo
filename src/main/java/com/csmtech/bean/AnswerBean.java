package com.csmtech.bean;

import java.beans.JavaBean;
import java.io.Serializable;

import lombok.Data;

@Data
public class AnswerBean implements Serializable{
	private Integer questionId;
	private String option;
	private String correctAns;
}
