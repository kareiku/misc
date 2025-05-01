package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySQLDBM extends DBM {
    private final String url;

    public MySQLDBM(String url) {
        this.url = url;
    }

    @Override
    protected @NotNull Connection getConnection() throws SQLException {
        return DriverManager.getConnection(this.url);
    }
}
