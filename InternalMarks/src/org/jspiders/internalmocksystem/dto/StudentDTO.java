package org.jspiders.internalmocksystem.dto;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="student_info")
public class StudentDTO {
	
	@Id
	@Column(name="usn")
	private String usn;
	@Column(name="first_name")
	private String firstName;
	@Column(name="middle_name")
	private String middleName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="college_name")
	private String collegeName;
	@Column(name="gender")
	private String gender;
	@Column(name="degree")
	private String degree;
	@Column(name="password")
	private String password;
	
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_first_usn")
	private List<FirstSemDTO> first;
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_second_usn")
	private List<SecondSemDTO> second;
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_third_usn")
	private List<ThirdSemDTO> third;
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_fourth_usn")
	private List<FourthSemDTO> fourth;
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_fifth_usn")
	private List<FifthSemDTO> fifth;
	@OneToMany(fetch = FetchType.EAGER,cascade=CascadeType.ALL)
	@JoinColumn(name="student_sixth_usn")
	private List<SixthSemDTO> sixth;
	
	public void addFirstSem(FirstSemDTO firstSem) {
		
		if(first == null)
			first = new LinkedList<FirstSemDTO>();
		
		first.add(firstSem);
	}
	
	public void addSecondSem(SecondSemDTO secondSem) {
		
		if(second == null)
			second = new LinkedList<SecondSemDTO>();
		
		second.add(secondSem);
	}

	public void addThirdSem(ThirdSemDTO thirdSem) {

		if(third == null)
			third= new LinkedList<ThirdSemDTO>();

		third.add(thirdSem);
	}

	public void addFourthSem(FourthSemDTO fourthSem) {

		if(fourth == null)
			fourth = new LinkedList<FourthSemDTO>();

		fourth.add(fourthSem);
	}

	public void addFifthSem(FifthSemDTO fifthSem) {

		if(fifth == null)
			fifth= new LinkedList<FifthSemDTO>();

		fifth.add(fifthSem);
	}

	public void addSixthSem(SixthSemDTO sixthSem) {

		if(sixth == null)
			sixth = new LinkedList<SixthSemDTO>();
	
		sixth.add(sixthSem);
	}
	
	
	public List<FirstSemDTO> getFirst() {
		return first;
	}

	public void setFirst(List<FirstSemDTO> first) {
		this.first = first;
	}

	public List<SecondSemDTO> getSecond() {
		return second;
	}

	public void setSecond(List<SecondSemDTO> second) {
		this.second = second;
	}

	public List<ThirdSemDTO> getThird() {
		return third;
	}

	public void setThird(List<ThirdSemDTO> third) {
		this.third = third;
	}

	public List<FourthSemDTO> getFourth() {
		return fourth;
	}

	public void setFourth(List<FourthSemDTO> fourth) {
		this.fourth = fourth;
	}

	public List<FifthSemDTO> getFifth() {
		return fifth;
	}

	public void setFifth(List<FifthSemDTO> fifth) {
		this.fifth = fifth;
	}

	public List<SixthSemDTO> getSixth() {
		return sixth;
	}

	public void setSixth(List<SixthSemDTO> sixth) {
		this.sixth = sixth;
	}

	public StudentDTO() {
	}
	
	public StudentDTO(String usn, String firstName, String middleName, String lastName, String collegeName,
			String gender, String degree, String password) {
		this.usn = usn;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.collegeName = collegeName;
		this.gender = gender;
		this.degree = degree;
		this.password = password;
	}

	public String getUsn() {
		return usn;
	}

	public void setUsn(String usn) {
		this.usn = usn;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCollegeName() {
		return collegeName;
	}

	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "StudentDTO [usn=" + usn + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName="
				+ lastName + ", collegeName=" + collegeName + ", gender=" + gender + ", degree=" + degree
				+ ", password=" + password + "]";
	}
}