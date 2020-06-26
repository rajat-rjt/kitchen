<?php
session_start();
include_once 'buslogic.php';

if(isset($_POST["btnsub"]))
{
    $_SESSION["deladd"]=$_POST["txtdeladd"];
    $_SESSION["phn"]=$_POST["txtphn"];
    if(isset($_SESSION["ucod"]))
        header("location:frmorddet.php");
    else
        header("location:login.php");
}
if(isset($_REQUEST["action"]) && $_REQUEST["action"]=="Update")
{
      foreach($_POST as $key=>$value)
      {
           if(strstr($key,'qty'))
           {
                 $pid=str_replace('qty', '', $key);   
                  for($i=0;$i<$value;$i++)
                  {
                      if(isset($newcart))
                      {
                          $newcart.=','.$pid;
                      }
                      else 
                      {
                          $newcart=$pid;
                      }
                  }
           }
           $_SESSION["cart"]=$newcart;
      }
}
if(isset($_REQUEST["pid"]) && $_REQUEST["action"]=="add")
{
    if(isset($_SESSION["cart"]))
        $_SESSION["cart"]=$_SESSION["cart"].",".$_REQUEST["pid"];
    else
        $_SESSION["cart"]=$_REQUEST["pid"];
}
if(isset($_REQUEST["pid"]) && $_REQUEST["action"]=="Delete")
{
    if(isset($_SESSION["cart"]))
    {
        $str=$_SESSION["cart"];
        $arr=  explode(",", $str);
        $str1="";
        for($i=0;$i<count($arr);$i++)
        {
            if($arr[$i]!=$_REQUEST["pid"])
            {
                if($str1=="")
                    $str1=$arr[$i];
               else
                    $str1.=",".$arr[$i];
            }
        }
        $_SESSION["cart"]=$str1;
        echo "<script>alert('You are directed to homepage')</script>)";
        unset($_SESSION["cart"]);
        header("location:index.php");
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
        <div class="call-no"> To Order Call : 0120-4455918 (Open 24Hrs) or SMS HS18WEB to 51818 </div>
        <div class="login-area"> Hello, Guest Welcome you can <a href="login.php"> Log in </a> or <a href="frmreg.php"> create an account </a>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="logo-area">
      <div class="logo"> <a href="#"> <img src="images/logo.png" /></a> </div>
      <div class="search-bar"> <div class="clearfix"></div>  <div class="cart-btns"> <a href="frmcrt.php"> Shopping Cart </a> <div class="clearfix"></div>  </div> </div>
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
        <h2>Shopping Cart </h2>
          <?php 
        if(isset($_SESSION["cart"]))
        {
          $str=$_SESSION["cart"];
          $arr=  explode(",", $str);
           foreach ($arr as $item)
           {
  $contents[$item]=  isset($contents[$item])?$contents[$item]+1:1;
           }
         if(count($contents)!=0)
         {
              echo "<form method=Post action=frmcrt.php?action=Update >";
             echo "<table  width=100% >";
             echo "<tr><th>Product</th><th>Price</th><th>Quantity</th><th>Amount</th></tr>";
            $tot=0;
           
             foreach($contents as $key=>$value)
             {
          $obj=new clsprd();
          $obj->prdcod=$key;
          $obj->find_rec();
          echo "<tr><td>".$obj->prdnam."</td>";
          echo "<td>".$obj->prdprc."</td>";
          
           echo "<td><input type=text name=qty".$key ." value=".$value ." /></td>";
          echo "<td>".$obj->prdprc*$value."</td>";
          $tot+=$obj->prdprc*$value;
          echo "<td><input type=submit name=btnupd class=add-cart value=Update /></td>";
          echo "<td><a  href=frmcrt.php?pid=".$key."&action=Delete >Delete</a></td>";
         
          echo "</tr>";
             }
             echo "<tr><td></td><td></td><td>Total Amount :</td><td>".$tot."</td></tr>";
             echo "</table>";
             $_SESSION["amt"]=$tot;
             
              echo "</form>";
         }  
        } 
          ?>
        <hr></hr>
        <form method="Post" action="frmcrt.php">
        <p>Enter Delivery Information</p>
        <table>
            <tr>
                <td>Delivery Address</td>
                <td><textarea name="txtdeladd" rows="5" cols="70" required=""  ></textarea></td>
            </tr>
             <tr>
                <td>Phone No</td>
                <td><input type="text" name="txtphn" required="" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="btnsub" value="Submit Order"/>
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


