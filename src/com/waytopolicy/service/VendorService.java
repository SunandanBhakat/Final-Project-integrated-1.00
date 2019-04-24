package com.waytopolicy.service;

import java.util.List;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.Vendor;

public interface VendorService {

	public void savePolicy(PolicyDetails policyDetails);

	public List<PolicyDetails> listPolicies();

	public PolicyDetails findPolicyById(int id);

	public void updatePolicy(PolicyDetails newPolicyDetails);

	

	public void removePolicy(int id);

	

	public Vendor findById(Integer id);

	public void saveNewVendor(Vendor vendor);

}
