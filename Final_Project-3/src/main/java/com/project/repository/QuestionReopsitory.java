package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.controller.QuizQuestion;

public interface QuestionReopsitory extends JpaRepository<QuizQuestion, Integer> 
{

}
