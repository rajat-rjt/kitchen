<?php
session_start();
include_once 'buslogic.php';
if(isset($_POST["btnsub"]))
{
    $obj=new clsusr();
    $obj->usreml=$_POST["txteml"];
    $obj->usrpwd=$_POST["txtpwd"];
    $obj->usrrol='U';
    $obj->usrregdat=date('y-m-d');
    $obj->save_rec();
   header("location:login.php");
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop it to me</title>
<script>
function validate_register()
{


var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;



var txteml = document.getElementById('txteml').value;
var txtpwd = document.getElementById('txtpwd').value;
var txtconpwd = document.getElementById('txtconpwd').value;

if (txteml == '')
{
document.getElementById('txteml').focus();
alert("Please enter email address");
return false;
} else if (!re.test(txteml))
{
document.getElementById('txteml').focus();
alert("Please enter valid email address");
return false;
}
if (txtpwd == '')
{
document.getElementById('txtpwd').focus();
alert("Please enter Password");
return false;
}
if(txtpwd.length!="")
{
if(txtpwd.length > 10)
{
document.getElementById('txtpwd').focus();
alert("Please Enter Less than 10 Character");
return false;
}else if(txtpwd.length < 6)
{
document.getElementById('txtpwd').focus();
alert("You Enter Lass than 6 Character");
return false;
}
}
if(txtconpwd=='')
{
document.getElementById('txtconpwd').focus();
alert("Please enter confirm password");
return false;
} 
if(txtpwd !=txtconpwd)
{ 
document.getElementById('txtconpwd').focus();
alert("Password and confirm password must be match");
return false;
}



}


</script>
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
        <h2>Register Here</h2>
        <form method="Post" action="frmreg.php" onsubmit="return validate_register()">
        
        <table>
            <tr>
                <td>Enter Email</td>
                <td><input type="text" name="txteml" id="txteml"/></td>
            </tr>
             <tr>
                 <td>Enter Password</td>
                 <td><input type="password" name="txtpwd" id="txtpwd"/></td>
            </tr>
            <tr>
                 <td>Enter Confirm Password</td>
                 <td><input type="password" name="txtconpwd" id="txtconpwd"/></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="btnsub" value="Submit"/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <a href="login.php">Already Registered</a>
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


