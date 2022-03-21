package POJO;

import java.util.LinkedList;

import Entities.RoleEntity;

public class Employee {
	String firstName = "";
	String lastName = "";
	int employeeID = 0;
	String email = "";

	String phone = "";
	String jobTitle = "";
	
	
	// leave empty unless except for login
	String userName = "";
	String password = "";
	
	
	LinkedList<RoleEntity> roles = new LinkedList<RoleEntity>();
	
	

	public LinkedList<RoleEntity> getRoles() {
		return roles;
	}
	public void setRoles(LinkedList<RoleEntity> roles) {
		this.roles = roles;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getEmployeeID() {
		return employeeID;
	}
	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
