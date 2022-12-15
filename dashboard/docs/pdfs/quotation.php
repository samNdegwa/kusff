<?php
include '../../core/init.php';
require('../../assets/fpdf181/fpdf.php');
date_default_timezone_set('Africa/Nairobi');
$now = new DateTime();
$monthStamp=$now->format('mY');
$year=$now->format('Y');
$mn=$now->format('m');

$date=$now->format('d-m-Y H:i');
$serial = $_GET['c'];

class PDF extends FPDF {
    function Header(){}
    function Footer()
    {
        date_default_timezone_set('Africa/Nairobi');
        $now = new DateTime();
        $dt=$now->format('d-m-Y  H:i:s');
        $this->SetY(-15);

        $this->SetFont('Arial','',7);

        $this->Cell(0,10,'Page'.$this->PageNo()."/{pages}",0,1,'C');
        $this->Cell(0,5,'This is a system generated document.  Printed on '.$dt,0,0,'R');
    }

}
$pdf = new PDF('P','mm','A4');

$pdf->AliasNbPages('{pages}');

$pdf->AddPage();
$pdf->SetFont('Arial', '',12);
$pdf->Image('../../assets/img/salamaLogo.png',10,12,35);
$pdf->Ln(6);
$pdf->SetFont('Arial', 'B',22);
$pdf->Cell(45,5,'',0,0);
$pdf->Cell(97,5,' ',0,0);
$pdf->Cell(28,5,'QUOTATION',0,1);

$pdf->SetFont('Arial', '',12);
$pdf->Cell(45,5,'',0,0);
$pdf->Cell(99,5,'',0,0);
$pdf->Cell(28,5,'Salama giant glassmart',0,1);

$pdf->SetFont('Arial', '',10);
$pdf->Cell(45,4,'',0,0);
$pdf->Cell(85,4,'',0,0);
$pdf->Cell(58,4,'Salama Ndani, Muguga-Thika, Kenya',0,1);

$pdf->Cell(45,4,'',0,0);
$pdf->Cell(111,4,'',0,0);
$pdf->Cell(58,4,'Mobile : 0791014797',0,1);

$pdf->Cell(45,4,'',0,0);
$pdf->Cell(96,4,'',0,0);
$pdf->Cell(58,4,'Email : tonietony2@gmail.com',0,1);

$pdf->Cell(45,4,'',0,0);
$pdf->Cell(109,4,'',0,0);
$pdf->Cell(58,4,'TAX NO. :: A007846V',0,1);


$pdf->Cell(190,1,'',1,1);

$pdf->Ln(4);

$sql="SELECT * FROM tb_quote WHERE id='$serial'";
$result=mysqli_query($con, $sql) or die(mysql_error());
$no=1;
$amountTotal=0;
while($row=mysqli_fetch_array($result))
{
    $customer_name=$row['customer_name'];
    $customer_email=$row['customer_email'];
    $customer_phone=$row['customer_phone'];
}

$pdf->SetFont('Arial', 'B',12);
$pdf->Cell(45,5,'Bill to',0,0);
$pdf->Cell(85,5,'',0,0);
$pdf->Cell(58,5,'Serial No.'.$serial,0,1);

$pdf->SetFont('Arial', '',12);
$pdf->Cell(45,5,$customer_name,0,0);
$pdf->Cell(85,5,'',0,0);
$pdf->SetFont('Arial', 'B',12);
$pdf->Cell(58,5,'Phone: '.$customer_phone,0,1);

$pdf->Cell(45,5,'',0,0);
$pdf->Cell(85,5,'',0,0);
$pdf->Cell(58,5,'Email: '.$customer_email,0,1);

$pdf->SetFillColor(180,180,255);
$pdf->SetDrawColor(50,50,100);

$pdf->Ln(5);
$pdf->SetFont('Arial', 'B',11);
$pdf->Cell(10,7,'#',0,0,'',true);
$pdf->Cell(25,7,'Location',0,0,'',true);
$pdf->Cell(50,7,'Item',0,0,'',true);
$pdf->Cell(25,7,'Quantity',0,0,'',true);
$pdf->Cell(25,7,'Price',0,0,'',true);
$pdf->Cell(35,7,'Amount',0,1,'',true);


