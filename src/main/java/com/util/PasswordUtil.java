package com.util;

import org.mindrot.jbcrypt.BCrypt;

/**
 * Utility class for creating and checking hashed password from the users entered password
 *
 * BCrypt hash function is used for password hashing. It becomes slower and more secure
 * relative to the computational cost
 *
 * **/
public class PasswordUtil {

    //The computational cost factor for BCrypt hashing. 2 to the power 10 provides balance between speed and security
    private static final int COST = 10;

    /**
     * Generates a BCrypt hash from a plain text password.
     *
     * @param password the plain text password to hash (should not be null or empty).
     *
     * @return a hashed password, salt pattern.
     * **/
    public static String getHashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt(COST));
    }

    /**
     * Verifies that the entered text matches stored hash
     *
     * @param input the plain text entered.
     * @param storedHash the hash that is stored in the database
     *
     * @return {@code true} if the entered password matches the stored hash,
     *          {@code false} if it doesn't match
     * **/
    public static boolean checkPassword(String input, String storedHash) {
        return BCrypt.checkpw(input, storedHash);
    }
}