<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${quiz.name}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://cdn.serc.carleton.edu/images/integrate/workshops/eer2015/globe_book.v2.webp') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            width: 100vw;
            overflow: auto; /* Allows scrolling if content exceeds viewport height */
        }
        .container {
            background-color: rgba(255, 255, 255, 0.95); /* Slightly less transparent white background */
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            width: 90%;
            max-width: 1000px;
            padding: 30px;
            box-sizing: border-box;
            overflow: auto; /* Allows scrolling if content exceeds container height */
        }
        .quiz-header {
            background-color: rgba(106, 191, 105, 0.8); /* Light green background with transparency */
            color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .quiz-header h1 {
            font-size: 36px;
            margin: 0;
        }
        .quiz-header p {
            font-size: 20px;
            margin: 10px 0 0;
        }
        .question {
            margin-bottom: 30px;
            padding: 15px;
            border-radius: 8px;
            background-color: #f9f9f9;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .question h3 {
            font-size: 22px;
            color: #333;
            margin: 0 0 15px 0;
        }
        .options {
            margin: 10px 0;
            font-size: 16px;
            color: #555;
        }
        .options input[type="radio"] {
            margin-right: 10px;
        }
        .submit-button {
            background-color: #4caf50; /* Green background */
            color: #ffffff;
            border: none;
            border-radius: 6px;
            padding: 15px 30px;
            font-size: 18px;
            cursor: pointer;
            align-self: center;
            margin-top: 20px;
        }
        .submit-button:hover {
            background-color: #45a049; /* Slightly darker green on hover */
        }
        hr {
            border: none;
            border-top: 1px solid #ddd;
            margin: 30px 0;
        }
        @media (max-width: 768px) {
            .quiz-header h1 {
                font-size: 28px;
            }
            .quiz-header p {
                font-size: 16px;
            }
            .question h3 {
                font-size: 20px;
            }
            .options {
                font-size: 14px;
            }
            .submit-button {
                font-size: 16px;
                padding: 12px 20px;
            }
        }
        @media (max-width: 480px) {
            .container {
                padding: 20px;
            }
            .quiz-header h1 {
                font-size: 24px;
            }
            .quiz-header p {
                font-size: 14px;
            }
            .question h3 {
                font-size: 18px;
            }
            .options {
                font-size: 12px;
            }
            .submit-button {
                font-size: 14px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="quiz-header">
            <h1>${quiz.name}</h1>
            <p>${quiz.description}</p>
        </div>
        <form action="submitQuiz" method="post">
            <input type="hidden" name="quizid" value="${quiz.id}"/>
            <c:forEach var="question" items="${quiz.questions}" varStatus="status">
                <div class="question">
                    <h3>Question ${status.index + 1}: ${question.questionName}</h3>
                    <div class="options">
                        <input type="radio" name="question_${question.id}" value="${question.option1}" required> ${question.option1}<br>
                        <input type="radio" name="question_${question.id}" value="${question.option2}" required> ${question.option2}<br>
                        <input type="radio" name="question_${question.id}" value="${question.option3}" required> ${question.option3}<br>
                        <input type="radio" name="question_${question.id}" value="${question.option4}" required> ${question.option4}<br>
                        <input type="hidden" name="answer_${question.id}" value="${question.correctOption}"/>
                    </div>
                </div>
                <hr>
            </c:forEach>
            <button type="submit" class="submit-button">Submit Quiz</button>
        </form>
    </div>
</body>
</html>
