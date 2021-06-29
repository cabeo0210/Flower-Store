/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dtos.OrderDTO;
import fu.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;


public class OrderDAO implements Serializable{
    List<OrderDTO> listOrder;

    public List<OrderDTO> getListOrder() {
        return listOrder;
    }
    
    public boolean insertOrder(OrderDTO dto) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblOrder(userID,address,userPhoneNumber,dateOrder,timeOrder,totalPrice) "
                        + "VALUES (?,?,?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, dto.getUserID().trim());
                ps.setString(2, dto.getAddress());
                ps.setString(3, dto.getPhoneNumber());
                ps.setDate(4, dto.getDateOrder());
                ps.setTime(5, dto.getTimeOrder());
                ps.setFloat(6, dto.getTotalPrice());                
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
    
    public int getLastOrderID() throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT TOP 1 ID FROM tblOrder ORDER BY ID DESC";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("ID");
                }
            }
        } finally {
            if(rs != null){
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return 0;
    }
    
    public void viewOrderList(String userID) throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT tblOrder.ID, address, userPhoneNumber, dateOrder, timeOrder, totalPrice "
                        + "FROM tblOrder WHERE userID = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, userID);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int orderID = rs.getInt("ID");
                    String address = rs.getString("address");
                    String userPhoneNumber = rs.getString("userPhoneNumber");
                    Date dateOrder = rs.getDate("dateOrder");
                    Time timeOrder = rs.getTime("timeOrder");
                    float totalPrice = rs.getFloat("totalPrice");
                    OrderDTO dto = new OrderDTO(orderID, userID, address, userPhoneNumber, dateOrder, timeOrder, totalPrice);
                    if (this.listOrder == null) {
                        this.listOrder = new ArrayList<>();
                    }                    
                    this.listOrder.add(dto);
                }
            }
        } finally {
            if(rs != null){
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
}
