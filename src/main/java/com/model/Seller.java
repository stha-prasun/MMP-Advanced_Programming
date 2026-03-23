package com.model;

import com.model.enums.Role;

import java.time.LocalDateTime;

public class Seller {
    private Long Id;
    private String Mail;
    private String password;
    private LocalDateTime createdAt;
    private Role role;

    public Seller(String password, String Mail, Long Id, Role role) {
        this.password = password;
        this.Mail = Mail;
        this.Id = Id;
        this.role=role;
    }

    public Seller() {
    }

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        this.Id = id;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String mail) {
        this.Mail = mail;
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
