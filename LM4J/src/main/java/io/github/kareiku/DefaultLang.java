package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * A default implementation of {@link Lang} that loads key-value pairs from a text file.
 * <p>
 * The file must contain lines in the format:
 * <pre>
 * key&lt;separator&gt;value
 * </pre>
 * Lines without the separator are ignored. Only the first occurrence of the separator per line is used.
 */
public class DefaultLang implements Lang {
    private final Map<String, String> lines;

    /**
     * Constructs a {@code DefaultLang} instance by loading key-value pairs from a file.
     *
     * @param path      the path to the file containing key-value pairs
     * @param separator the separator used between keys and values
     * @throws IOException if an I/O error occurs reading the file or its contents are malformed
     */
    public DefaultLang(@NotNull String path, @NotNull String separator) throws IOException {
        this.lines = Collections.unmodifiableMap(
                Files.readAllLines(Paths.get(path)).stream()
                        .map(String::trim)
                        .filter(line -> line.contains(separator))
                        .map(line -> line.split(separator, 2))
                        .filter(pair -> pair.length == 2)
                        .collect(Collectors.toMap(
                                pair -> pair[0],
                                pair -> pair[1],
                                (oldValue, newValue) -> oldValue
                        )));
    }

    /**
     * Returns the value associated with the given key, or an empty string if the key is not present.
     *
     * @param key the lookup key (must not be null)
     * @return the associated value, or an empty string if none is found
     */
    @Override
    public @NotNull String getLine(@NotNull String key) {
        return this.lines.getOrDefault(key, "");
    }

    /**
     * Returns an {@link Optional} containing the value associated with the given key,
     * or an empty {@code Optional} if the key is not present.
     *
     * @param key the lookup key (must not be null)
     * @return an {@code Optional} with the associated value, or empty if none is found
     */
    @Override
    public @NotNull Optional<String> getOptionalLine(@NotNull String key) {
        return Optional.ofNullable(this.lines.get(key));
    }
}
