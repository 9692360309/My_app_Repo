package com.csmtech.model;

import java.io.Serializable;
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

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name="users")
public class User implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="userid")
	private Integer userId;
	
	private String name;
	
	private String username;
	
	private String password;
	
	private String mobileNo;
	
	private String gender;
	
	private String email;
	
	private String status;
	
	private String userAddress;
	
	@Column(name="isdelete")
	private String isDelete;
	
	@ManyToOne(cascade= CascadeType.ALL)
	@JoinColumn(name="roleid")
	private Role role;
	

	
	
	
	
}
