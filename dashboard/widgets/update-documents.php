<?php
include '../functions/get-user-information.php';
?>
<div class="container-fluid">
	<div class="row">
	<div class="col-md-12">
	<div class="card">
     <div class="card-header">
     <h4><img src="../docs/athlete/<?php echo $personal_photo;?>" style="height:30px;width:30px;" class="rounded-circle"> Documents Update</h4>
     </div>
     <div class="card-body">
     <div class="row">
	<div class="col-md-6">
     <form id="form-idfront" action="idfront.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">National ID (Front)</label>
     <div id="preview"><img src="../docs/athlete/<?php echo $national_id_front;?>" style="height:100px;" class="img-thumbnail"></div>
     <input id="uploadImage" type="file" accept="image/*" name="idfront-image" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="err" style="color:red"></div>
      </div>
    </form>
     	</div>
     	<div class="col-md-6">
     	 <form id="form-idback" action="idback.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">National ID (Back)</label>
     <div id="previewb"><img src="../docs/athlete/<?php echo $national_id_back;?>" style="height:100px;" class="img-thumbnail"></div>
     <input type="file" accept="image/*" name="idback-image" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="errback" style="color:red"></div>
      </div>
    </form>
     	</div>
     	</div>

     	<div class="row">
     	<div class="col-md-6">
     	 <form id="form-birth" action="birth-cert.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">Birth Cert</label>
     <div id="preview_birth"><img src="../docs/athlete/<?php echo $birth_certificate;?>" style="height:100px;" class="img-thumbnail"></div>
     <input type="file" accept="image/*" name="birth-image" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="errbirth" style="color:red"></div>
      </div>
    </form>
     	</div>
	<div class="col-md-6">
     <form id="form-student" action="student-id.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">Student ID</label>
     <div id="preview_student"><img src="../docs/athlete/<?php echo $student_id;?>" style="height:100px;" class="img-thumbnail"></div>
     <input  type="file" accept="image/*" name="student-id" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="err_student" style="color:red"></div>
      </div>
    </form>
     	</div>
     	
     	</div>

     	<div class="row">
     	<div class="col-md-6">
     	 <form id="form-high" action="high-school.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">High School Cert</label>
     <div id="preview_high"><img src="../docs/athlete/<?php echo $high_school_cert;?>" style="height:100px;" class="img-thumbnail"></div>
     <input type="file" accept="image/*" name="high-image" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="errhigh" style="color:red"></div>
      </div>
    </form>
     	</div>
	<div class="col-md-6">
     <form id="form-nhif" action="nhif.php" method="post" enctype="multipart/form-data">
     <div class="form-group">
     <label for="email">NHIF Card</label>
     <div id="preview_nhif"><img src="../docs/athlete/<?php echo $nhif_photo;?>" style="height:100px;" class="img-thumbnail"></div>
     <input  type="file" accept="image/*" name="nhif" />
     <input class="btn btn-success btn-sm" type="submit" value="Update">
     <div id="err_nhif" style="color:red"></div>
      </div>
    </form>
     	</div>
     	
     	</div>
     </div>
     </div>
		
	</div>
		
	</div>
</div>
<script>
  $(document).ready(function (e) {
  	//..............................id front
 $("#form-idfront").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "idfront.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#err").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#err").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#preview").html(data).fadeIn();
     $("#form-idfront")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#err").html(e).fadeIn();
      }          
    });
 }));

 //..................................id back
 $("#form-idback").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "idback.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#errback").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#errback").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#previewb").html(data).fadeIn();
     $("#form-idback")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#errback").html(e).fadeIn();
      }          
    });
 }));

//.................................birth
$("#form-birth").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "birth-cert.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#errbirth").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#errbirth").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#preview_birth").html(data).fadeIn();
     $("#form-birth")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#errbirth").html(e).fadeIn();
      }          
    });
 }));

//.................................student id
$("#form-student").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "student-id.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#err_student").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#err_student").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#preview_student").html(data).fadeIn();
     $("#form-student")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#err_student").html(e).fadeIn();
      }          
    });
 }));

//..........................high school
$("#form-high").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "high-school.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#errhigh").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#errhigh").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#preview_high").html(data).fadeIn();
     $("#form-high")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#errhigh").html(e).fadeIn();
      }          
    });
 }));

//.....................................nhif
$("#form-nhif").on('submit',(function(e) {
  e.preventDefault();
  $.ajax({
         url: "nhif.php",
   type: "POST",
   data:  new FormData(this),
   contentType: false,
         cache: false,
   processData:false,
   beforeSend : function()
   {
    //$("#preview").fadeOut();
    $("#err_nhif").fadeOut();
   },
   success: function(data)
      {
    if(data=='invalid')
    {
     // invalid file format.
     $("#err_nhif").html("Choose new document image to upload !").fadeIn();
    }
    else
    {
     // view uploaded file.
     $("#preview_nhif").html(data).fadeIn();
     $("#form-nhif")[0].reset(); 
    }
      },
     error: function(e) 
      {
    $("#err_nhif").html(e).fadeIn();
      }          
    });
 }));


});
</script>