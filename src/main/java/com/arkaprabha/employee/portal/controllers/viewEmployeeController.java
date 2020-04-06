package com.arkaprabha.employee.portal.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.arkaprabha.employee.portal.service.EmployeeServiceUtil;

@Controller
public class viewEmployeeController {

	@Autowired
	EmployeeServiceUtil service;
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String showEmployeesPage(Model model) {
		model.addAttribute("employees", service.getList());
		return "view-employees";
	}
}
