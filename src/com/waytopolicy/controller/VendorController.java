package com.waytopolicy.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.Vendor;
import com.waytopolicy.service.VendorService;

@Controller
public class VendorController {

	@Autowired
	private VendorService vendorService;

	// server starts from this method
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String
	 * vendorPanelView(ModelMap model) {
	 * 
	 * return "vendorPanel"; }
	 */

	// New User Registration save process method
	@RequestMapping(value = "/vendor/register/", method = RequestMethod.POST)
	public String saveNewVendorDetails(@ModelAttribute("newVendorAdd") Vendor vendor, Model model,
			HttpServletRequest request, HttpServletResponse response) {

		System.err.println("Inside Register New Vendor Controller");

		try {

			vendorService.saveNewVendor(vendor);
			System.err.println("VENDOR ID: " + vendor.getId());
			model.addAttribute("commit", true);
			model.addAttribute("id", vendor.getId());

			/*
			 * model.addAttribute("commit",true);
			 * model.addAttribute("id",vendor.getId());
			 */

		} catch (Exception e) {
			System.err.println(e);
			/*
			 * model.addAttribute("commit",false);
			 * model.addAttribute("message",e.getMessage())
			 */;
			model.addAttribute("commit", false);
			model.addAttribute("message", e.getMessage());

		}

		model.addAttribute("newVendorAdd", new Vendor());
		return "newVendorRegistration";

	}

	// Add Policy Button Method
	@RequestMapping(value = "/vendorAddPolicy")
	public String addPolicyPage(ModelMap model) {
		System.err.println("Inside addPolicyPage Controller");

		PolicyDetails policyDetails = new PolicyDetails();
		model.addAttribute("addPolicy", policyDetails);

		return "addNewPolicy";
	}

	// Add Policy From List Policy Page
	@RequestMapping(value = "/vendor/vendorAddPolicy")
	public String addPolicyPageRecall(ModelMap model) {
		System.err.println("Inside addPolicyPage Controller");

		PolicyDetails policyDetails = new PolicyDetails();
		model.addAttribute("addPolicy", policyDetails);

		return "addNewPolicy";
	}

	// Edit Policy Button Method
	@RequestMapping(value = "/vendorEditPolicy")
	public String editPolicyPage(ModelMap model) {
		System.err.println("Inside editPolicyPage Controller");

		return "redirect:/vendor/list";
	}

	// Policy save process method
	@RequestMapping(value = "/vendor/save/", method = RequestMethod.POST)
	public String savePolicyDetails(@ModelAttribute("addPolicy") PolicyDetails policyDetails, Model model) {
		System.err.println("Inside savePolicyDetails Controller");
		try {
			vendorService.savePolicy(policyDetails); // save policy details
			model.addAttribute("commit", true);

		}

		catch (Exception e) {
			model.addAttribute("commit", false);
			model.addAttribute("message", e.getMessage());
		}

		return "addNewPolicy";
	}

	// List policy Page method
	@RequestMapping(value = "/vendor/list", method = RequestMethod.GET)
	public String viewListPolicy(ModelMap model) {
		System.err.println("Inside List Policies");

		List<PolicyDetails> listOfPolicies = vendorService.listPolicies();// In
																			// order
																			// to
																			// display
																			// list
																			// after
																			// clicking
																			// the
																			// save
																			// button

		System.err.println("count=" + listOfPolicies.size());
		if (!listOfPolicies.isEmpty()) {
			model.addAttribute("count", listOfPolicies.size()); // map in list
																// policies page
			model.addAttribute("policies", listOfPolicies);
		}

		else {
			model.addAttribute("count", 0);
		}

		return "vendorViewPolicy";
	}

	// Policy Edit Method Button
	@RequestMapping(value = "/vendor/edit/{id}", method = RequestMethod.GET)
	public String editPolicy(@PathVariable("id") int id, Model map) {
		System.err.println("Inside Policy Edit Method ");

		PolicyDetails policyDetails = vendorService.findPolicyById(id);

		map.addAttribute("updatePolicy", policyDetails);
		return "editPolicy";
	}

	// Policy Update and Edit Method Button
	@RequestMapping(value = "/vendor/update", method = RequestMethod.POST)
	public String updatePolicy(@ModelAttribute(value = "updatePolicy") PolicyDetails newPolicyDetails) {
		System.err.println("inside update author post");
		vendorService.updatePolicy(newPolicyDetails);
		return "redirect:/vendor/list";
	}

	// Policy Remove Method Button
	@RequestMapping(value = "/vendor/remove/{id}", method = RequestMethod.GET)
	public String removeAuthor(@PathVariable("id") int id) {

		vendorService.removePolicy(id);
		return "redirect:/vendor/list";
	}

	//Vendor Panel Home
	
	@RequestMapping(value = "/vendorPanel", method = RequestMethod.GET)
	public String vendorHomeAction(Model model) {

		
		return "vendorPanel";
	}
	
}
