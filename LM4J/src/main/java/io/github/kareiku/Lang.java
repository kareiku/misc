package io.github.kareiku;

import org.jetbrains.annotations.NotNull;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collections;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

public class Lang implements ILang {
    private final Map<String, String> lines;

    /**
     * Creates a language object that associates keys with values for each line in a file found to follow the format.
     * <p>
     * Format: <code>%s%s%s</code> – <i>key, separator, value</i>
     *
     * @param path      the path string to the file
     * @param separator the separator for the (key, value) pair
     * @throws IOException if an I/O error occurs reading from the file or a malformed or unmappable byte sequence is read.
     */
    public Lang(@NotNull String path, @NotNull String separator) throws IOException {
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
     * Obtains the value associated with a key and returns it.
     *
     * @param key the key to search by
     * @return the associated value or an empty string, if none was found.
     */
    @Override
    public @NotNull String getLine(@NotNull String key) {
        return this.lines.getOrDefault(key, "");
    }

    /**
     * Obtains the optional for the value associated with a key and returns it.
     *
     * @param key the key to search by
     * @return the associated value.
     * @see Optional
     */
    @Override
    public @NotNull Optional<String> getOptionalLine(@NotNull String key) {
        return Optional.ofNullable(this.lines.get(key));
    }
}
