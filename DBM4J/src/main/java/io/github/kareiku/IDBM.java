package io.github.kareiku;

import java.sql.SQLException;
import java.util.List;

public interface IDBM {
    void update(String query) throws SQLException;

    List<List<?>> fetch(String query) throws SQLException;
}