$pdf->SetFont('Arial', '',9);
$sql12="SELECT * FROM tb_location WHERE cust_id='$serial'";
$result12=mysqli_query($con,$sql12) or die(mysql_error());
$no=1;
$all_total=0;
while($row=mysqli_fetch_array($result12))
{ 
    $loc_name=$row['loci'];
    $loc_id=$row['id'];
    $rate=$row['rate'];
       
    $pdf->Cell(10,7,$no,0,0);
    $pdf->Cell(25,7,$loc_name,0,0);
    $pdf->Cell(25,7,"",0,0);
    $pdf->Cell(25,7,"",0,0);
    $pdf->Cell(25,7,"",0,0);
    $pdf->Cell(35,7,"",0,1);

     $sql10="SELECT * FROM tb_pane WHERE loci_id='$loc_id'";
       $result10=mysqli_query($con,$sql10) or die(mysql_error());
       //$the_quantity=0;
       while($row=mysqli_fetch_array($result10))
      { 
         $pane_width=$row['pane_width'];
         $pane_height=$row['pane_height'];
         $width_sq=$row['width_sq'];
         $height_sq=$row['height_sq'];
         $quant=$row['quantity'];

         $t_sq=$width_sq*$height_sq;
        // $the_quantity=$the_quantity+$quant;
         $unit_price=$t_sq*$rate;
         $cost=$t_sq*$rate*$quant;

    $pdf->Cell(10,7,"",0,0);
    $pdf->Cell(25,7,"",0,0);
    $pdf->Cell(50,7,$pane_width.' by '.$pane_height,0,0);
    $pdf->Cell(25,7,$quant,0,0);
    $pdf->Cell(25,7,number_format($unit_price,2),0,0);
    $pdf->Cell(35,7,number_format($cost,2),0,1);

     $all_total= $all_total+$cost;
       } 
   
    
    $no++;
}
    
    $pdf->SetFont('Arial', 'B',12);
    $pdf->Cell(10,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(50,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(25,7,'Sub Total:',0,0);
    $pdf->Cell(25,7,number_format($all_total,2),0,1);
$pdf->Ln(2);

    $pdf->SetFont('Arial', 'B',12);
    $pdf->Cell(10,7,'',0,0);
    $pdf->Cell(25,7,'Other Cost',0,0);
    $pdf->Cell(50,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(25,7,'',0,1);


    $pdf->SetFont('Arial', '',9);
$sql13="SELECT * FROM tb_other_cost WHERE cust_id='$serial' ORDER BY id DESC";
$result13=mysqli_query($con,$sql13) or die(mysql_error());
$noo=1;
$other_total=0;
while($row=mysqli_fetch_array($result13))
{ 

    $specification=$row['specification'];
    $unit_price=$row['unit_price'];
    $quantity=$row['quantity'];

    $total = $unit_price*$quantity;
    $other_total=$other_total+$total;
       
    $pdf->Cell(10,7,'',0,0);
    $pdf->Cell(75,7,$specification,0,0);
    $pdf->Cell(25,7,$quantity,0,0);
    $pdf->Cell(25,7,$unit_price,0,0);
    $pdf->Cell(25,7,$total,0,1);

    $noo++;

}

  $total_cost=$all_total+$other_total;

   $pdf->SetFont('Arial', 'B',12);
    $pdf->Cell(10,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(50,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(25,7,'Sub Total:',0,0);
    $pdf->Cell(25,7,number_format($other_total,2),0,1);

    $pdf->Cell(10,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(50,7,'',0,0);
    $pdf->Cell(25,7,'',0,0);
    $pdf->Cell(25,7,'Total Cost:',0,0);
    $pdf->Cell(25,7,number_format($total_cost,2),0,1);

    $pdf->Ln(10);

    $pdf->SetFont('Arial', 'B',11);
    $pdf->Cell(100,5,'Note:',0,1);

    $pdf->SetFont('Arial', '',9);
    $pdf->Cell(150,5,'Due to the high volatile nature of glass, rates in this quotation is subject to/no re-evaluation',0,1);

$pdf->Ln(25);
$pdf->Cell(150,7,'Customer Sign',0,0);
$pdf->Cell(25,7,'Authorised Signatory',0,1);

$pdf->Cell(150,7,'________________________________',0,0);
$pdf->Cell(25,7,'_________________________________',0,1);


$pdf->Output();

?>