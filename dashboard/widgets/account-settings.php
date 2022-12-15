<?php
include '../functions/get-user-information.php';
?>
<div class="container-fluid">
<div class="row">
<div class="col-md-12">
<div class="card">
  <h5 class="card-header">Account Settings</h5>
  <div class="card-body" style="text-align:center;">
       <div id="previewp">
       <img src="../docs/athlete/<?php echo $personal_photo;?>" style="height:100px;" class="rounded-circle">
       </div>
        <br><br>
       <form id="form-photo" action="photo.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">Change Photo</label>
     <input id="uploadImage" type="file" accept="image/*" name="photo-image" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="errp" style="color:red"></div>
      </div>
    </form>

    <button class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#settingModal"><i class="fa fa-key" aria-hidden="true"></i> Change Password</button>
  </div>
</div>
	
</div>
	
</div>
	
</div>

<!--View Modal -->
<div class="modal fade" id="settingModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
        <b>Change Password</b>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <form id="password-data-form">
  <div class="form-group">
    <label for="exampleInputPassword1">Old Password</label>
    <input type="password" class="form-control" id="old_password" required="">
  </div>

    <div class="form-group">
    <label>New Password</label>
    <input type="password" class="form-control" id="new_password" required="">
  </div>

  <div class="form-group">
    <label>Confirm New Password</label>
    <input type="password" class="form-control" id="confirm_password" required="">
  </div>
  <button type="submit" class="btn btn-primary">Save</button>
</form>
       
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<script>
  $(document).ready(function (e) {
    $("#password-data-form").on('submit',(function(e) {
         e.preventDefault();
         attemptSubmitLocation();
      }));
    //..............................id front
 $("#form-photo").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "photo.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#errp").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#errp").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#previewp").html(data).fadeIn();
     $("#form-photo")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#errp").html(e).fadeIn();
      }          
    });
 }));
 });

  function attemptSubmitLocation(){
    var old = $('#old_password').val();
    var newp = $('#new_password').val();
    var cnewp = $('#confirm_password').val();
    
    var json = JSON.stringify([old,newp,cnewp]);

    $('#password-data-form button').html('<i class="fa fa-pulse fa-refresh"></i> Submitting...');
     $.post('functions/account-settings.php',
          {
            data:json
          },function(data,status){
            if(data ==='success'){
              $('#password-data-form button').html('<span class="fa fa-send-o"></span> Save');
             
                 Toastify({ 
                    text: "Success!\n Password changed Successifully",
                    duration: 6000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #00b09b, #96c93d)",
                     }
                }).showToast();
                 //$('#settingModal').modal().hide();
             }

             if(data ==='wrong'){
              $('#password-data-form button').html('<span class="fa fa-send-o"></span> Save');
             
                 Toastify({ 
                    text: "Error!\n Wrong password",
                    duration: 6000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #E64134, #96c93d)",
                     }
                }).showToast();
             }

               if(data ==='unmatch'){
              $('#password-data-form button').html('<span class="fa fa-send-o"></span> Save');
             
                 Toastify({ 
                    text: "Error!\n Passwords didn't match",
                    duration: 6000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #E64134, #96c93d)",
                     }
                }).showToast();
             }
          }
          );
   }
</script>


