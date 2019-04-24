package com.waytopolicy.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.waytopolicy.dao.UserDao;
import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.UserPolicy;
import com.waytopolicy.model.Vendor;

public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;

	@Override
	@Transactional
	public User findById(String emailId) {

		return userDao.findById(emailId);
	}

	@Override
	@Transactional
	public void saveNewUser(User user) {
		userDao.saveNewUser(user);

	}

	@Override
	@Transactional
	public List<String> getPolicyByCategory() {

		return userDao.getPolicyByCategory();
	}

	@Override
	@Transactional
	public List<PolicyDetails> checkPolicyCategory(String policyType, Integer durationOfPolicy) {

		return userDao.checkPolicyCategory(policyType, durationOfPolicy);
	}

	@Override
	@Transactional
	public PolicyDetails checkPolicyById(Integer id) {

		return userDao.checkPolicyById(id);
	}

	@Override
	@Transactional
	public boolean paymentPolicy(PolicyDetails polInfo, User userInfo, String paymentMethod) {

		String payStatus = "Paid";
		UserPolicy transact = new UserPolicy();// transaction object
		
		userInfo.toString();
		
		transact.setPolicyName(polInfo.getPolicyName());
		System.err.println("Policy Name: "+transact.getPolicyName());
		transact.setPolicyId(polInfo.getId());
		System.err.println("Policy Id: "+transact.getPolicyId());
		transact.setPaymentAmount(polInfo.getInitialDeposit());
		System.err.println("Initial Deposit: "+transact.getPaymentAmount());
		transact.setCompanyName(polInfo.getCompanyName());
		System.err.println("Company Name: "+transact.getCompanyName());
		transact.setDuration(polInfo.getDurationOfPolicy());
		System.err.println("Duration: "+transact.getDuration());
		transact.setUserEmail(userInfo.getEmailId());
		System.err.println("Email: "+transact.getUserEmail());
		String firstName = userInfo.getFirstName();
		System.err.println("First Name: "+firstName);
		String lastName = userInfo.getLastName();
		System.err.println("Last Name: "+lastName);
		String name = firstName.concat(" ").concat(lastName);
		transact.setUserName(name);
		System.err.println("Name: "+name);

		transact.setPolicyStartDate(generatePolicyStartDate());
		System.err.println("Start Date: "+transact.getPolicyStartDate());
		transact.setPolicyEndDate(generatePolicyEndDate(polInfo.getDurationOfPolicy()));
		System.err.println("End Date: "+transact.getPolicyEndDate());
		transact.setPaymentMethod(paymentMethod);
		System.err.println("Payment Method: "+transact.getPaymentMethod());
		transact.setPaymentStatus(payStatus);
		System.err.println("Payment Status: "+transact.getPaymentStatus());
		/*
		 * try { userDao.paymentPolicy(transact); return true; } catch(Exception
		 * e) { return false; }
		 */

		if (userDao.paymentPolicy(transact)) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public String generatePolicyStartDate() {
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Date date = new Date();
		System.out.println(dateFormat.format(date)); // 2016/11/16 12:08:43
		String startDate = dateFormat.format(date);
		return startDate;
	}

	@Override
	public String generatePolicyEndDate(Integer duration) {

		/* duration=duration*12; */
		DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		Date today = cal.getTime();
		cal.add(Calendar.YEAR, duration); // to get previous year add -1
		// cal.add(Calendar.MONTH,10);
		Date nextYear = cal.getTime();
		String endDate = dateFormat.format(nextYear);
		System.out.println(endDate);

		return endDate;
	}

	@Override
	@Transactional
	public User fetchUserDetails(String emailId) {
		
		return userDao.fetchUserDetails(emailId);
	}

	@Override
	@Transactional
	public List<UserPolicy> listMyPolicies(String emailId) {
		
		return userDao.listMyPolicies(emailId);
	}

	@Override
	@Transactional
	public boolean verifyHintAnswer(String emailId, String hintAnswer) {
		
		return userDao.verifyHintAnswer(emailId,hintAnswer);
	}

	@Override
	@Transactional
	public boolean saveNewUserPassword(String emailId, String newPassword) {
		return userDao.saveNewUserPassword(emailId,newPassword);
		
	}

}
