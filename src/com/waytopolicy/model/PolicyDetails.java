package com.waytopolicy.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Proxy;

@Entity
@Table(name="tbl_policy_info")
@Proxy(lazy=false)
public class PolicyDetails {
	@Id
	@Column(name = "policy_id")
	
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator = "policy_seq")
	@SequenceGenerator(name="policy_seq",sequenceName="policy_seq",allocationSize=10)
	private Integer id;
	
	

	@Column(name = "policy_name")
	private String policyName;
	
	@Column(name = "policy_type")
	private String policyType;
	
	@Column(name = "duration_of_years")
	private Integer durationOfPolicy;
	
	@Column(name = "company_name")
	private String companyName;
	
	@Column(name = "initial_deposit")
	private Double initialDeposit;
	
	@Column(name="term_amount")
	private Double termAmount;
	
	@Column(name = "interest")
	private Integer interest;
	
	
	public PolicyDetails(Integer id, String policyName, String policyType, Integer durationOfPolicy, String companyName,
			Double initialDeposit, Double termAmount, Integer interest) {
		super();
		this.id = id;
		this.policyName = policyName;
		this.policyType = policyType;
		this.durationOfPolicy = durationOfPolicy;
		this.companyName = companyName;
		this.initialDeposit = initialDeposit;
		this.termAmount = termAmount;
		this.interest = interest;
	}


	public PolicyDetails() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getPolicyName() {
		return policyName;
	}


	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}


	public String getPolicyType() {
		return policyType;
	}


	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}


	public Integer getDurationOfPolicy() {
		return durationOfPolicy;
	}


	public void setDurationOfPolicy(Integer durationOfPolicy) {
		this.durationOfPolicy = durationOfPolicy;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}


	public Double getInitialDeposit() {
		return initialDeposit;
	}


	public void setInitialDeposit(Double initialDeposit) {
		this.initialDeposit = initialDeposit;
	}


	public Double getTermAmount() {
		return termAmount;
	}


	public void setTermAmount(Double termAmount) {
		this.termAmount = termAmount;
	}


	public Integer getInterest() {
		return interest;
	}


	public void setInterest(Integer interest) {
		this.interest = interest;
	}
	
	
	
	@Override
	public String toString() {
		return "PolicyDetails [id=" + id + ", policyName=" + policyName + ", policyType=" + policyType
				+ ", durationOfPolicy=" + durationOfPolicy + ", companyName=" + companyName + ", initialDeposit="
				+ initialDeposit + ", termAmount=" + termAmount + ", interest=" + interest + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
