package io.github.kareiku;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.lang.reflect.Modifier;
import java.lang.reflect.Parameter;
import java.util.Arrays;
import java.util.Objects;

public class Diagramizer {
    public static String diagramize(@NotNull Class<?> clazz, @Nullable String stereotype, @Nullable String alias) {
        StringBuilder sb = new StringBuilder();

        stereotype = Objects.isNull(stereotype) ? "" : String.format("<<%s>>\\n", stereotype);
        alias = Objects.isNull(alias) ? Long.toString(System.nanoTime()) : alias;

        sb.append("object \"").append(stereotype).append(clazz.getSimpleName()).append("\" as ").append(alias).append(" {\n");

        Arrays.stream(clazz.getDeclaredFields()).filter(field -> !field.isSynthetic()).forEach(field -> sb
                .append("    ")
                .append(getModifierSymbol(field.getModifiers()))
                .append(field.getName())
                .append(": ")
                .append(field.getType().getSimpleName())
                .append("\n")
        );

        sb.append("    ---\n");

        Arrays.stream(clazz.getDeclaredConstructors()).filter(constructor -> !constructor.isSynthetic()).forEach(constructor -> sb
                .append("    ")
                .append(getModifierSymbol(constructor.getModifiers()))
                .append(constructor.getName())
                .append("\n")
        );

        Arrays.stream(clazz.getDeclaredMethods()).filter(method -> !method.isSynthetic()).forEach(method -> {
            sb.append("    ")
                    .append(getModifierSymbol(method.getModifiers()))
                    .append(method.getName())
                    .append("(");

            Parameter[] params = method.getParameters();
            for (int i = 0; i < params.length; i++) {
                if (i > 0) sb.append(", ");
                sb.append(params[i].getName())
                        .append(": ")
                        .append(params[i].getType().getSimpleName());
            }

            sb.append("): ")
                    .append(method.getReturnType().getSimpleName())
                    .append("\n");

        });

        sb.append("}");

        return sb.toString();
    }

    private static char getModifierSymbol(int modifiers) {
        if (Modifier.isPublic(modifiers)) return '+';
        else if (Modifier.isProtected(modifiers)) return '#';
        else if (Modifier.isPrivate(modifiers)) return '-';
        else return '~';
    }
}
