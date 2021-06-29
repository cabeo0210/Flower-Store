/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.dtos;

import java.io.Serializable;
import java.sql.Date;


public class HistoryDTO implements Serializable{
    private int historyID;
    private String productID;
    private String userID;
    private Date updateDate;
    private String description;

    public HistoryDTO(int historyID, String productID, String userID, Date updateDate, String description) {
        this.historyID = historyID;
        this.productID = productID;
        this.userID = userID;
        this.updateDate = updateDate;
        this.description = description;
    }

    public HistoryDTO(String productID, String userID, Date updateDate, String description) {
        this.productID = productID;
        this.userID = userID;
        this.updateDate = updateDate;
        this.description = description;
    }
    
    public HistoryDTO() {
    }

    /**
     * @return the historyID
     */
    public int getHistoryID() {
        return historyID;
    }

    /**
     * @param historyID the historyID to set
     */
    public void setHistoryID(int historyID) {
        this.historyID = historyID;
    }

    /**
     * @return the productID
     */
    public String getProductID() {
        return productID;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(String productID) {
        this.productID = productID;
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
     * @return the updateDate
     */
    public Date getUpdateDate() {
        return updateDate;
    }

    /**
     * @param updateDate the updateDate to set
     */
    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }
    
    
}
