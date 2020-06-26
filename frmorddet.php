<?php
session_start();
include_once 'buslogic.php';
if(isset($_POST["btnsub"]))
{
     if($_POST["r1"]=='P')
     {
         $obj=new clsord();
         $obj->orddat=date('y-m-d');
         $obj->orddeladd=$_SESSION["deladd"];
         $obj->orddelphn=$_SESSION["phn"];
         $obj->ordusrcod=$_SESSION["ucod"];
         $a=$obj->save_rec();
              $str=$_SESSION["cart"];
          $arr=  explode(",", $str);
           foreach ($arr as $item)
           {
  $contents[$item]=  isset($contents[$item])?$contents[$item]+1:1;
           }
             foreach($contents as $key=>$value)
             {
                 $obj1=new clsorddet();
                 $obj1->orddetordcod=$a;
                 $obj1->orddetprdcod=$key;
                 $obj1->orddetprdqty=$value;
                 $obj1->save_rec();
             }
            unset( $_SESSION["cart"]);
            $msg="Order submitted successfully";
     }
     else if($_POST["r1"]=='L')
     {
      
         header("location:frmpay.php");
     }
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop it to me</title>

<link rel="stylesheet" href="css/style.css" type="text/css" />

</head>

<body>

<div class="main-wrapper"> 
  <!----------------{ Header }---------------->
  <div class="header">
    <div class="top-part">
      <div class="top-inner-part">

        <div class="login-area"> Hello, Guest Welcome you can <a href="index.php"> Home </a><a href="login.php"> Log in </a> or <a href="frmreg.php"> create an account </a>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="logo-area">
      <div class="logo"> <a href="#"> <img src="images/logo.png" /></a> </div>
      <div class="search-bar"> <div class="clearfix"></div>  <div class="cart-btns">  <div class="clearfix"></div>  </div> </div>
      <div class="clearfix"></div>
 
    </div>
    <div class="shadow"><img src="images/shadow.png" /></div>
   
  </div>
  
  
  <!----------------{ Middle }---------------->
  <div class="middle">
    <div class="middle-inner"> 
      <!-------- evt-search-wrap -------->
      <div class="pro-cart-page">
       
        

        <div class="clearfix"></div>
             
                    <div class="product-box">
        <h2>Order Details</h2>
        <form method="Post" action="frmorddet.php" >
        <?php
        if(isset($msg))
            echo $msg;
        ?>
        <table>
   
            <tr>
                 <td>Select Payment Method</td>
                 <td><input type="radio" name="r1" value="P">Pay On Delivery</input>
                 <input type="radio" name="r1" value="L">PayPal</input>
                 </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="btnsub" value="Submit"/>
                </td>
            </tr>
        
        </table>
        </form>
                    </div>
                
      </div>
      
      <!-------- End-evt-search-wrap -------->
      <div class="evt-detail">
        <div class="clearfix"></div>
      </div>
    </div>
  </div>
  <!----------------{ End Middle }----------------> 
  
  <!----------------{ Footer }---------------->
  <div class="footer">
    <div class="footer-inner">
 
      
      <div class="clearfix"></div>
      <p> © Copyright 2019 CS Infotech. All rights reserved. </p>
    </div>
  </div>
  <!----------------{ End Footer }----------------> 
</div>
<!-----------------------------{ End Main Wrapper }----------------------------->
</body>
</html>


