<?php
session_start();
include_once '../buslogic.php';
if(isset($_POST["btnsub"]))
{
        $obj=new clsprd();
        $obj->prdcatcod=$_POST["drpcat"];
        $obj->prdnam=$_POST["txtprdnam"];
        $obj->prdprc=$_POST["txtprdprc"];
        $obj->prddsc=$_POST["txtdsc"];
        $obj->prdoff=$_POST["txtoff"];
        $obj->prdisavl=$_POST["ck1"];
        $obj->prdpic=$_FILES["filupl"]["name"];
        $obj->save_rec();
        if($obj->prdpic!="")
            move_uploaded_file ($_FILES["filupl"]["tmp_name"],
                    "../prdpics/".$_FILES["filupl"]["name"]);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Shop it to me</title>
<link rel="stylesheet" href="../css/style.css" type="text/css" />
</head>

<body>
<!-----------------------------{ Main Wrapper }----------------------------->
<div class="main-wrapper"> 
  <!----------------{ Header }---------------->
  <div class="header">
    <div class="top-part">
      <div class="top-inner-part">
        <div class="call-no"> To Order Call : 0120-4455918 (Open 24Hrs) or SMS HS18WEB to 51818 </div>
        <div class="login-area"> Welcome Administrator  </a>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="logo-area">
      <div class="logo"> <a href="#"> <img src="../images/logo.png" /></a> </div>

      <div class="clearfix"></div>
      <div class="navigation">
        <ul>
            <li><a href="frmcat.php"> Categories </a> </li>
          <li><a href="frmprd.php"> Add New Product </a> </li>
       <li><a href="frmlst.php"> Product Listing </a> </li>
        </ul>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="shadow"><img src="../images/shadow.png" /></div>
  </div>
  
  <!----------------{ End Header }----------------> 
  
  <!----------------{ Middle }---------------->
  <div class="middle">
    <div class="middle-inner"> 
      <!-------- evt-search-wrap -------->
      <div class="pro-cart-page">
       
        

        <div class="clearfix"></div>
                <div class="pro-discrp">
                    <h6> Products </h6> 
                    <br></br>
                    <form method="Post" action="frmprd.php" enctype="multipart/form-data">
                        <table border="0" width="100%">
                            <tr>
                                <td>Select Category</td>
                                <td>
                                    <select name="drpcat">
              <?php
              $obj=new clscat();
              $arr=$obj->disp_rec();
              for($i=0;$i<count($arr);$i++)
              {
                  echo "<option value=".$arr[$i][0]." />".$arr[$i][1];
              }
              ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>Product Name</td>
                                <td>
           <input type="text" name="txtprdnam" required=""/>
                                </td>
                            </tr>
                               <tr>
                                <td>Price</td>
                                <td>
           <input type="text" name="txtprdprc" required=""/>
                                </td>
                            </tr>
                               <tr>
                                <td>Description</td>
                                <td>
                                    <textarea name="txtdsc" rows="5" cols="70" required=""></textarea>
                                </td>
                            </tr>
                             <tr>
                                <td>Offers</td>
                                <td>
                                    <textarea name="txtoff" rows="5" cols="70" required=""></textarea>
                                </td>
                            </tr>
                        
                              <tr>
                                <td>Browse Picture</td>
                                <td>
                                    <input type="file" name="filupl" required=""/>
                                </td>
                            </tr>
                                  <tr>
                                <td></td>
                                <td>
                                    <input type="checkbox" name="ck1" value="T" required="" >Is Available?</input>
                                </td>
                            </tr>
                              <tr>
                                <td></td>
                                <td>
                                    <input type="submit" name="btnsub" value="Submit"/>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="reset" name="btncan" value="Cancel"/>
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

