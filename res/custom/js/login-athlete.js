$(document).ready(function () {
    $('#login-form').submit(function (e) {
        e.preventDefault();
        attemptLogin();
    });
});

function attemptLogin() {
    $('#login-form .login-wrap button').html('<i class="spinner-border spinner-border-sm"></i> SIGNING IN');
    var username = $('#login-form .login-wrap input:eq(0)').val();
    var password = $('#login-form .login-wrap input:eq(1)').val();
    var json = JSON.stringify([username, password]);
    $.post("core/techfy_athlete.php", {
        techfy: 'attemptLogin',
        data: json
    }, function (data, status) {
        var i = $('#login-form .login-wrap button').html('<i class="fa fa-lock"></i> SIGN IN');
        if (data === 'success') {
            $('#login-form .login-wrap button').html('<i class="spinner-border spinner-border-sm"></i> REDIRECTING');
            document.location.href = 'athlete-portal';
        } else {
            alert('Invalid username/password. Please try again\n' + data);
        }
    });
}