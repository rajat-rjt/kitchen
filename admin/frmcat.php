<?php
session_start();
include_once '../buslogic.php';
if(isset($_POST["btnsub"]))
{
    $obj=new clscat();
    $obj->catnam=$_POST["txtcatnam"];
    if(isset($_SESSION["ccod"]))
    {
        $obj->catcod=$_SESSION["ccod"];
        $obj->update_rec();
        unset($_SESSION["ccod"]);
    }
    else
    {
        $obj->save_rec();
    }
}
if(isset($_REQUEST["ccod"]))
{
    if($_REQUEST["mod"]=='D')
    {
        $obj=new clscat();
        $obj->catcod=$_REQUEST["ccod"];
        $obj->delete_rec();
    }
    if($_REQUEST["mod"]=='E')
    {
        $_SESSION["ccod"]=$_REQUEST["ccod"];
        $obj=new clscat();
        $obj->catcod=$_REQUEST["ccod"];
        $obj->find_rec();
        $cnam=$obj->catnam;
    }
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
                    <h6> Categories </h6> 
                    <br></br>
                    <form method="Post" action="frmcat.php">
                        <table border="0" width="100%">
                            <tr>
                                <td>
                     Category Name        
                                </td>
                                <td>
                                    <input type="text" required="" name="txtcatnam"  value="<?php if(isset($cnam)) echo $cnam; ?>" />
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
          <input type="submit" name="btnsub" value="Submit"/>
                                </td>
                            </tr>
                            
                        </table>
                        <?php
                    $obj=new clscat();
                   $arr=$obj->disp_rec();
       if(count($arr)>0)     
       {
           echo "<table width=100% >";
           echo "<tr><th>Category Name</th></tr>";
           for($i=0;$i<count($arr);$i++)
           {
               echo "<tr><td>".$arr[$i][1]."</td>";
               echo "<td><a href=frmcat.php?ccod=".$arr[$i][0]."&mod=E >Edit</a></td>";
               echo "<td><a href=frmcat.php?ccod=".$arr[$i][0]."&mod=D >Delete</a></td></tr>";
           }
           echo "</table>";
       }
                        ?>
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

