<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
        }

        #feedback-form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        .star-rating {
            font-size: 24px;
            cursor: pointer;
            display: inline-block;
        }

        .star-rating:hover,
        .star-rating.checked {
            color: orange;
        }

        #feedback-message {
            width: 100%;
            height: 80px;
            margin-top: 10px;
        }

        #submit-button {
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <%@ include file="Navbar.jsp" %><br/><br/><br/><br/>
    <div class="container">
        <div id="feedback-form">
            <h2>Please rate your experience</h2>
            
            <!-- Star Ratings -->
            <div>
                <span class="star-rating" onclick="rate(1)">★</span>
                <span class="star-rating" onclick="rate(2)">★</span>
                <span class="star-rating" onclick="rate(3)">★</span>
                <span class="star-rating" onclick="rate(4)">★</span>
                <span class="star-rating" onclick="rate(5)">★</span>
            </div>

            <!-- Feedback Message -->
            <textarea id="feedback-message" placeholder="Leave your feedback..."></textarea>

            <!-- Submit Buttons -->
            <button class="btn btn-success" id="submit-button" onclick="submitFeedback()">Submit</button>
            <button class="btn ml-5" id="submit-button" onclick="window.location.href='index.jsp'">Cancel</button>
        </div>
    </div>

    <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
    <%@ include file="Footer.jsp" %>
</body>
</html>
