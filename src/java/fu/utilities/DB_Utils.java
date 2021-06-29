/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class DB_Utils {

    public static Connection makeConnection() throws SQLException, NamingException, ClassNotFoundException {
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=FlowerManagement";
        Connection connection = DriverManager.getConnection(url, "sa", "123456");
        return connection;
    
    }
}
