package com.waytopolicy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waytopolicy.dao.VendorDao;
import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.Vendor;

@Service
public class VendorServiceImpl implements VendorService {

	@Autowired
	public VendorDao vendorDao;
	
	@Override
	@Transactional
	public void savePolicy(PolicyDetails policyDetails) {
		vendorDao.savePolicy(policyDetails);
		
	}

	@Override
	@Transactional
	public List<PolicyDetails> listPolicies() {
		
		return vendorDao.listPolicies();
	}

	@Override
	@Transactional
	public PolicyDetails findPolicyById(int id) {
		
		return vendorDao.findPolicyById(id);
	}

	@Override
	@Transactional
	public void updatePolicy(PolicyDetails newPolicyDetails) {
		
		vendorDao.updatePolicy(newPolicyDetails);
	}

	@Override
	@Transactional
	public void removePolicy(int id) {
		vendorDao.removePolicy(id);
		
	}

	@Override
	@Transactional
	public Vendor findById(Integer id) {
		
		 return vendorDao.findById(id);
	}

	@Override
	@Transactional
	public void saveNewVendor(Vendor vendor) {
		
		 vendorDao.saveNewVendor(vendor);
	}

	

	
	
	
}
