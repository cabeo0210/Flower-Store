/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.dtos;

import java.io.Serializable;
import java.sql.Date;


public class ProductDTO implements Serializable {

    private String id;
    private String name;
    private String image;
    private String desc;
    private float price;
    private Date createDate;
    private Date lastUpdateDate;
    private String lastUpdateUser;
    private int quantity;
    private String categoryID;
    private String productStatus;
    
    public ProductDTO(String id, String name, String image, String desc, float price, Date createDate, Date lastUpdateDate, String lastUpdateUser, int quantity, String categoryID) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
        this.quantity = quantity;
        this.categoryID = categoryID;
    }

    public ProductDTO(String id, String name, String image, String desc, float price, Date createDate, int quantity, String category) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.createDate = createDate;
        this.quantity = quantity;
        this.categoryID = category;
    }    

    public ProductDTO(String id, String name, String image, String desc, float price, int quantity, String category) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.quantity = quantity;
        this.categoryID = category;
    }

    public ProductDTO(String id, String name, String image, String desc, float price, Date lastUpdateDate, String lastUpdateUser, int quantity, String productStatus) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
        this.quantity = quantity;
        this.productStatus = productStatus;
    }   

    public ProductDTO(String id, String name, String image, String desc, float price, Date createDate, int quantity, String productStatus, String category) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.createDate = createDate;
        this.quantity = quantity;
        this.productStatus = productStatus;
        this.categoryID = category;
    }   

    public ProductDTO(String id, String name, String image, String desc, float price, Date createDate, Date lastUpdateDate, String lastUpdateUser, int quantity, String category, String productStatus) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.createDate = createDate;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
        this.quantity = quantity;
        this.categoryID = category;
        this.productStatus = productStatus;
    }

    public ProductDTO(String id, String name, String image, String desc, float price, Date lastUpdateDate, String lastUpdateUser, int quantity, String categoryID, String productStatus) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.desc = desc;
        this.price = price;
        this.lastUpdateDate = lastUpdateDate;
        this.lastUpdateUser = lastUpdateUser;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.productStatus = productStatus;
    }

    public ProductDTO(String id, String name, float price, String lastUpdateUser, int quantity, String categoryID, String image) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.lastUpdateUser = lastUpdateUser;
        this.quantity = quantity;
        this.categoryID = categoryID;
        this.image = image;
    }
    
    public ProductDTO(String productStatus) {
        this.productStatus = productStatus;
    }

    public ProductDTO(String id, String productStatus) {
        this.id = id;
        this.productStatus = productStatus;
    }
    
    public ProductDTO() {
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the image
     */
    public String getImage() {
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImage(String image) {
        this.image = image;
    }

    /**
     * @return the desc
     */
    public String getDesc() {
        return desc;
    }

    /**
     * @param desc the desc to set
     */
    public void setDesc(String desc) {
        this.desc = desc;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the createDate
     */
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * @param createDate the createDate to set
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /**
     * @return the lastUpdateDate
     */
    public Date getLastUpdateDate() {
        return lastUpdateDate;
    }

    /**
     * @param lastUpdateDate the lastUpdateDate to set
     */
    public void setLastUpdateDate(Date lastUpdateDate) {
        this.lastUpdateDate = lastUpdateDate;
    }

    /**
     * @return the lastUpdateUser
     */
    public String getLastUpdateUser() {
        return lastUpdateUser;
    }

    /**
     * @param lastUpdateUser the lastUpdateUser to set
     */
    public void setLastUpdateUser(String lastUpdateUser) {
        this.lastUpdateUser = lastUpdateUser;
    }

    /**
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the productStatus
     */
    public String getProductStatus() {
        return productStatus;
    }

    /**
     * @param productStatus the productStatus to set
     */
    public void setProductStatus(String productStatus) {
        this.productStatus = productStatus;
    }

    /**
     * @return the categoryID
     */
    public String getCategoryID() {
        return categoryID;
    }

    /**
     * @param categoryID the categoryID to set
     */
    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    
    
}
