<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Result</title>
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
            height: 100vh;
            text-align: center;
        }
        .result-container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 90%;
            max-width: 500px;
        }
        h1 {
            color: #333;
            font-size: 28px;
        }
        h2 {
            color: #333;
            font-size: 24px;
        }
        p {
            color: #555;
            font-size: 18px;
            margin: 10px 0;
        }
        a {
            display: inline-block;
            text-decoration: none;
            background-color: #6abf69; /* Light green background */
            color: #ffffff;
            padding: 12px 20px;
            border-radius: 4px;
            font-size: 16px;
            margin-top: 20px;
            cursor: pointer;
        }
        a:hover {
            background-color: #5aaf5c; /* Slightly darker green on hover */
        }
    </style>
</head>
<body>
    <div class="result-container">
        <h1>Quiz Result</h1>
        <c:choose>
            <c:when test="${score > 6}">
                <h2>Congratulations!</h2>
                <p>Your score is: ${score}</p>
                <p>Great job! You've done very well.</p>
            </c:when>
            <c:otherwise>
                <h2>Try Again!</h2>
                <p>Your score is: ${score}</p>
                <p>Best of luck next time. Keep practicing!</p>
            </c:otherwise>
        </c:choose>
        <a href="/listquiz">Back to Home</a>
    </div>
</body>
</html>
