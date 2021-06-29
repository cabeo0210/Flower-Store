/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dtos.ProductDTO;
import fu.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;


public class ProductDAO implements Serializable {

    List<ProductDTO> list = null;

    public List<ProductDTO> getList() {
        return list;
    }

    public void loadPage(int index, int pageSize, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                        + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                        + "WHERE productStatus = 'Active' AND quantity > 0 ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                if (isAdmin) {
                    sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                            + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                            + "ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                }
                ps = con.prepareStatement(sql);
                ps.setInt(1, (index * pageSize));
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ID");
                    String name = rs.getString("nameProduct");
                    String image = rs.getString("image");
                    String desc = rs.getString("description");
                    Date createDate = rs.getDate("createDate");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String category = rs.getString("categoryID");
                    String status = rs.getString("productStatus");
                    ProductDTO dto = new ProductDTO(id, name, image, desc, price, createDate, quantity, status, category);
                    if (this.list == null) {
                        list = new ArrayList<>();
                    }
                    this.list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int countResultSearchAll(boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(ID) FROM tblProduct WHERE productStatus = 'Active'";
                if (isAdmin) {
                    sql = "SELECT COUNT(ID) FROM tblProduct";
                }
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public void searchProductByName(String keySearch, int index, int pageSize, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                        + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                        + "WHERE tblProduct.nameProduct LIKE ? AND quantity > 0 AND productStatus = 'Active' "
                        + "ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                if (isAdmin) {
                    sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                            + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                            + "WHERE tblProduct.nameProduct LIKE ? AND quantity > 0 "
                            + "ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + keySearch + "%");
                ps.setInt(2, (index * pageSize));
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ID");
                    String name = rs.getString("nameProduct");
                    String image = rs.getString("image");
                    String desc = rs.getString("description");
                    Date createDate = rs.getDate("createDate");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String category = rs.getString("categoryID");
                    String status = rs.getString("productStatus");
                    ProductDTO dto = new ProductDTO(id, name, image, desc, price, createDate, quantity, status, category);
                    if (this.list == null) {
                        list = new ArrayList<>();
                    }
                    this.list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int countResultSearchName(String keySearch, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(ID) FROM tblProduct WHERE nameProduct LIKE ? AND quantity > 0 AND productStatus = 'Active'";
                if (isAdmin) {
                    sql = "SELECT COUNT(ID) FROM tblProduct WHERE nameProduct LIKE ? AND quantity > 0";
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, "%" + keySearch + "%");
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    
    public int countResultSearchMoney(float minValue, float maxValue, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(ID) FROM tblProduct "
                        + "WHERE price >= ? AND price <= ? and quantity > 0 AND productStatus = 'Active'";
                if (isAdmin) {
                    sql = "SELECT COUNT(ID) FROM tblProduct "
                            + "WHERE price >= ? AND price <= ? and quantity > 0";
                }
                ps = con.prepareStatement(sql);
                ps.setFloat(1, minValue);
                ps.setFloat(2, maxValue);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public void searchProductByCategory(String category, int index, int pageSize, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                        + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                        + "WHERE tblCategory.ID = ? AND quantity > 0 AND productStatus = 'Active' "
                        + "ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                if (isAdmin) {
                    sql = "SELECT tblProduct.ID,tblProduct.nameProduct,image,description,price,createDate,categoryID,quantity,productStatus "
                            + "FROM tblProduct JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                            + "WHERE tblCategory.ID = ? AND quantity > 0 "
                            + "ORDER BY createDate OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, category);
                ps.setInt(2, (index * pageSize));
                rs = ps.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ID");
                    String name = rs.getString("nameProduct");
                    String image = rs.getString("image");
                    String desc = rs.getString("description");
                    Date createDate = rs.getDate("createDate");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String status = rs.getString("productStatus");
                    ProductDTO dto = new ProductDTO(id, name, image, desc, price, createDate, quantity, status, category);
                    if (this.list == null) {
                        list = new ArrayList<>();
                    }
                    this.list.add(dto);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    public int countResultSearchCategory(String category, boolean isAdmin) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT COUNT(tblProduct.ID) FROM tblProduct "
                        + "JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                        + "WHERE tblCategory.ID = ? AND quantity > 0 AND productStatus = 'Active'";
                if (isAdmin) {
                    sql = "SELECT COUNT(tblProduct.ID) FROM tblProduct "
                            + "JOIN tblCategory ON tblCategory.ID = tblProduct.categoryID "
                            + "WHERE tblCategory.ID = ? AND quantity > 0";
                }
                ps = con.prepareStatement(sql);
                ps.setString(1, category);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public boolean deleteProduct(String id, String lastRemoveUser, Date lastUpdateDate, String productStatus) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblProduct SET lastUpdateUser = ?, lastUpdateDate = ?, productStatus = ? WHERE ID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, lastRemoveUser);
                ps.setDate(2, lastUpdateDate);
                ps.setString(3, productStatus);
                ps.setString(4, id);
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean updateProduct(ProductDTO dto) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblProduct SET nameProduct = ?, image = ?, description = ?, price = ?, "
                        + "quantity = ?, productStatus = ?, lastUpdateDate = ?, lastUpdateUser = ?, categoryID = ? "
                        + "WHERE ID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getName().trim());
                ps.setString(2, dto.getImage().trim());
                ps.setString(3, dto.getDesc().trim());
                ps.setFloat(4, dto.getPrice());
                ps.setInt(5, dto.getQuantity());
                ps.setString(6, dto.getProductStatus());
                ps.setDate(7, dto.getLastUpdateDate());
                ps.setString(8, dto.getLastUpdateUser());
                ps.setString(9, dto.getCategoryID());
                ps.setString(10, dto.getId().trim());
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public String loadLastUpdateUser(String id) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT lastUpdateUser FROM tblProduct WHERE ID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                rs = ps.executeQuery();
                while (rs.next()) {
                    return rs.getString("lastUpdateUser");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return "";
    }

    public boolean insertProduct(ProductDTO dto) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblProduct(ID,nameProduct,image,description,createDate,lastUpdateDate,lastUpdateUser,quantity,price,productStatus,categoryID) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getId().trim());
                ps.setString(2, dto.getName().trim());
                ps.setString(3, dto.getImage().trim());
                ps.setString(4, dto.getDesc());
                ps.setDate(5, dto.getCreateDate());
                ps.setDate(6, dto.getLastUpdateDate());
                ps.setString(7, dto.getLastUpdateUser());
                ps.setInt(8, dto.getQuantity());
                ps.setFloat(9, dto.getPrice());
                ps.setString(10, dto.getProductStatus());
                ps.setString(11, dto.getCategoryID());
                int row = ps.executeUpdate();
                if (row > 0) {
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public int getQuantityByProductID(String productID) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT quantity "
                        + "FROM tblProduct "
                        + "WHERE ID = ? ";

                ps = con.prepareStatement(sql);
                ps.setString(1, productID);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("quantity");
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public boolean updateQuantityAfterSold(String productID, int quantitySold) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            int quantityRemaining = getQuantityByProductID(productID) - quantitySold;
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "UPDATE tblProduct SET quantity = ? WHERE ID = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, quantityRemaining);
                ps.setString(2, productID);
                int row = ps.executeUpdate();
                if(row > 0){
                    return true;
                }
            }
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
}
