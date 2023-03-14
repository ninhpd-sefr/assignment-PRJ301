/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ninhpd.util;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author TienPhong
 */
public class DBHelper implements Serializable {
    public static Connection makeConnection() 
        throws /*ClassNotFoundException,*/ SQLException, NamingException {
        
        //1 get current context
        Context context = new InitialContext();
        //2 look up server context
        Context tomcat = (Context)context.lookup("java:comp/env");
        //3. look up DS
        DataSource ds = (DataSource)tomcat.lookup("DaicaCuongDS");
        //4 open connection
        Connection con = ds.getConnection();
        
        return con;
//        //1. Load driver
//        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        //2. Create Connection String
//        String url = 
//                "jdbc:sqlserver://localhost:1433;"
//                + "databaseName=PRJ301;instanceName=NINHPHAMDANG";
//        //3. Open Connection
//        Connection con = DriverManager.getConnection(url, "sa", "sa");
//        
//        return con;
    }
}
