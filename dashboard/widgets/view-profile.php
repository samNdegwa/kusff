<?php
include '../functions/get-user-information.php';
?>
<div class="container-fluid">
	<div class="row">
	<div class="col-md-12">
	<div class="card">
     <div class="card-header">
     <h4><img src="../docs/athlete/<?php echo $personal_photo;?>" style="height:30px;width:30px;" class="rounded-circle"> My Membership Profile</h4>
     </div>
     <div class="card-body">
     	<table class="table table-striped table-bordered table-sm">
     	<thead class="thead-dark">
     	 <tr>
     	 	<th colspan="2">A. Primary Profile</th>
     	 </tr>
     	 </thead>
     	 <tbody>
     	     <tr>
     	 	<td>Email</td>
     	 	<td><?php echo $email;?></td>
     	 	 </tr>
             <tr>
     	 	<td>First Name</td>
     	 	<td><?php echo $first;?></td>
     	 	</tr>
     	 	<tr>
     	 	<td>Last Name</td>
     	 	<td><?php echo $third;?></td>
     	 	</tr>
     	 	<tr>
     	 		<td>Phone Number</td>
     	 		<td><?php echo $phone;?></td>
     	 	</tr>
     	 	<tr>
     	 	<td>Gender</td>
     	 	<td><?php echo $gender;?></td>
     	 	</tr>
     	 	<tr>
     	 	<td>ID Number</td>
     	 	<td><?php echo $id_number;?></td>
     	 	</tr>
     	 	<tr>
     	 	<td>Position</td>
     	 	<td><?php echo 'Athlete';?></td>
     	 	</tr>
     	 	<thead class="thead-dark">
     	 <tr>
     	 	<th colspan="2">B. Education</th>
     	 </tr>
     	 </thead>
     	 <tr>
     	 	<td>University</td><td><?php echo $college;?></td>
     	 </tr>
     	  <tr>
     	 	<td>Secondary</td><td><?php echo $highschool.'('.$secondary_grade.')';?></td>
     	 </tr>
     	  <tr>
     	 	<td>Primary</td><td><?php echo $primary.'('.$primary_grade.')';?></td>
     	 </tr>
     	 <thead class="thead-dark">
     	 <tr>
     	 	<th colspan="2">C. Sports</th>
     	 </tr>
     	 </thead>
     	 <tr>
     	 	<td>Primary Sport</td><td><?php echo $spot;?></td>
     	 </tr>
     	  <tr>
     	 	<td>Other Sports</td><td><?php echo $other_sports;?></td>
     	 </tr>

            <thead class="thead-dark">
           <tr>
               <th colspan="2">D. Ducuments</th>
           </tr>
           </thead>
           <tr>
               <td>National ID</td>

                <?php
                 if($national_id_front === '--national-id-front--')
                 {
                    ?>
                      <td>Not Available <button class="btn btn-primary btn-sm" id="upload-front-id">Upload?</button></td>
                    <?php

                 } else {
                     ?>
                     <td><img src="../docs/athlete/<?php echo $national_id_front;?>" style="height:100px;" class="img-thumbnail">
                     <img src="../docs/athlete/<?php echo $national_id_back;?>" style="height:100px;" class="img-thumbnail">
                       </td>

                    <?php

                 }
                ?>
           </tr>
           <tr>
               <td>Student ID</td>
               <?php
                 if($student_id === '--student-id--')
                 {
                    ?>
                      <td>Not Available <button class="btn btn-primary btn-sm" id="upload-student-id">Upload?</button></td>
                    <?php

                 } else {
                     ?>
                     <td>
                     <img src="../docs/athlete/<?php echo $student_id;?>" style="height:100px;" class="img-thumbnail">
                     </td>

                    <?php

                 }
                ?>
               
           </tr>
           <tr>
               <td>Birth Cert</td>
                <?php
                 if($birth_certificate === '--birth-certificate--')
                 {
                    ?>
                      <td>Not Available <button class="btn btn-primary btn-sm" id="upload-birth">Upload?</button></td>
                    <?php

                 } else {
                     ?>
                     <td>
               <img src="../docs/athlete/<?php echo $birth_certificate;?>" style="height:100px;" class="img-thumbnail">
               </td>

                    <?php

                 }
                ?>
               
           </tr>
            <tr>
               <td>NHIF</td>
                <?php
                 if($nhif_photo === '--nhif-photo--')
                 {
                    ?>
                      <td>Not Available <button class="btn btn-primary btn-sm" id="upload-nhif">Upload?</button></td>
                    <?php

                 } else {
                     ?>
                     <td>
               <img src="../docs/athlete/<?php echo $nhif_photo;?>" style="height:100px;" class="img-thumbnail">
               </td>

                    <?php

                 }
                ?>
               
           </tr>
           <tr>
               <td>KCSE Cert</td>
                <?php
                 if($high_school_cert === '--high-school-cert--')
                 {
                    ?>
                      <td>Not Available <button class="btn btn-primary btn-sm" id="upload-high">Upload?</button></td>
                    <?php

                 } else {
                     ?>
                     <td>
               <img src="../docs/athlete/<?php echo $high_school_cert;?>" style="height:100px;" class="img-thumbnail">
               </td>

                    <?php

                 }
                ?>
               
           </tr>

     	 
     	 </tbody>
     		
     	</table>
     </div>
     </div>
		
	</div>
		
	</div>
</div>

<script>
  $(function(){
    $('#upload-front-id').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    });

    $('#upload-student-id').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    }); 

    $('#upload-birth').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    }); 

    $('#upload-nhif').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    });

    $('#upload-high').click(function (){
       $('#all-main-contents').html('<i class="fa fa-spinner fa-spin"></i> Opening ...');
        $('#all-main-contents').load('widgets/update-documents.php');
    });   

});

</script>