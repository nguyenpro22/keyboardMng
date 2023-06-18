/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import mylib.DBUtils;

/**
 *
 * @author Dung
 */
public class AccountDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> list = new ArrayList<>();
        String query = "Select * from Accounts";
        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean updateAccountStatus(String email, String status) {
        try {
            con = DBUtils.makeConnection();
            String query = "update Accounts set Status = ? where Email = ?";
            st = con.prepareStatement(query);
            st.setString(1, status);
            st.setString(2, email);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean updateAccount(String email, String newPassword, String newFullname, String newPhone) {
        try {
            con = DBUtils.makeConnection();
            String query = "update Accounts\n"
                    + "set Password = ?, Fullname = ?, Phone = ?\n"
                    + "where Email = ?";
            st = con.prepareStatement(query);
            st.setString(1, newPassword);
            st.setString(2, newFullname);
            st.setString(3, newPhone);
            st.setString(4, email);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean insertAccount(String newEmail, String newPassword, String newFullname, String newPhone, String newSatus, String newRole) {
        Account acc = new Account(1, newEmail,  newFullname, newPassword, newPhone, newSatus, newRole);
        try {
            con = DBUtils.makeConnection();
            String query = "select email from Accounts where email = ?";
            st = con.prepareStatement(query);
            st.setString(1, newEmail);
            rs = st.executeQuery();
            if (rs != null) {
                if (rs.next()) {
                    return false;
                }
                query = "insert into Accounts(email, password, fullname, phone, status, role) \n"
                        + "		values(?, ?, ?, ?, ?, ?)";
                st = con.prepareStatement(query);
                st.setString(1, acc.getEmail());
                st.setString(2, acc.getPassword());
                st.setString(3, acc.getFullName());
                st.setString(4, acc.getPhone());
                st.setInt(5, Integer.parseInt(acc.getStatus()));
                st.setInt(6, Integer.parseInt(acc.getRole()));
                st.executeUpdate();

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    public Account checkAccount(String email, String password) {
        try {
            con = DBUtils.makeConnection();
            String query = "select * from Accounts where email = ? and password = ?";
            st = con.prepareStatement(query);
            st.setString(1, email);
            st.setString(2, password);
            rs = st.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String Email = rs.getString(2).trim();

                    String Password = rs.getString(3);
                    String FullName = rs.getString(4);

                    String Phone = rs.getString(5);
                    String status = rs.getString(6);
                    String Role = rs.getString(7);
                    return new Account(id, Email,  Password,FullName, Phone, status, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public Account checkAccount(String email) {
        try {
            con = DBUtils.makeConnection();
            String query = "select * from Accounts where email = ?";
            st = con.prepareStatement(query);
            st.setString(1, email);
            rs = st.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int id = rs.getInt(1);
                    String Email = rs.getString(2).trim();

                    String Password = rs.getString(3);
                    String FullName = rs.getString(4);

                    String Phone = rs.getString(5);
                    String status = rs.getString(6);
                    String Role = rs.getString(7);
                    return new Account(id, Email, Password,FullName, Phone, status, Role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean deleteAccount(String id) {
        try {
            con = DBUtils.makeConnection();
            String query = "delete Accounts where Accid = ?";
            st = con.prepareStatement(query);
            st.setString(1, id);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
    }
}
