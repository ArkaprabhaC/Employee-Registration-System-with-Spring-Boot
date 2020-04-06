package com.arkaprabha.employee.portal.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.arkaprabha.employee.portal.model.Employee;

@Component
public class EmployeeServiceUtil {
	private static List<Employee> list = new ArrayList<>();
	
	public void addEmployee(Employee emp) {
		list.add(emp);
		System.out.println(emp.getEmployee_photo());
	}

	public List<Employee> getList() {
		return list;
	}

	public void setList(List<Employee> list) {
		EmployeeServiceUtil.list = list;
	}
	
	
}
