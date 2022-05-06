/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage_entities;

public class User {
	private int id;
	private String f_name;
        private String l_name;
	private String email;
	private String password;

	public User() {
	}

	public User(int id, String f_name,String l_name, String email, String password) {
		this.id = id;
		this.f_name = f_name;
                this.l_name = l_name;
		this.email = email;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getf_Name() {
		return f_name;
	}

	public void setf_Name(String f_name) {
		this.f_name = f_name;
	}
        
        public String getl_Name() {
		return l_name;
	}

	public void setl_Name(String l_name) {
		this.l_name = l_name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", f_name=" + f_name + ",l_name=" + l_name + ", email=" + email + ", password=" + password + "]";
	}
	
}
