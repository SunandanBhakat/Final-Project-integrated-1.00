package com.waytopolicy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity(name="Vendor")
@Table(name="tbl_vendor")
@Proxy(lazy=false)
public class Vendor {
	@Override
	public String toString() {
		return "Vendor [id=" + id + ", firstName=" + firstName + ", LastName=" + LastName + ", age=" + age
				+ ", password=" + password + ", contact=" + contact + ", tan=" + tan + ", companyEmail=" + companyEmail
				+ ", companyName=" + companyName + ", gender=" + gender + "]";
	}
	@Id
	@Column(name="vendor_id")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "vendor_seq")
	@SequenceGenerator(name="vendor_seq",sequenceName="vendor_seq",allocationSize=10)
	Integer id;
	@Column(name="first_name")
	String firstName;
	@Column(name="last_name")
	String LastName;
	@Column(name="age")
	Integer age;
	@Column(name="password")
	String password;
	@Column(name="contact_number")
	String contact;
	@Column(name="tan_no")
	String tan;
	@Column(name="company_email")
	String companyEmail;
	@Column(name="company_name")
	String companyName;
	@Column(name="gender")
	String gender;
	


	public Vendor() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Vendor(Integer id, String firstName, String lastName, Integer age, String password, String contact,
			String tan, String companyEmail, String companyName, String gender) {
		super();
		this.id = id;
		this.firstName = firstName;
		LastName = lastName;
		this.age = age;
		this.password = password;
		this.contact = contact;
		this.tan = tan;
		this.companyEmail = companyEmail;
		this.companyName = companyName;
		this.gender = gender;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getTan() {
		return tan;
	}

	public void setTan(String tan) {
		this.tan = tan;
	}

	public String getCompanyEmail() {
		return companyEmail;
	}
	public void setCompanyEmail(String companyEmail) {
		this.companyEmail = companyEmail;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

}
