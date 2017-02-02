package com.yuen.util;

import java.text.Normalizer;
import java.text.Normalizer.Form;
import java.util.Locale;
import java.util.regex.Pattern;

public class StringUtil {

    private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");
    private static final Pattern WHITESPACE = Pattern.compile("[\\s]");
    
    public static String slugify(String input) {
        String nowhitespace = WHITESPACE.matcher(input).replaceAll("-");
        String normalized = Normalizer.normalize(nowhitespace, Form.NFD);
        String slug = NONLATIN.matcher(normalized).replaceAll("");
        return slug.toLowerCase(Locale.ENGLISH);
    }

    public static String splice(String input, int num) {
        String[] words = input.split("\\s+");
        String output = "";
        if (words.length < 10) {
            num = words.length;
        }
        for (int i = 0; i < num; i++) {
            output += words[i] + " ";
        }
        return output;
    }
    
    public static String escapeHTML(String input) {
        return input.replaceAll("\\<.*?>","");
    }
}
