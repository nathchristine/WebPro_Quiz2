package com.example.webpro_quiz2;

import java.util.Date;

public class Competition {
    private int id;
    private String name;
    private String description;
    private Date date;

    public Competition(int id, String name, String description, Date date) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public Date getDate() {
        return date;
    }
}

