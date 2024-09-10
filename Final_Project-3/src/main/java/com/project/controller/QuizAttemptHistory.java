package com.project.controller;

import java.sql.Timestamp;

public class QuizAttemptHistory {
    
	private String quizName;
    private int score; 
    private Timestamp attemptDate;
	
    public QuizAttemptHistory(String quizName, int score, Timestamp attemptDate) {
		super();
		this.quizName = quizName;
		this.score = score;
		this.attemptDate = attemptDate;
	}

	public String getQuizName() {
		return quizName;
	}

	public int getScore() {
		return score;
	}

	public Timestamp getAttemptDate() {
		return attemptDate;
	}

    
}
