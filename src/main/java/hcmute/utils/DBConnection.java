package hcmute.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private final String serverName = "localhost";
    private final String dbName = "WebLoginDB";
    private final String portNumber = "1433";
    private final String instance = ""; 
    private final String userID = "sa";
    private final String password = "123456"; // chỗ ghi mật khẩu

    public Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance
                + ";databaseName=" + dbName + ";encrypt=false";
        if (instance == null || instance.trim().isEmpty())
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=false";
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); // khai bao loai hqt csdl dang dung
        return DriverManager.getConnection(url, userID, password);
    }
}