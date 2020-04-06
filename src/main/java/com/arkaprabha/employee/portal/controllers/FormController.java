package com.arkaprabha.employee.portal.controllers;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.arkaprabha.employee.portal.model.Employee;
import com.arkaprabha.employee.portal.service.EmployeeServiceUtil;

@Controller
public class FormController {
	
	@Autowired
	EmployeeServiceUtil service;

	private String UPLOADED_FOLDER = System.getProperty("user.dir") + "//src//main//resources//public//";

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showForm(ModelMap model) {
		model.addAttribute("employee", new Employee("", "", "", 123456, new Date(), new ArrayList<>()));
		return "index";
	}

	@RequestMapping(value = "/", method = RequestMethod.POST)
	public String processFormInput(Employee employee, @RequestParam("file") MultipartFile file, Model model) {
//		System.out.println(employee.getFirstname());
//		System.out.println(employee.getLastname());
//		System.out.println(employee.getEmployeeId());
//		System.out.println(new SimpleDateFormat("dd-MM-yyyy").format(employee.getDOB()));
//		System.out.println(employee.getSel_technologies());

		// get the uploaded image
		byte bytes[];
		try {
			bytes = file.getBytes();

			File file1 = new File(UPLOADED_FOLDER + File.separator + file.getOriginalFilename());
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file1));
			stream.write(bytes);
			employee.setEmployee_photo(file.getOriginalFilename());
			System.out.println("File Uploaded Successfully!");
			stream.close();

		} catch (IOException e) {
			System.out.println("Error!");
			e.printStackTrace();
		}
		
		service.addEmployee(employee);
		model.addAttribute("message", "Employee details recorded successfully!");
		return "index";
		
	}
}
