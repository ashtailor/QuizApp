<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Quiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('https://cdn.serc.carleton.edu/images/integrate/workshops/eer2015/globe_book.v2.webp') no-repeat center center fixed;
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            width: 100vw;
        }
        .container {
            background-color: rgba(255, 255, 255, 0.9); /* Slightly transparent white background */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 80%;
            max-width: 1200px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            height: 90vh;
            overflow: hidden;
        }
        .form-header {
            margin-bottom: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
            font-size: 24px;
        }
        form {
            display: flex;
            flex-direction: column;
            height: 100%;
            overflow: hidden;
        }
        input[type="text"] {
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
        }
        button {
            background-color: #6abf69; /* Lighter green background */
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            margin: 0 5px;
            width: 100%;
            box-sizing: border-box;
        }
        button:hover {
            background-color: #5aaf5c; /* Slightly darker green on hover */
        }
        .scrollable-section {
            flex: 1;
            overflow-y: auto;
            padding-bottom: 20px;
        }
        .update-button {
            background-color: #6abf69; /* Light green background */
            color: #ffffff;
            border: none;
            border-radius: 4px;
            padding: 12px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box;
        }
        .update-button:hover {
            background-color: #5aaf5c; /* Slightly darker green on hover */
        }
    </style>
    <script type="text/javascript">
        var i = ${fn:length(data.questions)}; 
        function addQustion() {
            var quest = document.getElementById("questSession");
            var textbox = `
                <input type="text" name="questions[` + i + `].questionName" placeholder="Type the question" required="required"> 
                <br><br>
                <input type="text" name="questions[` + i + `].option1" placeholder="Option 1" required="required">
                <br><br>
                <input type="text" name="questions[` + i + `].option2" placeholder="Option 2" required="required">
                <br><br>
                <input type="text" name="questions[` + i + `].option3" placeholder="Option 3" required="required">
                <br><br>
                <input type="text" name="questions[` + i + `].option4" placeholder="Option 4" required="required">
                <br><br>`;
            quest.innerHTML += textbox;
            i++;
        }
    </script>
</head>
<body>
    <div class="container">
        <div class="form-header">
            <h1>Update Quiz</h1>
        </div>
        <form action="updatequiz" method="post">
            <input type="hidden" name="id" value="${data.id}">
            <input type="text" name="name" placeholder="Type of quiz" value="${data.name}" required="required">
            <input type="text" name="description" placeholder="Type of description" value="${data.description}" required="required">
            
            <button type="button" onclick="addQustion()">Add Question</button>
            
            <div id="questSession" class="scrollable-section">
                <c:forEach var="question" items="${data.questions}" varStatus="status">
                    <input type="text" placeholder="Type the question" required="required" name="questions[${status.index}].questionName" value="${question.questionName}">
                    <input type="text" placeholder="Option 1" required="required" name="questions[${status.index}].option1" value="${question.option1}">
                    <input type="text" placeholder="Option 2" required="required" name="questions[${status.index}].option2" value="${question.option2}">
                    <input type="text" placeholder="Option 3" required="required" name="questions[${status.index}].option3" value="${question.option3}">
                    <input type="text" placeholder="Option 4" required="required" name="questions[${status.index}].option4" value="${question.option4}">
                </c:forEach>
            </div>
            <button type="submit" class="update-button">Update</button>
        </form>
    </div>
</body>
</html>
