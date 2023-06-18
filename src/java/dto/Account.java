/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

/**
 *
 * @author Dung
 */
public class Account {

    private int id;
    private String email;
    private String fullName;
    private String password;
    private String phone;
    private String status;
   
    private String role;
    

    public Account() {
    }

    public Account(int id, String email, String password, String fullName,String phone, String status, String role) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        
        this.phone = phone;
        this.status = status;
        this.role = role;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Account{" +"id="+id+ ", email=" + email + ", fullName=" + fullName + ", role=" + role + ", password=" + password + ", phone=" + phone + ", status=" + status + '}';
    }

    
}
