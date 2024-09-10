package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.controller.Quiz;

public interface QuizRepository extends JpaRepository<Quiz, Integer>
{

}
