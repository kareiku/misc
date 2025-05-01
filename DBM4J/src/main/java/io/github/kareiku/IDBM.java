package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.sql.SQLException;
import java.util.List;

public interface IDBM {
    void update(@NotNull String query) throws SQLException;

    @NotNull List<List<?>> fetch(@NotNull String query) throws SQLException;
}
