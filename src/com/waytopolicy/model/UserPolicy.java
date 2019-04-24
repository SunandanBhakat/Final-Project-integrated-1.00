package com.waytopolicy.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name = "tbl_user_policy")
@Proxy(lazy = false)
public class UserPolicy {

	@Id
	@Column(name = "policy_ref_number")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "reference_seq")
	@SequenceGenerator(name = "reference_seq", sequenceName = "reference_seq", allocationSize = 10)
	private Integer policyReferenceNo;

	@Column(name = "policy_name")
	private String policyName;
	@Column(name = "policy_id")
	private Integer policyId;
	@Column(name = "payment_amount")
	private Double paymentAmount;
	@Column(name = "company_name")
	private String companyName;
	@Column(name = "policy_duration")
	private Integer duration;

	@Column(name = "user_email_id")
	private String userEmail;
	
	@Column(name = "user_name")
	private String userName;

	@Column(name = "start_date")
	private String policyStartDate;
	@Column(name = "end_date")
	private String policyEndDate;
	@Column(name = "payment_method")
	private String paymentMethod;
	@Column(name = "payment_status")
	private String paymentStatus;

	public UserPolicy(Integer policyReferenceNo, String policyName, Integer policyId, Double paymentAmount,
			String companyName, Integer duration, String userEmail, String userName, String policyStartDate,
			String policyEndDate, String paymentMethod, String paymentStatus) {
		super();
		this.policyReferenceNo = policyReferenceNo;
		this.policyName = policyName;
		this.policyId = policyId;
		this.paymentAmount = paymentAmount;
		this.companyName = companyName;
		this.duration = duration;
		this.userEmail = userEmail;
		this.userName = userName;
		this.policyStartDate = policyStartDate;
		this.policyEndDate = policyEndDate;
		this.paymentMethod = paymentMethod;
		this.paymentStatus = paymentStatus;
	}

	public UserPolicy() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getPolicyReferenceNo() {
		return policyReferenceNo;
	}

	public void setPolicyReferenceNo(Integer policyReferenceNo) {
		this.policyReferenceNo = policyReferenceNo;
	}

	public String getPolicyName() {
		return policyName;
	}

	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}

	public Integer getPolicyId() {
		return policyId;
	}

	public void setPolicyId(Integer policyId) {
		this.policyId = policyId;
	}

	public Double getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(Double paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPolicyStartDate() {
		return policyStartDate;
	}

	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}

	public String getPolicyEndDate() {
		return policyEndDate;
	}

	public void setPolicyEndDate(String policyEndDate) {
		this.policyEndDate = policyEndDate;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

}
