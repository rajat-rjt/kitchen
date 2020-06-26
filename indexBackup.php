<?php
session_start();
include_once 'buslogic.php';

if(isset($_REQUEST["ccod"]))
{
    $_SESSION["ccod"]=$_REQUEST["ccod"];
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop it to me</title>
<link rel="stylesheet" href="css/style.css" type="text/css" />
<script language="javascript">
function abc(a)
{
    window.location="index.php?ccod="+a;
}
</script>
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
      <div class="logo"> <a href="#"> <img src="images/logo1.png" /></a> </div>
      <div class="search-bar"> <div class="clearfix"></div>  <div class="cart-btns"> <a href="frmcrt.php"> Shopping Cart </a> <div class="clearfix"></div>  </div> </div>
      <div class="clearfix"></div>
 
    </div>
    <div class="shadow"><img src="images/shadow.png" /></div>
    <div class="banner"><a href="#"> <img src="images/banner.jpg" /> </a></div>
  </div>
  
  
  <!----------------{ Middle }---------------->
  <div class="middle">
    <div class="middle-inner"> 
      <!-------- evt-search-wrap -------->
      <div class="pro-cart-page">
       
        

        <div class="clearfix"></div>
                
                    <h6> Product Listing</h6> 
                    <br></br>
              
                        <table border="0" width="100%">
                            <tr>
                                <td>Select Category</td>
                                <td>
                                    <select name="drpcat" onchange="abc(this.value);">
              <?php
              $obj=new clscat();
              $arr=$obj->disp_rec();
              for($i=0;$i<count($arr);$i++)
              {
    if(isset($_SESSION["ccod"]) && $_SESSION["ccod"]==$arr[$i][0])
                   echo "<option value=".$arr[$i][0]." selected />".$arr[$i][1];
    else
                  echo "<option value=".$arr[$i][0]." />".$arr[$i][1];
              }
              ?>
                                    </select>
                                </td>
                            </tr>
                   
                        </table>
                    <div class="product-box">
        <h2>Search Results </h2>
                    <?php
          if(isset($_SESSION["ccod"]))
          {
              $a=$_SESSION["ccod"];
          }      
          else
          {
              $a=1;
          }
              $obj=new clsprd();
              $arr=$obj->disp_rec($a);
           for($i=0;$i<count($arr);$i++)
           {
             ?>
        <div class="product-item">
          <div class="product-item-inner">
            <div class="product-img"> <a href="#">
             <img src="prdpics/<?php echo $arr[$i][3]; ?>" /></a></div>
            <h4> <?php echo $arr[$i][1]; ?> </h4>
            <div class="add-to"> 
                <a class="add-cart" href="frmcrt.php?pid=<?php echo $arr[$i][0]; ?>&action=add">Add To Cart</a> <span>$<?php echo $arr[$i][4]; ?></span>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
               <?php
           }
          
                   ?>
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


