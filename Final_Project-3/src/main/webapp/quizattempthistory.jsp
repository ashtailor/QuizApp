<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quiz Attempt History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://cdn.serc.carleton.edu/images/integrate/workshops/eer2015/globe_book.v2.webp') no-repeat center center fixed;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .container {
            width: 80%;
            max-width: 1200px;
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin: 20px auto;
        }
        h1 {
            background-color: #6abf69; /* Green background */
            color: #ffffff; /* White text */
            font-size: 24px;
            font-weight: bold;
            padding: 15px;
            border-radius: 10px;
            margin: 0;
            text-align: center; /* Center the text */
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px; /* Space above the table */
        }
        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #6abf69; /* Lighter green background */
            color: #ffffff;
            font-size: 18px;
        }
        td {
            background-color: #f9f9f9; /* Light grey background */
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Quiz Attempt History</h1>
        <table>
            <thead>
                <tr>
                    <th>Quiz Name</th>
                    <th>Score</th>
                    <th>Attempt Date</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="history" items="${historyData}">
                    <tr>
                        <td>${history.quizName}</td>
                        <td>${history.score}</td>
                        <td>${history.attemptDate}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
