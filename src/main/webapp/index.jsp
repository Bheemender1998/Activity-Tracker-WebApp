<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activity Tracker</title>

    <!-- Link to CSS file in the same folder -->
    <link rel="stylesheet" href="styles.css">

    <!-- jQuery Library -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <button id="darkModeToggle">Toggle Dark Mode</button>
    <h2>My Activities</h2>
    <p>Created by Bheemender Gurram</p>

    <form id="addActivityForm">
        <input type="text" id="activity" name="activity" placeholder="Enter activity..." required>
        <button type="submit">Add Activity</button>
    </form>

    <h3>Activity History</h3>
    <ul id="activityList"></ul>

    <!-- Link to JavaScript file in the same folder -->
    <script src="script.js"></script>

</body>
</html>