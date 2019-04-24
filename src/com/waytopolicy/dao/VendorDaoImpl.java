package com.waytopolicy.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.Vendor;

@Repository
public class VendorDaoImpl implements VendorDao {

	@Autowired
	private SessionFactory sessionFactory;
	//private HibernateTemplate hibernateTemplate;

	@Override
	public void savePolicy(PolicyDetails policyDetails) {

		sessionFactory.getCurrentSession().save(policyDetails);
		System.err.println("Saving Data Successfull!");

	}

	@Override
	public List<PolicyDetails> listPolicies() {
		Session session = sessionFactory.getCurrentSession();
		List<PolicyDetails> policyDetails = session.createQuery("from PolicyDetails").list();
		System.err.println("Listing Data Successfull!");
		return policyDetails;
	}

	@Override
	public PolicyDetails findPolicyById(int id) {
		PolicyDetails policyInfo = (PolicyDetails) this.sessionFactory.getCurrentSession().load(PolicyDetails.class,
				new Integer(id));
		return policyInfo;
	}

	@Override
	public void updatePolicy(PolicyDetails newPolicyDetails) {
		// TODO Auto-generated method stub
		this.sessionFactory.getCurrentSession().update(newPolicyDetails);
		System.err.println("Policy Details Updated Successfully");

	}

	@Override
	public void removePolicy(int id) {
		// TODO Auto-generated method stub
		System.err.println("Inside Policy Remove Dao");
		PolicyDetails policyInfo = (PolicyDetails) sessionFactory.getCurrentSession().load(PolicyDetails.class,
				new Integer(id));
		this.sessionFactory.getCurrentSession().delete(policyInfo);
		System.err.println("Deleteion of Policy Successfull");

	}

	@Override
	public Vendor verifyLogin(Vendor vendor) {
		System.err.println("Inside Vendor Login Verify Dao");
		/*Session session=sessionFactory.getCurrentSession();
		int validityChecker=0;
		
		List<Vendor[]> vendorUserName=session.createQuery("select v.id from Vendor v").list();
		for(Vendor[] row:vendorUserName )
		{
			if(!(row[0].equals(vendor.getId())))
			{
				validityChecker=1;
				return validityChecker; //denotes login failed due to non existence of id;
			}
			
			
		}
		
		List<Vendor[]> vendorUserPassword=session.createQuery("select v.id,v.password from Vendor v").list();
		for(Vendor[] row:vendorUserPassword )
		{
			if(!(row[0].equals(vendor.getId())) && !(row[1].equals(vendor.getPassword())))
			{
				validityChecker=2;
				return validityChecker; //denotes login failed due to password mismatch;
			}
			
			
		}
		validityChecker=0;
		return validityChecker; //by default it will return 0 and allow login 	
		
*/	
		Session session=this.sessionFactory.openSession();
		System.err.println(vendor.getId());
		System.err.println(vendor.getPassword());
		
		Vendor v;
		Vendor verify;
		try
		{
			//verify= (Vendor) query.uniqueResult();
			/*v=(Vendor)session.load(Vendor.class, new Integer(vendor.getId()));*/
			v=(Vendor)session.load(Vendor.class, vendor.getId());
			
			return v;
			
		}
		catch(Exception e)
		{
			
			return null;
		}
	}

	

	@Override
	public Vendor findById(Integer id) {
		try
		{
			return (Vendor) sessionFactory.getCurrentSession().load(Vendor.class, id);
		}
		catch(Exception e)
		{
			System.out.println(e);
			return null;
		}
		
	}

	@Override
	public void saveNewVendor(Vendor vendor) {
		sessionFactory.getCurrentSession().save(vendor);
		System.err.println("Saving New Vendor Data Successfull!");
		
		
	}

}
