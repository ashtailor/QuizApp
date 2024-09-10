<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quiz</title>
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
            max-height: 90vh;
            overflow: hidden;
        }
        h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }
        form {
            display: flex;
            flex-direction: column;
            flex: 1;
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
            margin: 10px 0;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: #5aaf5c; /* Slightly darker green on hover */
        }
        .scrollable-section {
            overflow-y: auto;
            flex: 1;
            margin-top: 20px;
            padding-right: 10px;
        }
        .question-container {
            margin-bottom: 20px;
        }
    </style>
    <script type="text/javascript">
        var i = 0;
        function addQuestion() {
            var quest = document.getElementById("questSession");

            // Create a container for the new question and options
            var questionContainer = document.createElement("div");
            questionContainer.classList.add("question-container");

            // Add the input fields for the question and options
            questionContainer.innerHTML = `
                <input type="text" name="questions[` + i + `].questionName" placeholder="Type your question" required="required"> 
                <input type="text" name="questions[` + i + `].option1" placeholder="Option 1" required="required">
                <input type="text" name="questions[` + i + `].option2" placeholder="Option 2" required="required">
                <input type="text" name="questions[` + i + `].option3" placeholder="Option 3" required="required">
                <input type="text" name="questions[` + i + `].option4" placeholder="Option 4" required="required">
            `;

            // Append the new question container to the questSession div
            quest.appendChild(questionContainer);

            i++;
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Create Quiz</h1>
        <form action="/save" method="post" id="quizForm">
            <input type="text" name="name" placeholder="Quiz Name" required="required">
            <input type="text" name="description" placeholder="Quiz Description" required="required">
            <button type="button" onclick="addQuestion()">Add Question</button>

            <div id="questSession" class="scrollable-section">
                <!-- Questions will be added here dynamically -->
            </div>

            <button type="submit">Save Quiz</button>
        </form>
    </div>
</body>
</html>
