package com.arkaprabha.employee.portal.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class Employee {
	private String employee_photo;
	private String firstname;
	private String lastname;
	private int employeeId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date DOB;
	private List<String> sel_technologies = new ArrayList<String>();
	
	
	public Employee() {
		super();
	}
	public Employee(String employee_photo, String firstname, String lastname, int employeeId, Date dOB,
			List<String> sel_technologies) {
		super();
		this.employee_photo = employee_photo;
		this.firstname = firstname;
		this.lastname = lastname;
		this.employeeId = employeeId;
		this.DOB = dOB;
		this.sel_technologies = sel_technologies;
	}
	public String getEmployee_photo() {
		return employee_photo;
	}
	public void setEmployee_photo(String employee_photo) {
		this.employee_photo = employee_photo;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}
	public Date getDOB() {
		return DOB;
	}
	public void setDOB(Date dOB) {
		DOB = dOB;
	}
	public List<String> getSel_technologies() {
		return sel_technologies;
	}
	public void setSel_technologies(List<String> sel_technologies) {
		this.sel_technologies = sel_technologies;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((DOB == null) ? 0 : DOB.hashCode());
		result = prime * result + employeeId;
		result = prime * result + ((employee_photo == null) ? 0 : employee_photo.hashCode());
		result = prime * result + ((firstname == null) ? 0 : firstname.hashCode());
		result = prime * result + ((lastname == null) ? 0 : lastname.hashCode());
		result = prime * result + ((sel_technologies == null) ? 0 : sel_technologies.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Employee other = (Employee) obj;
		if (DOB == null) {
			if (other.DOB != null)
				return false;
		} else if (!DOB.equals(other.DOB))
			return false;
		if (employeeId != other.employeeId)
			return false;
		if (employee_photo == null) {
			if (other.employee_photo != null)
				return false;
		} else if (!employee_photo.equals(other.employee_photo))
			return false;
		if (firstname == null) {
			if (other.firstname != null)
				return false;
		} else if (!firstname.equals(other.firstname))
			return false;
		if (lastname == null) {
			if (other.lastname != null)
				return false;
		} else if (!lastname.equals(other.lastname))
			return false;
		if (sel_technologies == null) {
			if (other.sel_technologies != null)
				return false;
		} else if (!sel_technologies.equals(other.sel_technologies))
			return false;
		return true;
	}
	
	
	
	
}
