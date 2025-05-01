package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.util.Optional;

/**
 * Represents a source of localized or externalized strings, accessible by key.
 */
public interface Lang {
    /**
     * Returns the value associated with the given key, or an empty string if no value is found.
     *
     * @param key the lookup key (must not be null)
     * @return the associated value, or an empty string if absent
     */
    @NotNull String getLine(@NotNull String key);


    /**
     * Returns an {@link Optional} containing the value associated with the given key,
     * or an empty {@code Optional} if no value is found.
     *
     * @param key the lookup key (must not be null)
     * @return an {@code Optional} containing the associated value, or empty if none is found
     */
    @NotNull Optional<String> getOptionalLine(@NotNull String key);
}
