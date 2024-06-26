<!DOCTYPE html>
<html>
<head>
  <title>Online Examination</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    .container {
      margin-top: 50px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h1>Question:</h1>
    <form id="examForm" method="post" action="./exam/candidateQuestion">
      <div class="form-group">
        <label for="question1">Question 1: What is the capital of France?</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question1" id="question1Option1" value="Paris">
          <label class="form-check-label" for="question1Option1">Paris</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question1" id="question1Option2" value="London">
          <label class="form-check-label" for="question1Option2">London</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question1" id="question1Option3" value="Berlin">
          <label class="form-check-label" for="question1Option3">Berlin</label>
        </div>
      </div>
      
      <div class="form-group">
        <label for="question2">Question 2: What is the largest planet in our solar system?</label>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question2" id="question2Option1" value="Jupiter">
          <label class="form-check-label" for="question2Option1">Jupiter</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question2" id="question2Option2" value="Earth">
          <label class="form-check-label" for="question2Option2">Earth</label>
        </div>
        <div class="form-check">
          <input class="form-check-input" type="radio" name="question2" id="question2Option3" value="Saturn">
          <label class="form-check-label" for="question2Option3">Saturn</label>
        </div>
      </div>
      
      <button type="button" class="btn btn-primary" onclick="submitExam()">Submit</button>
    </form>
  </div>
  
  <script>
    function submitExam() {
      var form = document.getElementById('examForm');
      var answers = [];
      
      // Collect selected answers
      for (var i = 0; i < form.elements.length; i++) {
        var element = form.elements[i];
        if (element.type === 'radio' && element.checked) {
          answers.push({
            question: element.name,
            answer: element.value
          });
        }
      }
      
      // Send answers to the server for evaluation
      // You can use AJAX to send the data to a JSP endpoint for processing
      
      // For demonstration purposes, alert the answers
      alert(JSON.stringify(answers));
    }
  </script>
</body>
</html>
