$(document).ready(function() {
   $("#username").blur(function() {
       $.get("register?action=checkUsername&username=" + $("#username").val(), function(response) {
           document.getElementById("username_message").innerHTML = response;
       });
   });
});

