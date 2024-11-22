package com.example.webpro_quiz2;

public class Participant {
    private int id;
    private String name;
    private String email;
    private String phone;
    private int competitionId;
    private String competitionName;

    // Constructor
    public Participant(int id, String name, String email, String phone, int competitionId, String competitionName) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.competitionId = competitionId;
        this.competitionName = competitionName;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public int getCompetitionId() { return competitionId; }
    public void setCompetitionId(int competitionId) { this.competitionId = competitionId; }

    public String getCompetitionName() { return competitionName; }
    public void setCompetitionName(String competitionName) { this.competitionName = competitionName; }
}
