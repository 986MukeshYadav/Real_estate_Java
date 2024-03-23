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
            margin: 50px;
        }

        #feedback-form {
            max-width: 400px;
            margin: auto;
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
    <form id="feedback-form" method="post" action="FeedbackServlet">
        <h2>Please rate your experience</h2>
        
        <!-- Star Ratings -->
        <div>
            <span class="star-rating" onclick="rate(1)">★</span>
            <span class="star-rating" onclick="rate(2)">★</span>
            <span class="star-rating" onclick="rate(3)">★</span>
            <span class="star-rating" onclick="rate(4)">★</span>
            <span class="star-rating" onclick="rate(5)">★</span>
        </div>

        <!-- Hidden Input Fields for Rating -->
        <input type="hidden" id="rating" name="rating">

        <!-- Feedback Message -->
        <textarea id="feedback-message" name="message" placeholder="Leave your feedback..."></textarea>

        <!-- Submit Button -->
        <button class="btn btn-success" id="submit">Submit</button>
        <button class="btn ml-5" id="submit-button" onclick="window.location.href='index.jsp'">Cancel</button>
    </form>

    <script>
        let selectedRating = 0;

        function rate(rating) {
            selectedRating = rating;
            highlightStars(rating);
            // Set the value of the hidden input field for rating
            document.getElementById('rating').value = rating;
        }

        function highlightStars(count) {
            const stars = document.querySelectorAll('.star-rating');
            stars.forEach((star, index) => {
                star.classList.toggle('checked', index < count);
            });
        }
    </script><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<%@ include file="Footer.jsp" %>
</body> 
</html>