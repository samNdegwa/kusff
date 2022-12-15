<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

    <title>KUSF | Login</title>
  <link rel="shortcut icon" href="dashboard/assets/img/logo.PNG" type="image/png">
  </head>
  <body class="form-02-main">
    <section>
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="_lk_de">
              <div class="form-03-main">
                <div class="logo">
                  <img class="profile-img-card rounded-circle" src="dashboard/assets/img/kusa-west.jpg"><br>
                  
                </div>
                <div id="error" style="color:red;"></div>
                <form class="form-signin" method="post" id="login-form" name="login">
                <div class="form-group">
                  <input type="email" name="email" id="inputEmail" class="form-control _ge_de_ol" type="text" placeholder="Enter Email" required="" aria-required="true">
                </div>

                <div class="form-group">
                  <input type="password" name="password" id="inputPassword" class="form-control _ge_de_ol" type="text" placeholder="Enter Password" required="" aria-required="true">
                </div>

                <div class="form-group">
                  <button class="btn btn-lg btn-primary btn-block btn-signin" id="login-id" type="submit"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign in</button>
                  
                </div>
                Don't have Account? <a href="registration.php" style="color:blue">Create Account</a>
                </form>

              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
<script>
  $(document).ready(function(){
      $('#login-form').submit(function(e){
        e.preventDefault();
        attemptLogin();
      });
     });

     function attemptLogin(){
          var username = $('#inputEmail').val();
          var password = $('#inputPassword').val();

          var json = JSON.stringify([username,password]);
          $('#login-form button').html('<i class="fa fa-pulse fa-refresh"></i> Signing in');
          $.post('dashboard/core/login.php',
          {
            data:json
          },function(data,status){
             $('#login-form button').html('<i class="fa fa-lock"></i> Sign in ');
             if(data ==='success'){
              $('#login-form button').html('<i class="fa fa-pulse fa-refresh"></i> Redirecting ');
              document.location.href='dashboard';
             }
             if (data === 'wrong')
             {

              document.getElementById('error').innerHTML='Ooops! Wrong Email/Password';
             }
             if (data === 'empty') {
              
              document.getElementById('error').innerHTML='Ooops! Wrong Email/Password';
             }
          }
          );

        }

</script>