package com.waytopolicy.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.UserPolicy;

public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	

	@Override
	public User findById(String emailId) {
		
		try {
			return (User) sessionFactory.getCurrentSession().load(User.class, emailId);
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}

	}

	@Override
	public void saveNewUser(User user) {
		sessionFactory.getCurrentSession().save(user);
		System.err.println("Saving New User Data Successfull!");

	}

	@Override
	public List<String> getPolicyByCategory() {
		Session session = sessionFactory.getCurrentSession();
		List<String> policyDetails = session.createQuery("select DISTINCT(trim(e.policyType)) from PolicyDetails e").list();
		for (int i=0;i<policyDetails.size();i++) {
			System.err.println(policyDetails.get(i));
			
		}
		
		return policyDetails;
	}

	@Override
	public List<PolicyDetails> checkPolicyCategory(String policyType, Integer durationOfPolicy) {
		System.err.println("Inside Check policy Category DAO");
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("from PolicyDetails p where p.policyType=:pT and p.durationOfPolicy=:dOP");
		q.setParameter("pT", policyType);
		q.setParameter("dOP", durationOfPolicy);
		List<PolicyDetails> l = q.list();
		System.err.println(l);
		System.err.println("Search policy By category successfull!");
		return l;
	}

	@Override
	public PolicyDetails checkPolicyById(Integer id) {

		PolicyDetails policyInfo = (PolicyDetails) this.sessionFactory.getCurrentSession().get(PolicyDetails.class,
				new Integer(id));
		System.err.println(policyInfo);

		return policyInfo;
	}

	@Override
	public boolean paymentPolicy(UserPolicy transact) {

		try {
			sessionFactory.getCurrentSession().save(transact);
			System.err.println("Hey! Your Payment is Successfull!!");
			return true;
		} catch (Exception e) {
			System.err.println(e);
			return false;
		}

	}

	@Override
	public User fetchUserDetails(String emailId) {
		User userDetails=(User) this.sessionFactory.getCurrentSession().get(User.class, new String(emailId));
		System.err.println(userDetails);
		return userDetails;
	}

	@Override
	public List<UserPolicy> listMyPolicies(String emailId) {
		Session session=sessionFactory.getCurrentSession();
		Query q = session.createQuery("from UserPolicy up where up.userEmail=:email");
		q.setParameter("email", emailId);
		List<UserPolicy> myList = q.list();
		System.err.println(myList);
		System.err.println("Listing My Policies Successfull!!");
		return myList;
	}

	@Override
	public boolean verifyHintAnswer(String emailId, String hintAnswer) {
		Session session=sessionFactory.getCurrentSession();
		Query q=session.createQuery("select u.hintAnswer from User u where u.emailId=:emailId");
		q.setParameter("emailId", emailId);
		String hintRealAnswer=q.uniqueResult().toString();
		if(hintRealAnswer.equalsIgnoreCase(hintAnswer))
		{
			return true;
		}
		else
		{
			return false;
		}
	}

	@Override
	public boolean saveNewUserPassword(String emailId, String newPassword) {
		Session session=sessionFactory.getCurrentSession();
		Query query = session.createQuery("update User set password = :newPassword where emailId = :emailId");
		query.setParameter("newPassword", newPassword);
		query.setParameter("emailId", emailId);
		int result=query.executeUpdate();
		if(result==1)
		{
			System.err.println("Password Update Successfull");
			return true;
		}
		else
		{
			System.err.println("Password Update Failed");
			return false;
		}
	}

}
