package com.waytopolicy.dao;

import java.util.List;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.Vendor;

public interface VendorDao {

	public void savePolicy(PolicyDetails policyDetails);

	List<PolicyDetails> listPolicies();

	public PolicyDetails findPolicyById(int id);

	public void updatePolicy(PolicyDetails newPolicyDetails);

	public void removePolicy(int id);

	public Vendor verifyLogin(Vendor vendor);
	public Vendor findById(Integer id);

	public void saveNewVendor(Vendor vendor);

	

}
