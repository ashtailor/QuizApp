package com.project.controller;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.stereotype.Controller;

@Entity
public class Quiz 
{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	String name;
	String description;
	@OneToMany(mappedBy = "quiz")
	List<QuizQuestion> questions; 
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<QuizQuestion> getQuestions() {
		return questions;
	}
	public void setQuestions(List<QuizQuestion> questions) {
		this.questions = questions;
	}
	@Override
	public String toString() {
		return "Quiz [name=" + name + ", description=" + description + "]";
	}
	

}
