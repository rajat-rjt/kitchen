<?php
session_start();
include_once 'buslogic.php';
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script language="javascript">
function abc(a)
{
    window.location="index.php?ccod="+a;
}
</script>
<title>Shop it to me</title>

<link rel="stylesheet" href="css/style.css" type="text/css" />
<link rel="stylesheet" href="css/docs.theme.min.css"/>
<link rel="stylesheet" href="css/owl.carousel.min.css"/>
<link rel="stylesheet" href="css/owl.theme.default.min.css"/>


<script src="js/jquery.min.js"></script>
 <script src="js/owl.carousel.js"></script>
</head>

<body>
<!-----------------------------{ Main Wrapper }----------------------------->
<div class="main-wrapper"> 
  <!----------------{ Header }---------------->
  <div class="header">
    <div class="top-part">
      <div class="top-inner-part">
       
          <div class="login-area"> Hello, Guest Welcome you can <a href="index.php"> Home </a> <a href="Aboutus.php"> AboutUs </a> <a href="Contactus.php"> ContactUs </a><a href="login.php"> Log in </a> or <a href="frmreg.php"> create an account </a>
          <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
    <div class="logo-area">
      <div class="logo"> <a href="#"> <img src="images/logo.png" /></a> </div>
<!--      <div class="search-bar">      <div class="clearfix"></div>  <div class="cart-btns"> <a href="#"> All Stores </a> | <a href="#"> Kitchen </a> | <a href="#"> Shopping Cart </a> | <a href="#"> Cart </a> |<div class="clearfix"></div>  </div> </div>-->
      <div class="clearfix"></div>
      
    </div>
    <div class="shadow"><img src="images/shadow.png" /></div>
    <!-- <div class="banner"><a href="#"> <img src="images/banner.jpg" /> </a></div> -->

 <div class="owl-carousel-outer">
  <div class="owl-carousel owl-theme">
    <div class="item">
      <img src="images/slide2.jpg" />
    </div>
    <div class="item">
      <img src="images/slide3.jpg" />
    </div>
    <div class="item">
      <img src="images/slide1.jpg" />
    </div>
</div>
 </div>


  </div>
  
  <!----------------{ End Header }----------------> 
  
  <!----------------{ Middle }---------------->
  <div class="middle">
    <div class="middle-inner"> 
      <!-------- evt-search-wrap -------->
      <div class="product-box">
        <h2>Product Feature </h2>
         <br></br>
           <div class="product-box">
                    <?php
          if(isset($_REQUEST["pid"]))
          {
              $a=$_REQUEST["pid"];
          $con=new clscon();
        
          $link=$con->db_connect();
          $qry="SELECT * FROM tbprd where prdcod=$a";
          $res=  mysqli_query($link, $qry) or die(mysqli_error($link));
          if($arr=  mysqli_fetch_row($res))
       
           {
             ?>
        <table>
      
              <td>  <div class="product-img"> <a href="#">
                          <img src="prdpics/<?php echo$arr[3]; ?>" height="100%" width="100%" /></a></div></td>
            <h4> <?php //echo $arr[$i][1]; ?> </h4>
             <td><h1><?php echo" $arr[1] ";?><br></h1>
                 <h2> <?php echo" $arr[2] <br>";?><br>
                   PRICE: <?php echo"$arr[4]<br>"; ?><br></h2>
   
                <h2>    <a class="add-cart" href="frmcrt.php?pid=<?php echo $arr[0]; ?>&action=add">Add To Cart</a></h2>
                <div class="clearfix"></div></td>
            </div>
        
        </div>
          
        </table>
               <?php
           }
          }
          
                   ?>
                    </div>
<!--        <div class="product-item">
          <div class="product-item-inner">
            <div class="product-img"> <a href="#"><img src="images/pro4.jpg" /></a></div>
            <h4> Lorem ipsum </h4>
            <div class="add-to"> <a class="add-cart" href="#">Add to cart</a> <span>$123</span>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div class="product-item">
          <div class="product-item-inner">
            <div class="product-img"> <a href="#"><img src="images/pro3.jpg" /></a></div>
            <h4> Lorem ipsum </h4>
            <div class="add-to"> <a class="add-cart" href="#">Add to cart</a> <span>$123</span>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        <div class="product-item">
          <div class="product-item-inner">
            <div class="product-img"> <a href="#"><img src="images/pro2.jpg" /></a></div>
            <h4> Lorem ipsum </h4>
            <div class="add-to"> <a class="add-cart" href="#">Add to cart</a> <span>$123</span>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>-->
        <div class="clearfix"></div>
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
      <ul>
        <h5> Information </h5>
        <li> <a href="#"> About Us</a> </li>
        <li> <a href="#">Delivery Information</a> </li>
        <li> <a href="#"> Privacy Policy</a> </li>
        <li> <a href="#">Terms & Conditions </a> </li>
      </ul>
      <ul>
        <h5> Customer Service </h5>
        <li> <a href="#">Contact Us</a> </li>
        <li> <a href="#">Returns</a> </li>
        <li> <a href="#"> Site Map </a> </li>
      </ul>
      <ul>
        <h5> Extras </h5>
        <li> <a href="#"> Brands </a> </li>
        <li> <a href="#">Gift Vouchers</a> </li>
        <li> <a href="#"> Affiliates</a> </li>
        <li> <a href="#"> Specials </a> </li>
      </ul>
      <ul>
        <h5> My Account </h5>
        <li> <a href="#"> My Account</a> </li>
        <li> <a href="#"> Order History</a> </li>
        <li> <a href="#"> Wish List</a> </li>
        <li> <a href="#"> Newsletter </a> </li>
      </ul>
      <div class="abt-cart">  
<strong> About ShopCart </strong>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce luctus, orci nec vulputate rutrum, dui enim egestas ante, sodales adipiscing purus sapien at ipsum. Phasellus suscipit lectus a lacus interdum blandit.  accumsan congue. Ns...... 
 </div>
      <div class="clearfix"></div>
      <p> © Copyright 2013 ABC, Inc. All rights reserved. </p>
    </div>
  </div>
  <!----------------{ End Footer }----------------> 
</div>
<!-----------------------------{ End Main Wrapper }------------------------------>
<script>
  $(document).ready(function() {
    var owl = $('.owl-carousel');
    owl.owlCarousel({
      rtl:true,
      items: 1,
      loop: true,
      margin: 10,
      autoplay: true,
      autoplayTimeout: 2500,
      autoplayHoverPause: true
    });
    $('.play').on('click', function() {
      owl.trigger('play.owl.autoplay', [1000])
    })
    $('.stop').on('click', function() {
      owl.trigger('stop.owl.autoplay')
    })
  })
</script>


</body>
</html>
