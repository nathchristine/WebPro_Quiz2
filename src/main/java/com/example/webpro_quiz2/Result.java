package com.example.webpro_quiz2;

public class Result {
    private int id;
    private int score;
    private int competitionId;
    private int participantId;

    // Constructor
    public Result(int id, int score, int competitionId, int participantId) {
        this.id = id;
        this.score = score;
        this.competitionId = competitionId;
        this.participantId = participantId;
    }

    // Getters
    public int getId() {
        return id;
    }

    public int getScore() {
        return score;
    }

    public int getCompetitionId() {
        return competitionId;
    }

    public int getParticipantId() {
        return participantId;
    }

    // Setters
    public void setId(int id) {
        this.id = id;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void setCompetitionId(int competitionId) {
        this.competitionId = competitionId;
    }

    public void setParticipantId(int participantId) {
        this.participantId = participantId;
    }
}

