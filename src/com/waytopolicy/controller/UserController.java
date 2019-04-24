package com.waytopolicy.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.waytopolicy.model.UserPolicy;
import com.waytopolicy.service.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;

	// New User Registration save process method
	@RequestMapping(value = "/user/register/", method = RequestMethod.POST)
	public String saveNewUserDetails(@ModelAttribute("newUserAdd") User user, @RequestParam("emailId") String emailId,
			Model model, HttpServletRequest request, HttpServletResponse response) {
		System.err.println("Inside Register New User Controller");

		if (userService.findById(emailId) == null) {

			model.addAttribute("commit", true);

			try {
				userService.saveNewUser(user);
				model.addAttribute("userCheck", new User()); // addition
				return "redirect:/userLogin";
			} catch (Exception e) {
				System.err.println(e);
				model.addAttribute("message", e.getMessage());

			}

		}

		else {
			// request.getSession().setAttribute("commit",false);
			model.addAttribute("commit", false);

			return "newUserRegistration";
		}

		model.addAttribute("newUserAdd", new User());
		return "index";
	}

	// Search Policy Button Method

	@RequestMapping(value = "/user/search")
	public String searchPolicy(ModelMap model) {
		System.err.println("Inside Search Policy Button");

		List<String> policyCategory = userService.getPolicyByCategory();
		System.err.println("Inside Call");
		model.addAttribute("pCatagory", policyCategory);
		model.addAttribute("policy", new PolicyDetails());
		// model.addAttribute("searchCategory", policyCategory);
		model.addAttribute("searchResult", true);
		/*Set<String> set = new HashSet<>();
		for(PolicyDetails pd : policyCategory){
			set.add(pd.getPolicyType());
		}
		List<String> list = new ArrayList<String>(set);
		model.addAttribute("polList",list );*/
		return "searchPolicy";
	}

	// Search Policy By Category Listing Method
	@RequestMapping(value = "/user/searchPolicyByCategory/")
	public String searchPolicybyCategory(@ModelAttribute("policy") PolicyDetails policy,
			@RequestParam("policyType") String policyType, @RequestParam("durationOfPolicy") Integer durationOfPolicy,
			ModelMap model) {
		System.err.println("Inside search By Search Policy By Category");

		List<PolicyDetails> result = userService.checkPolicyCategory(policyType, durationOfPolicy);
		
		if (result.isEmpty()) {
			System.err.println("Im here bro");
			model.addAttribute("searchResult", false);
			return "searchPolicy";
		} else {
			model.addAttribute("searchResult", true);
			model.addAttribute("policyList", result);
			model.addAttribute("count", result.size());
			
			return "searchResultCategory";
		}

	}

	// Search Policy By Id Method
	@RequestMapping(value = "/user/searchPolicyById/")
	public String searchPolicybyId(@ModelAttribute("policy") PolicyDetails policy, @RequestParam("id") Integer id,
			ModelMap model) {
		System.err.println("Inside search By Search Policy By Id ");

		PolicyDetails pol = userService.checkPolicyById(id);
		System.err.println(pol);
		if (pol == null) {
			System.err.println("Inside Not Found By Id");
			model.addAttribute("searchResultId", false);
			return "searchPolicy";
		}

		else {
			model.addAttribute("searchResultId", true);
			model.addAttribute("searchPolicyResult", pol);
			return "searchResultById";

		}

		// return "failureLogin";

	}

	// Mapping for buyPolicy Using Id number
	@RequestMapping(value = "/user/buyPolicyId")
	public String buyPolicyById(@ModelAttribute("searchPolicyResult") PolicyDetails policyInfo,
			@RequestParam("id") Integer id, ModelMap model, HttpSession session) {
		System.err.println("Inside Buy User Policy Id");

		PolicyDetails polInfo = userService.checkPolicyById(id);
		policyInfo.toString();
		session.setAttribute("policyInfo", polInfo);

		return "paymentGateway";

	}

	// Mapping for buyPolicy using Category
	@RequestMapping(value = "/user/buyPolicyCategory/{id}", method = RequestMethod.GET)
	public String buyPolicyByCategory(@PathVariable("id") Integer id, HttpSession session) {
		System.err.println("Inside Buy User Policy Category");

		PolicyDetails polInfo = userService.checkPolicyById(id);
		polInfo.toString();
		session.setAttribute("policyInfo", polInfo);

		return "paymentGateway";
	}

	// Mapping for payment using credit card
	@RequestMapping(value = "/user/buyPolicy/creditCard", method = RequestMethod.POST)
	public String buyPolicyIdCreditCard(HttpSession session, Model model) {
		System.err.println("Im inside payment credit card");
		PolicyDetails polInfo = (PolicyDetails) session.getAttribute("policyInfo");
		System.err.println("PolicyInfo " + polInfo);
		User userInfo = (User) session.getAttribute("userData");

		System.out.println("---------------------------------" + userInfo);
		userInfo.toString();

		System.err.println("UserInfo " + userInfo);
		String paymentMethod = "Credit Card";
		boolean flag = userService.paymentPolicy(polInfo, userInfo, paymentMethod);
		System.err.println("Flag: " + flag);
		System.err.println("flag has returned");
		//model.addAttribute("flag", flag);
		System.err.println("Payment Successfull");

		return "transaction";
	}

	// Mapping for payment using debit card
	@RequestMapping(value = "/user/buyPolicy/debitCard", method = RequestMethod.POST)
	public String buyPolicyIdDebitCard(HttpSession session, Model model) {
		System.err.println("Im inside payment credit card");
		PolicyDetails polInfo = (PolicyDetails) session.getAttribute("policyInfo");
		System.err.println("PolicyInfo " + polInfo);
		User userInfo = (User) session.getAttribute("userData");

		System.out.println("---------------------------------" + userInfo);
		userInfo.toString();

		System.err.println("UserInfo " + userInfo);
		String paymentMethod = "Debit Card";
		boolean flag = userService.paymentPolicy(polInfo, userInfo, paymentMethod);
		System.err.println("Flag: " + flag);
		System.err.println("flag has returned");
		model.addAttribute("flag", flag);
		System.err.println("Payment Successfull");

		return "transaction";
	}

	// Mapping for payment using upi
	@RequestMapping(value = "/user/buyPolicy/upi", method = RequestMethod.POST)
	public String buyPolicyIdUpi(HttpSession session, Model model) {
		System.err.println("Im inside payment credit card");
		PolicyDetails polInfo = (PolicyDetails) session.getAttribute("policyInfo");
		System.err.println("PolicyInfo " + polInfo);
		User userInfo = (User) session.getAttribute("userData");

		System.out.println("---------------------------------" + userInfo);
		userInfo.toString();

		System.err.println("UserInfo " + userInfo);
		String paymentMethod = "UPI";
		boolean flag = userService.paymentPolicy(polInfo, userInfo, paymentMethod);
		System.err.println("Flag: " + flag);
		System.err.println("flag has returned");
		model.addAttribute("flag", flag);
		System.err.println("Payment Successfull");

		return "transaction";
	}

	// Mapping for listing User Policies
	@RequestMapping(value = "/user/myPolicy")
	public String viewMyPolicy(ModelMap model, HttpSession session) {
		System.err.println("Inside List My Policies attribute:");
		User userDetails = (User) session.getAttribute("userData");
		System.err.println(userDetails.getEmailId());
		List<UserPolicy> myPolicies = userService.listMyPolicies(userDetails.getEmailId());

		System.err.println("policyCount=" + myPolicies.size());
		if (!myPolicies.isEmpty()) {
			model.addAttribute("policyCount", myPolicies.size()); // map in list
																	// policies
																	// page
			model.addAttribute("myPolicies", myPolicies);
		}

		else {
			model.addAttribute("policyCount", 0);
		}

		return "userPolicyView";
	}

	// Mapping for Canceling Transaction
	@RequestMapping(value = "/user/cancelTransaction")
	public String cancelTransaction(HttpSession session) {
		//session.invalidate();
		String url = "searchPolicy";
		System.err.println("Transaction Cancelled");
		// model.addAttribute("searchResultId",true);
		return "redirect:/user/search";
	}

	// HomeAction
	@RequestMapping(value = "/userPanel", method = RequestMethod.GET)
	public String vendorHomeAction(Model model) {

		return "userPanel";
	}
	
	
	//Forgot Password verify Email 
			@RequestMapping(value = "/user/checkEmail/", method = RequestMethod.POST)
			public String forgotPassword(@ModelAttribute("forgotPassword") User user, @RequestParam("emailId") String emailId,
					Model model, HttpServletRequest request, HttpServletResponse response) {
				System.err.println("Inside Forgot Password Controller");

			
				
				if(userService.findById(emailId)==null)
				{
					model.addAttribute("noEmail",true);
					return "forgotPassword";
				}
				
				else
				{
					
					
					User userInfo=userService.fetchUserDetails(emailId);
					System.err.println(userInfo);
					model.addAttribute("userHint",userInfo);
					
					return "hintQuestion";
					
					
				}
				
				
				
			}
		
			//Verify Hint Answer 
			@RequestMapping(value = "/user/verifyHintQuestion/", method = RequestMethod.POST)
			public String verifyHintAnswer(@ModelAttribute("forgotPassword") User user,@RequestParam("hintAnswer") String hintAnswer,Model model, HttpSession session) {
				System.err.println("Inside Verify Hint Question Controller");
				String emailId=user.getEmailId();
				if(userService.verifyHintAnswer(emailId,hintAnswer))
				{
					model.addAttribute("hintAnswer",true);
					model.addAttribute("saveNewPassword",new User());
					model.addAttribute("newPass",user);
					//model.addAttribute("")
					User userInfo=userService.fetchUserDetails(emailId);
					System.err.println(userInfo);
					model.addAttribute("userHint",userInfo);
					
					return "newPassword";
				}
				else
				{
					model.addAttribute("hintAnswer",false);
					/*model.addAttribute("forgotPassword",user);*/
					//model.addAttribute("fogot",user);
					return "hintQuestion";
				}
			
			}
	
			//Forgot Password Final Save Process
			@RequestMapping(value = "/user/newPassword/", method = RequestMethod.POST)	
			public String postNewPassword(@ModelAttribute("forgotPassword") User user,Model model, HttpSession session) {
				System.err.println("Inside New Password Final Save Process Controller");
				String emailId=user.getEmailId();
				String newPassword=user.getPassword();
				if(userService.saveNewUserPassword(emailId,newPassword))
				{
					model.addAttribute("saveProcess",true);
					//model.addAttribute("forgotPassword",new User());
					return "newPassword";
				}
				//model.addAttribute("forgotPassword",new User());		
				else
				{
					model.addAttribute("saveProcess",false);
					return "newPassword";
				}
				
				
			
		}
	
}
