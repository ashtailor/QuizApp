<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz List</title>
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
        table {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 1200px;
            margin: 20px auto;
            border-collapse: collapse;
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
        button {
            background-color: #6abf69; /* Lighter green background */
            color: #ffffff;
            border: none;
            border-radius: 5px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 5px;
        }
        button:hover {
            background-color: #5aaf5c; /* Slightly darker green on hover */
        }
        .actions {
            width: 80%;
            max-width: 1200px;
            display: flex;
            justify-content: flex-end;
            margin: 10px 0;
        }
        .actions.form-container {
            justify-content: space-between; /* Align buttons on opposite sides */
        }
    </style>
</head>
<body>
    <c:if test="${sessionScope.role == 'instructor'}">
        <div class="actions">
            <form action="create">
                <button type="submit">Add Quiz</button>
            </form>
        </div>
    </c:if>

    <!-- Quiz Attempts button for students -->
    <c:if test="${sessionScope.role == 'student'}">
        <div class="actions form-container">
            <form action="showhistory">
                <button type="submit">View Quiz Attempts</button>
            </form>
        </div>
    </c:if>
    
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Description</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="quiz" items="${data}">
                <form action="viewordelete" method="post">
                    <tr>
                        <td>${quiz.name}</td>
                        <td>${quiz.description}</td>
                        <td>
                            <input type="hidden" name="id" value="${quiz.id}">
                            <c:choose>
                                <c:when test="${sessionScope.role == 'instructor'}">
                                    <button type="submit" name="action" value="view">View</button>
                                    <button type="submit" name="action" value="delete">Delete</button>
                                </c:when>
                                <c:otherwise>
                                    <button type="submit" name="action" value="try">Try Quiz</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </form>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
