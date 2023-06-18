/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Category;
import dto.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import mylib.DBUtils;

/**
 *
 * @author Dung
 */
public class ProductDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public ArrayList<Product> getProducts(String keyword, String searchby) {
        ArrayList<Product> list = new ArrayList<>();
        try {
            con = DBUtils.makeConnection();
            String query = "SELECT ProductID, ProductName, Price, Img, Description, product.CateID FROM Product join Categories on Product.CateID = Categories.CateID where ";
            if (searchby.equalsIgnoreCase("byname")) {
                query += "ProductName like ?";
            } else {
                query += "CateName like ?";
            }
            st = con.prepareStatement(query);
            st.setString(1, "%" + keyword + "%");
            rs = st.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    list.add(new Product(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProduct(String id) {
        try {
            con = DBUtils.makeConnection();
            String query = "SELECT ProductID, ProductName, Price, Img, Description, CateID FROM Product where ProductID = ?";
            st = con.prepareStatement(query);
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    return new Product(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Product getLastProduct() {
        try {
            con = DBUtils.makeConnection();
            String query = "SELECT top 1 * FROM Product order by ProductID desc";
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    return new Product(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getInt(6));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "Select * from product";
        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext6Product(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM product ORDER BY ProductID OFFSET ? ROWS FETCH NEXT 6 ROWS ONLY";
        try {
            con = DBUtils.makeConnection();//mo ket noi voi sql
            st = con.prepareStatement(query);
            st.setInt(1, amount);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Product> getTop6Product() {
        ArrayList<Product> list = new ArrayList<>();
        String query = "Select top 6 * from product";
        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ArrayList<Category> getCategory() {
        ArrayList<Category> list = new ArrayList<>();
        String query = "Select * from categories";
        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public boolean updateProduct(int id, String newName, double newPrice, String newImg, String newDescription, int newStatus, int newCateID) {
        try {
            con = DBUtils.makeConnection();
            String query = "update Product \n"
                    + "set ProductName = ?, Price = ?, Img = ?, Description = ?, Status = ?, CateID = ?\n"
                    + "where ProductID = ?";
            st = con.prepareStatement(query);
            st.setString(1, newName);
            st.setDouble(2, newPrice);
            st.setString(3, newImg);
            st.setString(4, newDescription);
            st.setInt(5, newStatus);
            st.setInt(6, newCateID);
            st.setInt(7, id);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean addNewProduct(Product product) {
        try {
            con = DBUtils.makeConnection();
            String query = "Insert into Product ( ProductName, Price, Img, Description, Status, CateID)\n"
                    + "values(?,?,?,?,?,?)";
            st = con.prepareStatement(query);
            st.setString(1, product.getName());
            st.setDouble(2, product.getPrice());
            st.setString(3, product.getImg());
            st.setString(4, product.getDescription());
            st.setInt(5, 1);
            st.setInt(6, product.getCateID());
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean addNewCategory(String name) {
        try {
            con = DBUtils.makeConnection();
            String query = "Insert into Categories ( CateName)\n"
                    + "values(?)";
            st = con.prepareStatement(query);
            st.setString(1, name);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public boolean deleteCategory(String name) {
        try {
            con = DBUtils.makeConnection();
            String query = "delete Categories where CateName = ?";
            st = con.prepareStatement(query);
            st.setString(1, name);
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean deleteProduct(String id) {
        try {
            con = DBUtils.makeConnection();
            String query = "delete Product where ProductID = ?";
            st = con.prepareStatement(query);
            st.setInt(1, Integer.parseInt(id));
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();
    }
}
