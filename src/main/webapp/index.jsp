<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Activity Tracker</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            loadActivities();

            $("#addActivityForm").submit(function(event) {
                event.preventDefault();
                var activity = $("#activity").val();
                if (activity.trim() !== "") {
                    $.post("ActivityServlet", { action: "add", activity: activity }, function(response) {
                        $("#activity").val("");
                        loadActivities();
                    });
                }
            });
        });

        function loadActivities() {
            $.get("ActivityServlet", { action: "list" }, function(response) {
                $("#activityList").html(response);
            });
        }
    </script>
</head>
<body>
    <h2>My Activities</h2>
    <p>Created by Bheemender Gurram</p>
    <form id="addActivityForm">
        <input type="text" id="activity" name="activity" placeholder="Enter activity..." required>
        <button type="submit">Add Activity</button>
    </form>
    <h3>Activity History</h3>
    <ul id="activityList"></ul>
</body>
</html>
