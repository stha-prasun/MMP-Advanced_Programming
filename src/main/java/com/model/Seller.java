package com.model;

import java.time.LocalDateTime;

public class Seller {
    private Long Id;
    private String Mail;
    private String password;
    private LocalDateTime createdAt;

    public Seller(String password, String Mail, Long Id) {
        this.password = password;
        this.Mail = Mail;
        this.Id = Id;
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
}
