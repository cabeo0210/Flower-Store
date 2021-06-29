/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.NamingException;


public class OrderDetailsDAO implements Serializable {

    public boolean insertOrderDetails(int orderID, String productID, int quantity, float price) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblOrderDetails(orderID,productID,quantity,price) VALUES(?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setInt(1, orderID);
                ps.setString(2, productID);
                ps.setInt(3, quantity);
                ps.setFloat(4, price);
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
