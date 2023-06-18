/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.Order;
import dto.OrderDetail;
import dto.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import mylib.DBUtils;

/**
 *
 * @author Dung
 */
public class OrderDAO {

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        String query = "Select * from Orders";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<OrderDetail> getAllOrderDetails() {
        List<OrderDetail> list = new ArrayList<>();
        String query = "Select * from OrderDetails";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String addOrderToDB(Order order) {
        String query = "insert into orders (OrdDate, Shipdate,Status,AccID) values (?,?,1,?)";
        Connection con;
        PreparedStatement st;
        ResultSet rs;
        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            st.setString(1, order.getOrdDate());
            st.setString(2, order.getShipDate());
            st.setInt(3, order.getAccID());
            st.executeUpdate();
            rs = st.getGeneratedKeys();
            if (rs.next()) {
                return (rs.getString(1));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addOrderDetailsToDB(OrderDetail orderDetail) {
        String query = "insert into OrderDetails (OrderID,FID,Quantity) values (?,?,?)";
        Connection con;
        PreparedStatement st;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, orderDetail.getOrdID());
            st.setInt(2, orderDetail.getProID());
            st.setInt(3, orderDetail.getQuantity());
            st.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }

    }

    public double getShipPrice(int ordID) {
        String query = "select (DAY(Shipdate) - DAY(OrdDate)) from Orders where OrderID = ?";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, ordID);
            rs = st.executeQuery();
            while (rs.next()) {
                switch (rs.getInt(1)) {
                    case 5:
                        return 40;
                    case 6:
                        return 30;
                    case 7:
                        return 20;
                    default:
                        return 0;
                }

            }
        } catch (Exception e) {
        }
        return 0;
    }

    public Order getOrderByOrdID(int ordID) {
        String query = "select * from Orders where OrderID = ?";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, ordID);
            rs = st.executeQuery();
            while (rs.next()) {
                return (new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getOrderDetailsByOrdID(int ordID) {
        List<OrderDetail> list = new ArrayList<>();
        String query = "select * from OrderDetails where OrderID = ?";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, ordID);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> searchOrdByDate(String start, String end, String accID) {
        List<Order> list = new ArrayList<>();
        String query = "SELECT * FROM Orders WHERE AccID like ? and OrdDate BETWEEN ? AND ?";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setString(1, accID);
            st.setString(2, start);
            st.setString(3, end);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Order> getAllOrdersByAccID(int accID) {
        List<Order> list = new ArrayList<>();
        String query = "Select * from Orders where accID = ?";
        Connection con;
        PreparedStatement st;
        ResultSet rs;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, accID);
            rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getStatus(int status) {
        switch (status) {
            case 1: {

                return "In processing";
            }
            case 2: {

                return "Completed";
            }
            case 0: {

                return "Canceled";
            }
        }
        return "";
    }

    public void updateOrderStatus(String id, String status) {
        Connection con;
        PreparedStatement st;
        ResultSet rs;
        try {
            con = DBUtils.makeConnection();
            String query = "update Orders set Status = ? where OrderID = ?";
            st = con.prepareStatement(query);
            st.setString(1, status);
            st.setInt(2, Integer.parseInt(id));
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public double getTotalPrice(List<OrderDetail> list, int id) {
        double price = 0;
        ProductDAO dao = new ProductDAO();
        for (OrderDetail o : list) {
            Product p = dao.getProduct(Integer.toString(o.getProID()));
            price += p.getPrice() * o.getQuantity();
        }
        OrderDAO daon = new OrderDAO();
        return price += daon.getShipPrice(id);
    }

    public Order getFirstOrder() {
        List<Order> list = getAllOrders();
        return list.get(0);
    }

    public <Product, Integer> boolean compareMaps(HashMap<Product, Integer> map1, HashMap<Product, Integer> map2) {
        if (map1.size() != map2.size()) {
            return false;
        }

        for (Product key : map1.keySet()) {
            if (!map2.containsKey(key) || !map1.get(key).equals(map2.get(key))) {
                return false;
            }
        }

        return true;
    }

    public void deleteOrderByOrdID(int ordID) {
        String query = "Delete Orders where OrderID = ?";
        Connection con;
        PreparedStatement st;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, ordID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteOrderDetailByOrdID(int ordID) {
        String query = "Delete OrderDetails where OrderID = ?";
        Connection con;
        PreparedStatement st;

        try {
            con = DBUtils.makeConnection();
            st = con.prepareStatement(query);
            st.setInt(1, ordID);
            st.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public int countTotalProduct(List<OrderDetail> list){
        int count = 0;
        for (OrderDetail orderDetail : list) {
            count += orderDetail.getQuantity();
        }
        return count;
    }
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        dao.deleteOrderByOrdID(10);
    }
}
