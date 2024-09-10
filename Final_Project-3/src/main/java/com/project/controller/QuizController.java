package com.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.repository.InstructorReopsitory;
import com.project.repository.QuestionReopsitory;
import com.project.repository.QuizRepository;
import com.project.repository.QuizattemptReopsitory;
import com.project.repository.StudentReopsitory;

@Controller
public class QuizController {
	@Autowired
	QuizRepository quizRepository;
	@Autowired
	QuestionReopsitory questionReopsitory;

	@Autowired
	StudentReopsitory studentReopsitory;
	@Autowired
	InstructorReopsitory instructorReopsitory;
	@Autowired
	QuizattemptReopsitory quizattemptReopsitory;

	@RequestMapping("/create")
	public String createQuiz() {
		return "createQuiz.jsp";
	}

	@RequestMapping("/save")
	public String saveQuiz(@ModelAttribute Quiz quiz) {
		// System.out.println("***********"+quiz);
		quizRepository.save(quiz);
		for (QuizQuestion q : quiz.getQuestions()) {
			q.setQuiz(quiz);
		}
		questionReopsitory.saveAll(quiz.getQuestions());
		return "success.jsp";
	}

	@RequestMapping("/listquiz")
	public String listQuiz(Model m) {
		List<Quiz> quiz = quizRepository.findAll();
		m.addAttribute("data", quiz);
		return "listquiz.jsp";
	}

	@RequestMapping("/viewordelete")
	public String viewOrDelete(@RequestParam String action, @RequestParam int id) {
		if (action.equals("view")) {
			return "redirect:/viewquizdetails?id=" + id;
		} else if (action.equals("try")) {
			return "redirect:/test?id=" + id;
		} else {
			Quiz quiz = quizRepository.getById(id);
			List<Integer> questionIds = quiz.getQuestions().stream().map(q -> q.getId()).toList();
			questionReopsitory.deleteAllById(questionIds);
			quizRepository.deleteById(id);
			return "redirect:/listquiz";
		}

	}

	@RequestMapping("/viewquizdetails")
	public String viewQuiz(@RequestParam int id, Model m)// model->
	{
		Optional<Quiz> quiz = quizRepository.findById(id);//
		m.addAttribute("data", quiz.get());
		return "quizdetails.jsp";
	}

	@RequestMapping("/updatequiz")
	public String requestMethodName(@ModelAttribute Quiz quiz) {
		quiz.getQuestions().forEach(q -> q.setQuiz(quiz));
		questionReopsitory.saveAll(quiz.getQuestions());
		quizRepository.save(quiz);
		return "success.jsp";
	}

	@RequestMapping(value = "/showQuiz", method = RequestMethod.GET)
	public String showQuiz(@RequestParam("id") int id, Model model) {
		Quiz quiz = quizRepository.findById(id).orElse(null);
		model.addAttribute("quiz", quiz);
		return "quiz";
	}

	@RequestMapping("/test")
	public String testQuiz(@RequestParam("id") int id, Model model) {
		Quiz quiz = quizRepository.findById(id).get();
		model.addAttribute("quiz", quiz);
		return "test.jsp";
	}

	@RequestMapping("/loginform")
	public String showLoginPage() {
		return "studentlogin.jsp";
	}

	@PostMapping("/login")
	public String loginStudent(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model, HttpSession session) {
		Student student = studentReopsitory.findByEmail(email);
		if (student != null && student.getPassword().equals(password)) {
			session.setAttribute("studentId", student.getId());
			session.setAttribute("role", "student");
			return "redirect:/listquiz";
		} else {
			// Login failed, show error message
			model.addAttribute("errorMessage", "Invalid email or password");
			return "studentlogin.jsp";
		}
	}

	@RequestMapping("/instructorloginform")
	public String showInstructorLoginPage() {
		return "instructorlogin.jsp";
	}

	@PostMapping("/loginInstructor")
	public String loginInstructor(@RequestParam("email") String email, @RequestParam("password") String password,
			Model model, HttpSession session) {
		Instructor instructor = instructorReopsitory.findByEmail(email);

		if (instructor != null && instructor.getPassword().equals(password)) {
			session.setAttribute("instructorId", instructor.getId());
			session.setAttribute("role", "instructor");
			return "redirect:/listquiz";
		} else {
			// Login failed, show error message
			model.addAttribute("errorMessage", "Invalid email or password");
			return "instructorlogin.jsp";
		}
	}

	@PostMapping("/submitQuiz")
	public String submitQuiz(@RequestParam Map<String, String> answers, HttpSession session, Model m) {
		System.out.println(answers);
		AtomicInteger score = new AtomicInteger(0);

		answers.keySet().stream().filter(key -> key.startsWith("question_")).forEach(key -> {
			String selectedAnswer = answers.get(key);
			String number = key.split("_")[1];
			String correctAnswer = answers.get("answer_" + number);

			if (selectedAnswer != null && selectedAnswer.equals(correctAnswer)) {
				score.incrementAndGet();
			}
		});

		int studentId = (int) session.getAttribute("studentId");
		Quizattempt quizattempt = new Quizattempt(studentId, Integer.valueOf(answers.get("quizid")), score.intValue());
		quizattemptReopsitory.save(quizattempt);
		m.addAttribute("score", score);
		return "result.jsp";
	}

	@RequestMapping("/showhistory")
	public String showHistory(HttpSession session, Model m) {
		int studentId = (int) session.getAttribute("studentId");
		List<Quizattempt> quizattempts = quizattemptReopsitory.findByStudentId(studentId);
		m.addAttribute("data", quizattempts);
		List<Integer> quizIds = quizattempts.stream().map(Quizattempt::getQuizId).collect(Collectors.toList());

		List<Quiz> quizlist = quizRepository.findAllById(quizIds);
		Map<Integer, String> quizMap = quizlist.stream().collect(Collectors.toMap(Quiz::getId, Quiz::getName));

		List<QuizAttemptHistory> historyList = new ArrayList<>();

		for (Quizattempt attempt : quizattempts) {
			String quizname = quizMap.get(attempt.getQuizId());

			QuizAttemptHistory history = new QuizAttemptHistory(quizname, attempt.getScore(), attempt.getAttemptDate());
			historyList.add(history);
		}

		 m.addAttribute("historyData", historyList);

		 return "quizattempthistory.jsp";

	}
}
