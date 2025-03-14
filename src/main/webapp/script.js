$(document).ready(function () {
    loadActivities();

    // Add activity to the list
    $("#addActivityForm").submit(function (event) {
        event.preventDefault();
        var activity = $("#activity").val();
        if (activity.trim() !== "") {
            $.post("ActivityServlet", { action: "add", activity: activity }, function (response) {
                $("#activity").val("");
                loadActivities();
            });
        }
    });

    // Dark Mode Toggle
    $("#darkModeToggle").click(function () {
        $("body").toggleClass("dark-mode");
        let mode = $("body").hasClass("dark-mode") ? "dark" : "light";
        localStorage.setItem("theme", mode);
    });

    // Load Dark Mode from Local Storage
    if (localStorage.getItem("theme") === "dark") {
        $("body").addClass("dark-mode");
    }
});

// Load activities from backend
function loadActivities() {
    $.get("ActivityServlet", { action: "list" }, function (response) {
        var activities = JSON.parse(response);
        var activityHtml = "";

        activities.forEach(function (activity, index) {
            activityHtml += `
                <li class="activity-item">
                    ${activity}
                    <button class="delete-btn" onclick="deleteActivity(${index})">❌</button>
                </li>
            `;
        });

        $("#activityList").html(activityHtml);
    });
}

// Delete an activity
function deleteActivity(index) {
    $.post("ActivityServlet", { action: "delete", index: index }, function (response) {
        loadActivities();
    });
}