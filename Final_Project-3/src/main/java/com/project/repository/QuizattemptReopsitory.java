package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.controller.Quizattempt;

public interface QuizattemptReopsitory extends JpaRepository<Quizattempt, Integer> 
{
	List<Quizattempt> findByStudentId(int studentId);
}
