package org.jspiders.internalmocksystem.dto;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="sixth_sem")
public class SixthSemDTO {

	@GenericGenerator(name="myGen",strategy="increment")
	@GeneratedValue(generator="myGen")
	@Id
	@Column(name="info_id")
	private int infoId;
	@Column(name="subject_code")
	private String subjectCode;
	@Column(name="subject_name")
	private String subjectName;
	@Column(name="marks")
	private int marks;
	
	public SixthSemDTO() {
	}

	public SixthSemDTO(String subjectCode, String subjectName, int marks) {
		this.subjectCode = subjectCode;
		this.subjectName = subjectName;
		this.marks = marks;
	}

	public int getInfoId() {
		return infoId;
	}

	public void setInfoId(int infoId) {
		this.infoId = infoId;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public int getMarks() {
		return marks;
	}

	public void setMarks(int marks) {
		this.marks = marks;
	}

	@Override
	public String toString() {
		return "SixthSemDTO [infoId=" + infoId + ", subjectCode=" + subjectCode + ", subjectName=" + subjectName
				+ ", marks=" + marks + "]";
	}
}
