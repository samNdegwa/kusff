<div class="container-fluid">
<div class="row">
<div class="col-md-12">
<div class="card">
  <h5 class="card-header">My Events</h5>
  <div class="card-body">
       <?php
       include '../functions/get-user-information.php';
        date_default_timezone_set('Africa/Nairobi');
      $now = new DateTime();
      $time = $now->format('H:i');
      $date = $now->format('Ymd');
       $sql="SELECT * FROM event_applications WHERE athlete_id='$athlete_id'";
                  $result=mysqli_query($con,$sql) or die(mysql_error());
                  while($row=mysqli_fetch_array($result))
                   {
                       $event_id=$row['event_id'];
                     }
        if (empty($event_id)) {
           echo "<h4> You haven't applied for any event</h4>";
            }             
                else
                {

        $sql="SELECT * FROM event_applications INNER JOIN events ON event_applications.event_id=events.event_id WHERE athlete_id='$athlete_id'";
                  $result=mysqli_query($con,$sql) or die(mysql_error());
                  ?>
               
           <div class="table-responsive">
                 <table class="table table-bordered">
             <thead>    
       <tr>
       <th>Event Name</th>
       <th>Venue</th>
       <th>Date</th>
       <th>Date Applied</th>
       </tr>
       </thead>
                  <?php
                
                  while($row=mysqli_fetch_array($result))
                   {    
                   	  $name=$row['event_name'];
						          $venue=$row['event_venue'];
	                    $date=$row['event_date'];
						          $apply_date=$row['date_applied'];
			
                    ?>
                    <tbody>
						<tr id="tr">			
         <td><?php echo $name;?></td>
         <td><?php echo $venue;?></td>
         <td><?php echo $date;?></td>
         <td><?php echo $apply_date; ?></td>
      
         </tr>
         </tbody>
         
          <?php			
			}
			?>
           </table>
           </div>
          <?php
          }
          ?>
  </div>
</div>
	
</div>
	
</div>
	
</div>

<!--View Modal -->
<div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">
        <b id="quo_code"></b> <b>Payment Slip</b>
        </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <span id="event_id" style="display:none"></span>
      Are you sure you want to apply for:<br>
      <b>Event: </b> <span id="event_y"></span><br>
      <b>Venue: </b><span id="venue_y"></span><br>
      <b>Date: </b><span id="date_y"></span><br>
      <br><br>
      <button class="btn btn-success btn-sm" id="sendApplication">Yes, Apply</button>
       
      </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>

<script>
	 $(function(){
       $('#button-view-event').submit(function(e){
        apply_event();
      });

       $('#sendApplication').click(function(){
        var idev = document.getElementById("event_id").innerHTML;
    	var json = JSON.stringify([idev]);
         $.post('functions/submit-application.php',
                {
                   data:json
                },function(data,status){
                    if (data.replace(/\s/g, "") === 'exist') {
              Toastify({ 
                    text: "Error!\n You have already applied for this event.",
                    duration: 6000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #E64134, #96c93d)",
                     }
                }).showToast();
             } else {
             if (data.replace(/\s/g, "") === 'success') {
                  Toastify({ 
                    text: "Success!\n Application received successifilly",
                    duration: 2000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #00b09b, #96c93d)",
                     }
                }).showToast();

                   } else {
                     Toastify({ 
                    text: "Error!\n Unable to apply. Check your internet connection",
                    duration: 6000,
                    className: "primary",
                   style: {
                       background: "linear-gradient(to right, #E64134, #96c93d)",
                     }
                }).showToast();
                   }
                 }
                  });
      });
     });

     function apply_event(btn){
      var tr = $(btn).parent().parent();
      var eid = $(tr).children('td:eq(0)').html();
      var ename = $(tr).children('td:eq(1)').html();
      var evenue = $(tr).children('td:eq(3)').html();
      var edate = $(tr).children('td:eq(4)').html();

      document.getElementById("event_y").innerHTML=ename;
      document.getElementById("venue_y").innerHTML=evenue;
      document.getElementById("date_y").innerHTML=edate;
      document.getElementById("event_id").innerHTML=eid;
     }

    
</script>