/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.daos;

import fu.dtos.CategoryDTO;
import fu.utilities.DB_Utils;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;


public class CategoryDAO implements Serializable {

    List<CategoryDTO> list = null;

    public List<CategoryDTO> getList() {
        return list;
    }

    public void loadCategory() throws NamingException, SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            con = DB_Utils.makeConnection();
            if (con != null) {
                String sql = "SELECT name FROM tblCategory";
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    CategoryDTO dto = new CategoryDTO("", name);
                    if(this.list == null){
                        this.list = new ArrayList<>();
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
