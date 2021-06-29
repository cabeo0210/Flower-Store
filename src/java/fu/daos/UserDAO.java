/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dtos.UserDTO;
import fu.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;


public class UserDAO implements Serializable {
    
    private List<UserDTO> allUser;

    public List<UserDTO> getAllUsers() {
        return allUser;
    }
    
    

    public UserDTO checkLogin(String id, String password) throws SQLException, NamingException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UserDTO dto = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT isAdmin,name,id FROM tblUser WHERE id = ? COLLATE Latin1_General_CS_AI"
                        + " AND password = ? COLLATE Latin1_General_CS_AI";
                ps = con.prepareStatement(sql);
                ps.setString(1, id);
                ps.setString(2, password);
                rs = ps.executeQuery();
                if (rs.next()) {
                    boolean isAdmin = rs.getBoolean("isAdmin");
                    String name = rs.getString("name");                    
                    dto = new UserDTO(id, "", name, isAdmin, "");
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
        return dto;
    }
    
    
    public void getAllUser() {
        Connection cn = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {
            cn = DB_Utils.makeConnection();
            if (cn != null) {
                String sql = "select [ID],[password],[name],[isAdmin],[email]"
                        + " from [dbo].[tblUser]";
                pstm = cn.prepareStatement(sql);
                rs = pstm.executeQuery();
                while (rs.next()) {
                    String id = rs.getString("ID");
                    String name = rs.getString("name");
                    String password = rs.getString("password");
                    String email = rs.getString("email");
                    UserDTO user = new UserDTO(id, password, name, true, email);
                    if (allUser == null) {
                        allUser = new ArrayList<>();
                    }
                    allUser.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (pstm != null) {
                try {
                    pstm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    
    
     public static UserDTO findUser(String Id, List<UserDTO> list) {

        for (UserDTO item : list) {
            if (item.getId().equals(Id)) {
                return item;
            }
        }
        return null;
    }
     
     public static int insertUser(UserDTO newUser) {
        Connection cn = null;
        PreparedStatement pstm = null;
        int rs = 0;
        try {
            cn = DB_Utils.makeConnection();
            if (cn != null) {
                String sql = "insert into [dbo].[tblUser] values"
                        + " (?,?,?,?,?)";
                pstm = cn.prepareStatement(sql);
                pstm.setString(1, newUser.getId());
                pstm.setString(2, newUser.getPassword());
                pstm.setString(3, newUser.getName());
                pstm.setBoolean(4, newUser.isIsAdmin());
                pstm.setString(5, newUser.getEmail());
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return rs;
        }
    }
    
    
}
