<?php 
include 'core/init.php'; 
$user=$_SESSION['myEmail'];
date_default_timezone_set('Africa/Nairobi');
$now = new DateTime();
$time = $now->format('H:i');
$date = $now->format('Ymd');
$sql1="SELECT * FROM  athletes WHERE email='$user'";
$result1=mysqli_query($con,$sql1) or die(mysql_error());
while($row=mysqli_fetch_array($result1))
            {
      $athlete_id=$row['athlete_id']; 
            }
$sql="SELECT * FROM events WHERE event_stamp>'$date'";
$result=mysqli_query($con,$sql) or die(mysql_error());
$upcoming=0;
while($row=mysqli_fetch_array($result))
    {
       $name=$row['event_name'];
       $upcoming++;
    }

$sqlev="SELECT * FROM event_applications WHERE athlete_id='$athlete_id'";
$resultev=mysqli_query($con,$sqlev) or die(mysql_error());
$myevents=0;
while($row=mysqli_fetch_array($resultev))
    {
       $athlete_id=$row['athlete_id'];
       $myevents++;
    }    
if(empty($user)=== true){
  ?>
  <script>
  document.location.href='../';
  </script>
  <?php
} else {
?>
<!DOCTYPE html>
<html>
  <?php include 'widgets/top-scripts.php';?>
<body class="hold-transition sidebar-mini sidebar-collapse layout-footer-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <?php include 'widgets/default-top-navigation.php'; ?>
  </nav>
  <!-- /.navbar -->
  <?php include 'widgets/side-bar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="all-main-contents">
    <!-- Content Header (Page header) -->
  <?php
   include 'widgets/main-body.php';

  ?>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <?php include 'widgets/footer.php'; ?>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
</body>
</html>
<?php
} 
include 'widgets/bottom-script.php';
?>

<script>
  $(function(){
    $('#view-profile').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/view-profile.php');
    });
    $('#upcoming-events').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/view-upcoming-events.php');
    });
    $('#my-events').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/my-events.php');
    });

     $('#view-upcoming-event').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/view-upcoming-events.php');
    });
    $('#view-my-event').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/my-events.php');
    });

    $('#docs-update').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    });

    $('#view-all-documents').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    });

    $('#settingss').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/account-settings.php');
    });      

});

</script>


