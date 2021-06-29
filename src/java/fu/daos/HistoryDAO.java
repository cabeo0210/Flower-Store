/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dtos.HistoryDTO;
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

public class HistoryDAO implements Serializable {

    List<HistoryDTO> list;

    public List<HistoryDTO> getList() {
        return list;
    }

    public boolean insertHistory(String productID, String userID, Date updateDate, String desc) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblHistory(productID,userID,updateDate,description) VALUES (?,?,?,?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, productID);
                ps.setString(2, userID);
                ps.setDate(3, updateDate);
                ps.setString(4, desc);
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

    public void loadHistory() throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT historyID,productID,userID,updateDate,description FROM tblHistory";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    int historyID = rs.getInt("historyID");
                    String productID = rs.getString("productID");
                    String userID = rs.getString("userID");
                    Date updateDate = rs.getDate("updateDate");
                    String description = rs.getString("description");
                    HistoryDTO dto = new HistoryDTO(historyID,productID, userID, updateDate, description);
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
}
