/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.sql.Date;

/**
 *
 * @author Dung
 */
public class Order {
    private int id;
    private String ordDate;
    private String shipDate;
    private int status;
    private int accID;

    public Order() {
    }

    public Order(int id, String ordDate, String shipDate, int status, int accID) {
        this.id = id;
        this.ordDate = ordDate;
        this.shipDate = shipDate;
        this.status = status;
        this.accID = accID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrdDate() {
        return ordDate;
    }

    public void setOrdDate(String ordDate) {
        this.ordDate = ordDate;
    }

    public String getShipDate() {
        return shipDate;
    }

    public void setShipDate(String shipDate) {
        this.shipDate = shipDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    
    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", ordDate=" + ordDate + ", shipDate=" + shipDate + ", status=" + status + ", accID=" + accID + '}';
    }
    
    
}
