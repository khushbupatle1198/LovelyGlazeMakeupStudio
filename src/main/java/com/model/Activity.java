package com.model;

import java.util.Date;

public class Activity {
    private String type; // booking, inquiry, confirmation, cancellation
    private String message;
    private Date timestamp;

    // Constructor
    public Activity(String type, String message, Date timestamp) {
        this.type = type;
        this.message = message;
        this.timestamp = timestamp;
    }

    // Getters and Setters
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }
}