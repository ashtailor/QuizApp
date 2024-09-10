package com.project.controller;

import java.sql.Timestamp;
import java.time.Instant;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Quizattempt {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;
    
    private int studentId;
    private int quizId;
    private int score; 
    private Timestamp attemptDate;

    // Default constructor
    public Quizattempt() {}
    
    public Quizattempt(int studentId, int quizId, int score) {
		super();
		this.studentId = studentId;
		this.quizId = quizId;
		this.score = score;
		this.attemptDate=Timestamp.from(Instant.now());
	}

	// Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getQuizId() {
        return quizId;
    }

    public void setQuizId(int quizId) {
        this.quizId = quizId;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
    
    public Timestamp getAttemptDate() {
		return attemptDate;
	}

	public void setAttemptDate(Timestamp attemptDate) {
		this.attemptDate = attemptDate;
	}

	@Override
    public String toString() {
        return "Quizattempt [id=" + id + ", studentId=" + studentId + ", quizId=" + quizId + ", score=" + score + "]";
    }
}
