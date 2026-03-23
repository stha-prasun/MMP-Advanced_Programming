package com.model;

import com.model.enums.Role;

import java.time.LocalDateTime;

public class Customer {
    private Long Id;
    private String Mail;
    private String password;
    private LocalDateTime createdAt;
    private Role role;

    public Customer(Long Id, String Mail, String password, Role role) {
        this.Id = Id;
        this.Mail = Mail;
        this.password = password;
        this.role=role;
    }

    public Customer() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String mail) {
        Mail = mail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
