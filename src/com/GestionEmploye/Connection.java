package com.GestionEmploye;

import java.sql.DriverManager;
import java.sql.SQLException;

public class Connection {
    String url       = "jdbc:mysql://localhost:3306/GestionEmploye";
    String user      = "root";
    String password  = "";
    public java.sql.Connection getConn() throws SQLException {
        return DriverManager.getConnection(url,user,password);
    }
}
