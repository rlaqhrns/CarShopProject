<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Category</title>
	<link rel="icon" href="../resources/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../resources/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../resources/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../resources/vendors/linericon/style.css">
  <link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../resources/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../resources/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../resources/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="../resources/css/style.css">
  <script src="../resources/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script>
    $(document).ready(function(){
      setDisplay();
    })
  </script>
</head>
<body>
  <!--================ Start Header Menu Area =================-->
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="index.html"><img src="../resources/img/logo.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
              <li class="nav-item active submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Shop</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="category.html">Shop Category</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-product.html">Product Details</a></li>
                  <li class="nav-item"><a class="nav-link" href="checkout.html">Product Checkout</a></li>
                  <li class="nav-item"><a class="nav-link" href="confirmation.html">Confirmation</a></li>
                  <li class="nav-item"><a class="nav-link" href="cart.html">Shopping Cart</a></li>
                </ul>
							</li>
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Blog</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="blog.html">Blog</a></li>
                  <li class="nav-item"><a class="nav-link" href="single-blog.html">Blog Details</a></li>
                </ul>
							</li>
							<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                  aria-expanded="false">Pages</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
                  <li class="nav-item"><a class="nav-link" href="register.html">Register</a></li>
                  <li class="nav-item"><a class="nav-link" href="tracking-order.html">Tracking</a></li>
                </ul>
              </li>
              <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <ul class="nav-shop">
              <li class="nav-item"><button><i class="ti-search"></i></button></li>
              <li class="nav-item"><button><i class="ti-shopping-cart"></i><span class="nav-shop__circle">3</span></button> </li>
              <li class="nav-item"><a class="button button-header" href="#">Buy Now</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>Shop Category</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">Shop Category</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">부품선택</div>
            <ul class="main-categories">
              <li class="common-filter">
                <form action="#">
                  <ul>
                    <li class="filter-list"><input class="pixel-checkbox parts-radio" type="checkbox" id="front_parts" name="brand" onchange="setDisplay()"><label for="front_parts">&nbsp전면부품<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-checkbox parts-radio" type="checkbox" id="side_parts" name="brand" onchange="setDisplay()"><label for="side_parts" >&nbsp측면부품<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-checkbox parts-radio" type="checkbox" id="rear_parts" name="brand" onchange="setDisplay()"><label for="rear_parts">&nbsp후면부품<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-checkbox parts-radio" type="checkbox" id="etc" name="brand" onchange="setDisplay()"><label for="etc">&nbsp실내/전장/의장<span> (3600)</span></label></li>
                    <li class="filter-list"><input class="pixel-checkbox parts-radio" type="checkbox" id="engine_lower_body" name="brand" onchange="setDisplay()"><label for="engine_lower_body">&nbsp엔진/하체<span> (3600)</span></label></li>
                  </ul>
                </form>
              </li>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head">상세부품선택</div>
            <div class="common-filter parts_radio">
              <!-- 전면부품 체크시 나타날 radio -->
              <form action="#"> 
                <ul class="front_parts">
                  <div class="head">전면부품</div>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="headlight" name="brand"><label for="headlight">헤드램프<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="turn_signal" name="brand"><label for="turn_signal">방향지시등<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="for_lights" name="brand"><label for="for_lights">안개등<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="day_lights" name="brand"><label for="day_lights">데이라이트<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="front_bumper" name="brand"><label for="front_bumper">프론트범퍼<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="wiper" name="brand"><label for="wiper">와이퍼<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="bonnet" name="brand"><label for="bonnet">본넷<span>(29)</span></label></li>
                </ul>
              </form>
              <!-- 측면부품 체크시 나타날 radio -->
              <form action="#">
                <ul class="side_parts">
                  <div class="head">측면부품</div>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="front_door" name="brand"><label for="front_door">프론트도어<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="rear_door" name="brand"><label for="rear_door">리어도어<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="side_mirror" name="brand"><label for="side_mirror">사이드미러<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="fender" name="brand"><label for="fender">펜더<span>(29)</span></label></li>
                  
                </ul>
              </form>
              <!-- 후면부품 체크시 나타날 radio -->
              <form action="#">
                <ul class="rear_parts">
                  <div class="head">후면부품</div>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="combination_lamp" name="brand"><label for="combination_lamp">컴비네이션램프<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="spoiler" name="brand"><label for="spoiler">스포일러<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="antenna" name="brand"><label for="antenna">안테나<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="rear_bumper" name="brand"><label for="rear_bumper">리어범퍼<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="bumper_rail" name="brand"><label for="bumper_rail">범퍼레일<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="back_door" name="brand"><label for="back_door">백도어<span>(29)</span></label></li>
                </ul>
              </form>
              <!-- 실내/전장/의장 체크시 나타날 radio -->
              <form action="#">
                <ul class="etc">
                  <div class="head">실내/전장/의장</div>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="av_system" name="brand"><label for="heaav_systemdlight">AV시스템<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="ECU" name="brand"><label for="ECU">ECU<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="lnstrument_penel" name="brand"><label for="lnstrument_penel">계기판<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="pedal" name="brand"><label for="pedal">페달<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="fuse_box" name="brand"><label for="fuse_box">퓨즈박스<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="sun_visor" name="brand"><label for="sun_visor">햇빛가리개(썬바이저)<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="room_mirror" name="brand"><label for="room_mirror">룸미러<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="dashboard" name="brand"><label for="dashboard">대쉬보드<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="sheet" name="brand"><label for="sheet">시트<span>(29)</span></label></li>
                </ul>
              </form>
              <!-- 엔진/하체 체크시 나타날 radio -->
              <form action="#">
                <ul class="engine_lower_body">
                  <div class="head">엔진/하체</div>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="ABS" name="brand"><label for="ABS">ABS<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="air_flow_sensor" name="brand"><label for="air_flow_sensor">Air Flow Sensor<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="rear_brake_caliper" name="brand"><label for="rear_brake_caliper">리어 브레이크 캘리퍼<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="radiator" name="brand"><label for="radiator">라디에이터<span>(29)</span></label></li>
                  <li class="filter-list"><input class="pixel-radio" type="radio" id="battery" name="brand"><label for="battery">배터리<span>(29)</span></label></li>
                </ul>
              </form>
            </div>
            
            <div class="common-filter">
              <div class="head">Price</div>
              <div class="price-range-area">
                <div id="price-range"></div>
                <div class="value-wrapper d-flex">
                  <div class="price">Price:</div>
                  <span>$</span>
                  <div id="lower-value"></div>
                  <div class="to">to</div>
                  <span>$</span>
                  <div id="upper-value"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <!-- Start Filter Bar -->
          <div class="filter-bar d-flex flex-wrap align-items-center">
            <div class="sorting">
              <select>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
                <option value="1">Default sorting</option>
              </select>
            </div>
            <div class="sorting mr-auto">
              <select>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
                <option value="1">Show 12</option>
              </select>
            </div>
            <div>
              <div class="input-group filter-bar-search">
                <input type="text" placeholder="Search">
                <div class="input-group-append">
                  <button type="button"><i class="ti-search"></i></button>
                </div>
              </div>
            </div>
          </div>
          <!-- End Filter Bar -->
          <!-- Start Best Seller -->
          <section class="lattest-product-area pb-40 category-list">
            <div class="row">
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product1.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Accessories</p>
                    <h4 class="card-product__title"><a href="#">Quartz Belt Watch</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product2.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Beauty</p>
                    <h4 class="card-product__title"><a href="#">Women Freshwash</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product3.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Decor</p>
                    <h4 class="card-product__title"><a href="#">Room Flash Light</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product4.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Decor</p>
                    <h4 class="card-product__title"><a href="#">Room Flash Light</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product5.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Accessories</p>
                    <h4 class="card-product__title"><a href="#">Man Office Bag</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product6.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Kids Toy</p>
                    <h4 class="card-product__title"><a href="#">Charging Car</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product7.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Accessories</p>
                    <h4 class="card-product__title"><a href="#">Blutooth Speaker</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div> 
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product8.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Kids Toy</p>
                    <h4 class="card-product__title"><a href="#">Charging Car</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card text-center card-product">
                  <div class="card-product__img">
                    <img class="card-img" src="../resources/img/product/product1.png" alt="">
                    <ul class="card-product__imgOverlay">
                      <li><button><i class="ti-search"></i></button></li>
                      <li><button><i class="ti-shopping-cart"></i></button></li>
                      <li><button><i class="ti-heart"></i></button></li>
                    </ul>
                  </div>
                  <div class="card-body">
                    <p>Accessories</p>
                    <h4 class="card-product__title"><a href="#">Quartz Belt Watch</a></h4>
                    <p class="card-product__price">$150.00</p>
                  </div>
                </div>
              </div>
            </div>
          </section>
          <!-- End Best Seller -->
        </div>
      </div>
    </div>
  </section>
	<!-- ================ category section end ================= -->		  

	<!-- ================ top product area start ================= -->	
	<section class="related-product-area">
		<div class="container">
			<div class="section-intro pb-60px">
        <p>Popular Item in the market</p>
        <h2>Top <span class="section-intro__style">Product</span></h2>
      </div>
			<div class="row mt-30">
        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-4.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-5.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-6.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-7.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-8.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-9.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>

        <div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">
          <div class="single-search-product-wrapper">
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-1.png" alt=""></a>
              <div class="desc">
                  <a href="#" class="title">Gray Coffee Cup</a>
                  <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-2.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
            <div class="single-search-product d-flex">
              <a href="#"><img src="../resources/img/product/product-sm-3.png" alt=""></a>
              <div class="desc">
                <a href="#" class="title">Gray Coffee Cup</a>
                <div class="price">$170.00</div>
              </div>
            </div>
          </div>
        </div>
      </div>
		</div>
	</section>
	<!-- ================ top product area end ================= -->		

	<!-- ================ Subscribe section start ================= -->		  
  <section class="subscribe-position">
    <div class="container">
      <div class="subscribe text-center">
        <h3 class="subscribe__title">Get Update From Anywhere</h3>
        <p>Bearing Void gathering light light his eavening unto dont afraid</p>
        <div id="mc_embed_signup">
          <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="subscribe-form form-inline mt-5 pt-1">
            <div class="form-group ml-sm-auto">
              <input class="form-control mb-1" type="email" name="EMAIL" placeholder="Enter your email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Your Email Address '" >
              <div class="info"></div>
            </div>
            <button class="button button-subscribe mr-auto mb-1" type="submit">Subscribe Now</button>
            <div style="position: absolute; left: -5000px;">
              <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
            </div>

          </form>
        </div>
        
      </div>
    </div>
  </section>
	<!-- ================ Subscribe section end ================= -->		  


  <!--================ Start footer Area  =================-->	
	<footer>
		<div class="footer-area">
			<div class="container">
				<div class="row section_gap">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title large_title">Our Mission</h4>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no 
								divided deep moved us lan Gathering thing us land years living.
							</p>
							<p>
								So seed seed green that winged cattle in. Gathering thing made fly you're no divided deep moved 
							</p>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Quick Links</h4>
							<ul class="list">
								<li><a href="#">Home</a></li>
								<li><a href="#">Shop</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Product</a></li>
								<li><a href="#">Brand</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="single-footer-widget instafeed">
							<h4 class="footer_title">Gallery</h4>
							<ul class="list instafeed d-flex flex-wrap">
								<li><img src="../resources/img/gallery/r1.jpg" alt=""></li>
								<li><img src="../resources/img/gallery/r2.jpg" alt=""></li>
								<li><img src="../resources/img/gallery/r3.jpg" alt=""></li>
								<li><img src="../resources/img/gallery/r5.jpg" alt=""></li>
								<li><img src="../resources/img/gallery/r7.jpg" alt=""></li>
								<li><img src="../resources/img/gallery/r8.jpg" alt=""></li>
							</ul>
						</div>
					</div>
					<div class="offset-lg-1 col-lg-3 col-md-6 col-sm-6">
						<div class="single-footer-widget tp_widgets">
							<h4 class="footer_title">Contact Us</h4>
							<div class="ml-40">
								<p class="sm-head">
									<span class="fa fa-location-arrow"></span>
									Head Office
								</p>
								<p>123, Main Street, Your City</p>
	
								<p class="sm-head">
									<span class="fa fa-phone"></span>
									Phone Number
								</p>
								<p>
									+123 456 7890 <br>
									+123 456 7890
								</p>
	
								<p class="sm-head">
									<span class="fa fa-envelope"></span>
									Email
								</p>
								<p>
									free@infoexample.com <br>
									www.infoexample.com
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="footer-bottom">
			<div class="container">
				<div class="row d-flex">
					<p class="col-lg-12 footer-text text-center">
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
				</div>
			</div>
		</div>
	</footer>
	<!--================ End footer Area  =================-->




  <script src="../resources/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resources/vendors/skrollr.min.js"></script>
  <script src="../resources/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resources/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resources/vendors/nouislider/nouislider.min.js"></script>
  <script src="../resources/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resources/vendors/mail-script.js"></script>
  <script src="../resources/js/main.js"></script>
  <script src="../resources/js/shopproduct.js"></script>
</body>
</html>