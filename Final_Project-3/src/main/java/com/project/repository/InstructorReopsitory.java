package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.controller.Instructor;

public interface InstructorReopsitory extends JpaRepository<Instructor, Integer> 
{
	Instructor findByEmail(String email);
}
