package com.csmtech.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity
@Table(name = "communication")
public class CommunicationMaster implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "communication_id")
	private Integer communicationId;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "test_taker_id")
	private TestTaker testTaker;

	private String message;

	@ElementCollection
	@Column(name = "file_path")
	private List<String> filePaths;

}