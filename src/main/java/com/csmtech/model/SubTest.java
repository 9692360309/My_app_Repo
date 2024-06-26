package com.csmtech.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@Entity
@Table(name="subtest")
public class SubTest {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_Test_Id")
	private Integer subTestId;
	
	@Column(name="sub_Test_Name")
	private String subTestName;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name="test_id")
	private Test test;

	@Column(name="property_type")
	private String propertyType;

	@Override
	public String toString() {
		return "SubTest [subTestId=" + subTestId + ", subTestName=" + subTestName + ", test=" + test + ", propertyType="
				+ propertyType + "]";
	}
	

	
	

}
