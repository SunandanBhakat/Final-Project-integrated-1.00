package com.waytopolicy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name = "tbl_user_info")
@Proxy(lazy = false)
public class User {
	@Id
	@Column(name = "email_id")
	private String emailId;
	@Column(name = "firstname")
	private String firstName;
	@Column(name = "lastname")
	private String lastName;
	@Column(name = "dob")
	private String dob;
	@Column(name = "gender")
	private String gender;
	@Column(name = "contact_no")
	private String contactNo;
	@Column(name = "address")
	private String address;
	@Column(name = "qualification")
	private String qualification;
	@Column(name = "salary_per_month")
	private String salaryPerMonth;
	@Column(name = "pan_no")
	private String pan;
	@Column(name = "employer_type")
	private String employerType;
	@Column(name = "employer_name")
	private String employerName;
	@Column(name = "hint_question")
	private String hintQuestion;
	@Column(name = "hint_answer")
	private String hintAnswer;
	@Column(name = "password")
	private String password;

	public User(String emailId, String firstName, String lastName, String dob, String gender, String contactNo,
			String address, String qualification, String salaryPerMonth, String pan, String employerType,
			String employerName, String hintQuestion, String hintAnswer, String password) {
		super();
		this.emailId = emailId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.gender = gender;
		this.contactNo = contactNo;
		this.address = address;
		this.qualification = qualification;
		this.salaryPerMonth = salaryPerMonth;
		this.pan = pan;
		this.employerType = employerType;
		this.employerName = employerName;
		this.hintQuestion = hintQuestion;
		this.hintAnswer = hintAnswer;
		this.password = password;
	}

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSalaryPerMonth() {
		return salaryPerMonth;
	}

	public void setSalaryPerMonth(String salaryPerMonth) {
		this.salaryPerMonth = salaryPerMonth;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getEmployerType() {
		return employerType;
	}

	public void setEmployerType(String employerType) {
		this.employerType = employerType;
	}

	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getHintQuestion() {
		return hintQuestion;
	}

	public void setHintQuestion(String hintQuestion) {
		this.hintQuestion = hintQuestion;
	}

	public String getHintAnswer() {
		return hintAnswer;
	}

	public void setHintAnswer(String hintAnswer) {
		this.hintAnswer = hintAnswer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [emailId=" + emailId + ", firstName=" + firstName + ", lastName=" + lastName + ", dob=" + dob
				+ ", gender=" + gender + ", contactNo=" + contactNo + ", address=" + address + ", qualification="
				+ qualification + ", salaryPerMonth=" + salaryPerMonth + ", pan=" + pan + ", employerType="
				+ employerType + ", employerName=" + employerName + ", hintQuestion=" + hintQuestion + ", hintAnswer="
				+ hintAnswer + ", password=" + password + "]";
	}

}
