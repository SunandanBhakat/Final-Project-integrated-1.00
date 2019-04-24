package com.waytopolicy.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;

import com.waytopolicy.model.PolicyDetails;
import com.waytopolicy.model.User;
import com.waytopolicy.model.Vendor;
import com.waytopolicy.service.UserService;
import com.waytopolicy.service.VendorService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	@Autowired
	private VendorService vendorService;

	// server starts here
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String vendorPanelView(ModelMap model) {

		return "index";
	}

	// Vendor Login method call from index page
	@RequestMapping(value = "/vendorLogin", method = RequestMethod.GET)
	public String vendorLoginCall(ModelMap model) {
		model.addAttribute("vendorCheck", new Vendor());

		return "vendorLogin";
	}

	// User Login method call from index page
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public String userLoginCall(ModelMap model) {
		model.addAttribute("userCheck", new User());
		/*
		 * int loginStatus = 0; request.getSession().setAttribute("loginStatus",
		 * loginStatus);
		 */
		// model.addAttribute("loginStatus",loginStatus);
		return "userLogin";
	}

	// User Registration method call from Login Page
	@RequestMapping(value = "/newUserRegistration", method = RequestMethod.GET)
	public String userRegistrationCall(ModelMap model) {
		model.addAttribute("newUserAdd", new User());
		return "newUserRegistration";
	}

	// Vendor Registration Method call from Login page
	@RequestMapping(value = "/newVendorRegistration", method = RequestMethod.GET)
	public String vendorRegistrationCall(ModelMap model) {

		model.addAttribute("newVendorAdd", new Vendor());
		return "newVendorRegistration";
	}

	// Vendor Login Verification Method
	@RequestMapping(value = "/vendorLoginCheck", method = RequestMethod.POST)
	public String verifyVendorLogin(@ModelAttribute("vendorCheck") Vendor vendor, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		System.err.println("Inside Vendor Login Verification Controller");

		/*
		 * Vendor validity = null;// default value
		 * 
		 * validity = vendorService.verifyLogin(vendor);
		 * System.err.println("Validity= " + validity); if (validity != null) {
		 * 
		 * return "vendorPanel"; }
		 * 
		 * return "failureLogin";
		 */

		Vendor dbUser = vendorService.findById(vendor.getId());

		int loginStatus = 0;
		String url = null;
		String firstname="";
		String lastname="";
		int age=0,v_id=0;
		String email="";
		String cname="";
		if (dbUser != null) {
			if (dbUser.getPassword().equals(vendor.getPassword())) {

				loginStatus = 1; // successfull login
			} else {
				loginStatus = -2; // password mismatch

			}
		} else {

			loginStatus = -1; // username not found

		}

		if (loginStatus == 1) {
			firstname=dbUser.getFirstName();
			lastname=dbUser.getLastName();
			age=dbUser.getAge();
			v_id=dbUser.getId();
			email=dbUser.getCompanyEmail();
			cname=dbUser.getCompanyName();
			url = "vendorPanel";
			System.err.println(dbUser);
			session.setAttribute("vendorData", dbUser); // Session Attribute
			//System.err.println(vendor);
		} else {
			url = "vendorLogin";

		}
		System.err.println("LoginStatus= " + loginStatus);
		model.addAttribute("loginStatus", loginStatus);
		// request.getSession().setAttribute("loginStatus", loginStatus);
		// request.setAttribute("loginStatus",loginStatus);
		model.addAttribute("vendorCheck", new Vendor());
		session.setAttribute("vendor", vendor);
		session.setAttribute("firstname", firstname);
		 session.setAttribute("lastname", lastname);
		 session.setAttribute("age", age);
		 session.setAttribute("v_id", v_id);
		 session.setAttribute("email", email);
		 session.setAttribute("cname", cname);
		return url;

	}

	// User Login Verification Method
	@RequestMapping(value = "/userLoginCheck", method = RequestMethod.POST)
	public String verifyUserLogin(@ModelAttribute("userCheck") User user, Model model, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) {
		System.err.println("Inside User Login Verification Controller");
		User userDetails = null;
		User dbUser = userService.findById(user.getEmailId());

		int loginStatus = 0;
		String url = null;
		if (dbUser != null) {
			if (dbUser.getPassword().equals(user.getPassword())) {

				loginStatus = 1; // successfull login
			} else {
				loginStatus = -2; // password mismatch

			}
		} else {

			loginStatus = -1; // username not found

		}

		if (loginStatus == 1) {

			userDetails = userService.fetchUserDetails(dbUser.getEmailId());
			userDetails.toString();
			url = "userPanel";
			System.err.println(userDetails);
			session.setAttribute("userData", userDetails); // Session Attribute
		} else {
			url = "userLogin";

		}
		System.err.println("LoginStatus= " + loginStatus);
		model.addAttribute("loginStatus", loginStatus);
		model.addAttribute("userCheck", new User());
		// request.getSession().setAttribute("loginStatus", loginStatus);

		return url;

		/*
		 * validity = userService.verifyLogin(user);
		 * System.err.println("Validity= " + validity); if (validity != null) {
		 * 
		 * return "userPanel"; }
		 * 
		 * 
		 * return "failureLogin";
		 */

	}
	
	@RequestMapping(value = "/forgotPassword", method = RequestMethod.GET)
	public String userForgotPasswordCall(ModelMap model) {
		model.addAttribute("forgotPassword", new User());
		model.addAttribute("initial",0);
		return "forgotPassword";
	}

}
