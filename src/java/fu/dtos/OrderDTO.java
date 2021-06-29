/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.dtos;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;


public class OrderDTO implements Serializable{
    private int orderID;
    private String userID;
    private String address;
    private String phoneNumber;
    private Date dateOrder;
    private Time timeOrder;
    private float totalPrice;

    public OrderDTO(int orderID, String userID, String address, String phoneNumber, Date dateOrder, Time timeOrder, float totalPrice) {
        this.orderID = orderID;
        this.userID = userID;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.dateOrder = dateOrder;
        this.timeOrder = timeOrder;
        this.totalPrice = totalPrice;
    }

    public OrderDTO(String userID, String address, String phoneNumber, Date dateOrder, Time timeOrder, float totalPrice) {
        this.userID = userID;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.dateOrder = dateOrder;
        this.timeOrder = timeOrder;
        this.totalPrice = totalPrice;
    }    
    
    public OrderDTO() {
    }

    /**
     * @return the orderID
     */
    public int getOrderID() {
        return orderID;
    }

    /**
     * @param orderID the orderID to set
     */
    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    /**
     * @return the userID
     */
    public String getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(String userID) {
        this.userID = userID;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the phoneNumber
     */
    public String getPhoneNumber() {
        return phoneNumber;
    }

    /**
     * @param phoneNumber the phoneNumber to set
     */
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    /**
     * @return the dateOrder
     */
    public Date getDateOrder() {
        return dateOrder;
    }

    /**
     * @param dateOrder the dateOrder to set
     */
    public void setDateOrder(Date dateOrder) {
        this.dateOrder = dateOrder;
    }

    /**
     * @return the timeOrder
     */
    public Time getTimeOrder() {
        return timeOrder;
    }

    /**
     * @param timeOrder the timeOrder to set
     */
    public void setTimeOrder(Time timeOrder) {
        this.timeOrder = timeOrder;
    }

    /**
     * @return the totalPrice
     */
    public float getTotalPrice() {
        return totalPrice;
    }

    /**
     * @param totalPrice the totalPrice to set
     */
    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    
}
