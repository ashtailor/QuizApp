<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${quiz.name}</title>
</head>
<body>

<div class="quiz-container">
    <h1>${quiz.name}</h1>
    <p>${quiz.description}</p>

    <form action="submitQuiz" method="post">
        <c:forEach var="question" items="${quiz.questions}">
            <div class="question">
                <p class="question-title">${question.questionName}</p>
                <ul class="options">
                    <li>
                        <input type="radio" name="question_${question.id}" value="${question.option1}" required />
                        <label>${question.option1}</label>
                    </li>
                    <li>
                        <input type="radio" name="question_${question.id}" value="${question.option2}" required />
                        <label>${question.option2}</label>
                    </li>
                    <li>
                        <input type="radio" name="question_${question.id}" value="${question.option3}" required />
                        <label>${question.option3}</label>
                    </li>
                    <li>
                        <input type="radio" name="question_${question.id}" value="${question.option4}" required />
                        <label>${question.option4}</label>
                        <input type="hidden" name="answer_${question.id}" value="${question.correctOption}"/>
                    </li>
                </ul>
            </div>
        </c:forEach>
        
        <input type="submit" class="submit-button" value="Submit Quiz" />
    </form>
</div>

</body>
</html>
