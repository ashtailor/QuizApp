package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.controller.QuizQuestion;
import com.project.controller.Student;

public interface StudentReopsitory extends JpaRepository<Student, Integer> 
{
	Student findByEmail(String email);
}
