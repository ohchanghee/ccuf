<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" >

<head>
  <meta charset="UTF-8">
  <title>Timer</title>
  
  
  <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>

      <link rel="stylesheet" href="/resources/css/Timecss.css">

  
</head>

<body>

      <div class="jumbotron text-center">
        
        <!-- Timer -->

        <div class="timer" style="color:black;">
            <span class="minutes">00</span> : <span class="seconds">00</span>
        </div>        

        <!-- Timer Buttons -->
            <div class="timer-buttons">
                <button class="btn btn-lg btn-success" data-action="start"> <!-- Data- Allows you to create custome HTML elements for Js purposes -->
                    Start
                </button>
                <button class="btn btn-lg btn-danger" data-action="stop">
                    Stop
                </button>
                <button class="btn btn-link btn-block" data-action="reset">
                    Reset
                </button>
            </div>
    </div>
  
  

    <script  src="/resources/js/Timejs.js"></script>




</body>

</html>
