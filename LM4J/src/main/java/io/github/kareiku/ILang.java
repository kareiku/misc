package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.util.Optional;

public interface ILang {
    /**
     * Obtains the value associated with a key and returns it.
     *
     * @param key the key to search by
     * @return the associated value or an empty string, if none was found.
     */
    @NotNull String getLine(@NotNull String key);

    /**
     * Obtains the optional for the value associated with a key and returns it.
     *
     * @param key the key to search by
     * @return the associated value.
     * @see Optional
     */
    @NotNull Optional<String> getOptionalLine(@NotNull String key);
}
