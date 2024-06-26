package com.csmtech.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Data
@Entity
@Table(name = "test_taker")
public class TestTaker {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "test_taker_id")
private Integer testTakerId;

@Column(name = "test_taker_name")
private String testTakerName;

@Column(name = "college_address")
private String collegeAddress;

@Column(name = "placement_office_name")
private String placementOfficer;

@Column(name = "placement_office_phone")
private String phoneNumber;

@Column(name = "placement_office_email")
private String officerEmail;

@Column(name = "is_deleted")
private String isDeleted;

}