package com.waytopolicy.dao;

import java.util.List;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.UserPolicy;
import com.waytopolicy.model.Vendor;

public interface UserDao {

	
	public User findById(String emailId);

	public void saveNewUser(User user);

	public List<String> getPolicyByCategory();

	public List<PolicyDetails> checkPolicyCategory(String policyType, Integer durationOfPolicy);

	public PolicyDetails checkPolicyById(Integer id);

	public boolean paymentPolicy(UserPolicy transact);

	public User fetchUserDetails(String emailId);

	public List<UserPolicy> listMyPolicies(String emailId);

	public boolean verifyHintAnswer(String emailId, String hintAnswer);

	public boolean saveNewUserPassword(String emailId, String newPassword);

	

	

}
