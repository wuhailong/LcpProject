<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%  String  url  =  "http://"  +  request.getServerName()  +  ":"  +  request.getServerPort()  +  request.getContextPath()+request.getServletPath().substring(0,request.getServletPath().lastIndexOf("/")+1);  
   if(request.getQueryString()!=null)   
   url+="?"+request.getQueryString();  
	String cpParam = request.getQueryString(); 
	String current_cp_id = cpParam.split(":")[1];
   	pageContext.setAttribute("currenturl",url);   	
   	url = null;
%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="Meghna One page parallax responsive HTML Template ">
        
        <meta name="author" content="Muhammad Morshed">
		
        <title>临床路径PDCA</title>
		
		<!-- Mobile Specific Meta
		================================================== -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- Favicon -->
		<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png" />
		
		<!-- CSS
		================================================== -->
		<!-- Fontawesome Icon font -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
		<!-- bootstrap.min css -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
		<!-- Animate.css -->
        <link rel="stylesheet" href="css/animate.css">
		<!-- Owl Carousel -->
        <link rel="stylesheet" href="css/owl.carousel.css">
		<!-- Grid Component css -->
        <link rel="stylesheet" href="css/component.css">
		<!-- Slit Slider css -->
        <link rel="stylesheet" href="css/slit-slider.css">
		<!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/main.css">
		<!-- Media Queries -->
        <link rel="stylesheet" href="css/media-queries.css">
        <!-- treetable css -->
        <link rel="stylesheet" type="text/css" href="css/cporders.css" />
		<link rel="stylesheet" href="css/jquery.treetable.css" />
		<link rel="stylesheet" href="css/jquery.treetable.theme.default.css" />
		<!--
		Google Font
		=========================== -->                    
		
		<!-- Oswald / Title Font -->
		<link href='http://fonts.useso.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
		<!-- Ubuntu / Body Font -->
		<link href='http://fonts.useso.com/css?family=Ubuntu:400,300' rel='stylesheet' type='text/css'>
		
		<!-- Modernizer Script for old Browsers -->		
        <script src="js/modernizr-2.6.2.min.js"></script>


		
	
    </head>
	
    <body id="body" onload="show()">
	    <!--
	    Start Preloader
	    ==================================== -->
		<div id="loading-mask">
			<div class="loading-img">
				<img alt="Meghna Preloader" src="img/preloader.gif"  />
			</div>
		</div>
        <!--
        End Preloader
        ==================================== -->
		
        <!--
        Welcome Slider
        ==================================== -->

		<!--/#home section-->
		
        <!-- 
        Fixed Navigation
        ==================================== -->
        <header id="navigation" class="navbar navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
					<!-- /responsive nav button -->
					
					<!-- logo -->
                    <a class="navbar-brand" href="#body">
						<h1 id="logo">
							<!-- <img src="img/logo-meghna1.png" alt="Meghna" /> -->
						</h1>
					</a>
					<!-- /logo -->
                </div>

				<!-- main nav -->
                <nav class="collapse navbar-collapse navbar-right" role="Navigation">
                    <ul id="nav" class="nav navbar-nav">
                        <li class="current"><a href="#body">路径主ID:<span id="current_cp_id"><%=current_cp_id%></span>  </a></li>
                        <li id="inoutcmpare"><a href="#about">院外与路径对比</a></li>
                        <li id="versioncmpare"><a href="#services">版本间对比</a></li>
                        <li id="checkorders"><a href="#showcase">查看路径医嘱</a></li>
                        <li id="nodevariation"><a href="#contact-us">变异节点图</a></li>
                        <li><a href="#our-team">非路径医嘱增加[FALSE]</a></li>
                        <li><a href="#pricing">新版本路径</a></li>                        
                        <li><a href="#blog">其他</a></li>                        
                    </ul>
                </nav>
				<!-- /main nav -->
				
            </div>
        </header>
        <!--
        End Fixed Navigation
        ==================================== -->
        
        <div class="copyrights">Collect from <a href="http://www.cssmoban.com/" >ä¼ä¸ç½ç«æ¨¡æ¿</a></div>
		
		<!--
		Start About Section
		==================================== -->
		<section id="about" class="bg-one">
			<div class="container">
				<div class="row">
				
					<!-- section title -->
					<div class="title text-center wow fadeIn" data-wow-duration="1500ms" >
						<h2>院外与路径对比</h2>
						<div class="border"></div>
					</div>
					<!-- /section title -->
					
					<!-- About item -->
					<div class="col-md-4 text-center wow fadeInUp" data-wow-duration="500ms" >
						<div class="wrap-about">							
							<div class="icon-box">
								<i class="fa fa-lightbulb-o fa-4x"></i>
							</div>					
							<!-- Express About Yourself -->
							<div class="about-content text-center">
								<h3 class="ddd">临床路径执行情况</h3>								
								<p>治疗有效率:<span id="uyxl";class="color"></span></p>
								<p>平均住院费:<span id="uzyf";class="color"></span></p>
								<p>平均住院日:<span id="uzyr";class="color"></span></p>
							</div>
						</div>
					</div> 
					<!-- End About item -->
					
					<!-- About item -->
					<div class="col-md-4 text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="250ms">
						
					</div> 
					<!-- End About item -->
					
					<!-- About item -->					
					<div class="col-md-4 text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="500ms">
						<div class="wrap-about kill-margin-bottom">
							<div class="icon-box">
								<i class="fa fa-users fa-4x"></i>
							</div>
							<!-- Express About Yourself -->
							<div class="about-content text-center">
								<h3>非路径执行情况</h3>
								<p>治疗有效率:</p>
								<p>平均住院费:</p>
								<p>平均住院日:</p>
							</div>
						</div>
					</div> 
					<!-- End About item -->
					
				</div> 		<!-- End row -->
			</div>   	<!-- End container -->
		</section>   <!-- End section -->
		
		<!--
		Start Main Features
		==================================== -->
		<section id="main-features">
			<div class="container">
				<div class="row">
					
					<!-- features item -->
					<div id="features">
						<div class="item">
							
							<div class="features-item">
								
								
								
								
							</div>
						</div>
					
					</div>
					<!-- /features item -->
					
				</div> 		<!-- End row -->
			</div>   	<!-- End container -->
		</section>   <!-- End section -->
		
		<!--
		Start Counter Section
		==================================== -->
		
		<section id="counter" class="parallax-section">
			<div class="container">
				<div class="row">
				
				
				</div> 		<!-- end row -->
			</div>   	<!-- end container -->
		</section>   <!-- end section -->
		
		
		<!-- Start Services Section
		==================================== -->
		
		<section id="services" class="bg-one">
		<div class="container">
				<div class="row">
					
					<!-- section title -->
				    <div class="title text-center wow fadeInDown" data-wow-duration="500ms">
			        	<h2>路径版本间对比</span></h2>
				        <div class="border"></div>
				    </div>
				    <!-- /section title -->
					
					<!-- single pricing table -->
					<article class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp" data-wow-duration="200ms">
						<div class="pricing">
							
							<!-- plan name & value -->
							<div class="price-title">
								<h3 id="vcpname">启用版本</h3>
								<p>ID<strong class="value" id="vcpid">-</strong> <span id="vcpstatus"> </p>								
							</div>
							<!-- /plan name & value -->
							
							<!-- plan description -->
							<ul>
								<li><p>治疗有效率 <strong class="value" id="vzlhzl">-</strong> </p></li>
								<li><p>平均住院费 <strong class="value" id="vzyf">-</strong> </p></li>
								<li><p>平均住院日 <strong class="value" id="vzyr">-</strong> </p></li>
								<li><p><input id="vck" type ="checkbox" value ="加入对比"> 加入对比</p></li>								
							</ul>
							<!-- /plan description -->
							
							<!-- signup button -->
							<a name="vcompare" target="_blank" class="btn btn-transparent" >对比</a>
							<!-- /signup button -->
							
						</div>
					</article>
					<!-- end single pricing table -->
					
					<!-- single pricing table -->
					<article class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="400ms">
						<div class="pricing">
						
							<!-- plan name & value -->
							<div class="price-title">
								<h3 id="vcpname1">其他版本1</h3>
								<p>ID <strong class="value" id="vcpid1">-</strong> <span id="vcpstatus1"></span></p>
							</div>
							<!-- /plan name & value -->
							
							<!-- plan description -->
							<ul>
								<li><p>治疗有效率 <strong class="value" id="vzlhzl1">-</strong> </p></li>
								<li><p>平均住院费 <strong class="value" id="vzyf1">-</strong> </p></li>
								<li><p>平均住院日 <strong class="value" id="vzyr1">-</strong> </p></li>
								<li><p><input id="vck1"  type ="checkbox" value ="加入对比"> 加入对比</p></li>		
							</ul>
							<!-- /plan description -->
							
							<!-- signup button -->
							<a name="vcompare"  target="_blank" class="btn btn-transparent" >对比</a>
							<!-- /signup button -->
							
						</div>
					</article>
					<!-- end single pricing table -->
					
					<!-- single pricing table -->
					<article class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="600ms">
						<div class="pricing">
							
							<!-- plan name & value -->
							<div class="price-title">
								<h3 id="vcpname2">其他版本2</h3>
								<p>ID <strong class="value" id="vcpid2">-</strong>  <span id="vcpstatus2"></span></p>
							</div>
							<!-- /plan name & value -->
							
							<!-- plan description -->
							<ul>
								<li><p>治疗有效率 <strong class="value" id="vzlhzl2">-</strong> </p></li>
								<li><p>平均住院费 <strong class="value" id="vzyf2">-</strong> </p></li>
								<li><p>平均住院日 <strong class="value" id="vzyr2">-</strong> </p></li>
								<li><p><input id="vck2"  type ="checkbox" value ="加入对比"> 加入对比</p></li>		
							</ul>
							<!-- /plan description -->
							
							<!-- signup button -->
							<a name="vcompare"  target="_blank" class="btn btn-transparent" >对比</a>
							<!-- /signup button -->
							
						</div>
					</article>
					<!-- end single pricing table -->
					
					<!-- single pricing table -->
					<article class="col-md-3 col-sm-6 col-xs-12 text-center wow fadeInUp" data-wow-duration="500ms" data-wow-delay="750ms">
						<div class="pricing kill-margin-bottom">
						
							<!-- plan name & value -->
							<div class="price-title">
								<h3 id="vcpname3">其他版本3</h3>
								<p>ID <strong class="value" id="vcpid3">-</strong>  <span id="vcpstatus3"></span></p>
							</div>
							<!-- /plan name & value -->
							
							<!-- plan description -->
							<ul>
								<li><p>治疗有效率 <strong class="value" id="vzlhzl3">-</strong> </p></li>
								<li><p>平均住院费 <strong class="value" id="vzyf3">-</strong> </p></li>
								<li><p>平均住院日 <strong class="value" id="vzyr3">-</strong> </p></li>
								<li><p><input id="vck3"  type ="checkbox" value ="加入对比"> 加入对比</p></li>		
							</ul>
							<!-- /plan description -->
							
							<!-- signup button -->
							<a  name="vcompare" target="_blank" class="btn btn-transparent" >对比</a>
							<!-- /signup button -->
							
						</div>
					</article>
					<!-- end single pricing table -->
				    
					
				</div>       <!-- End row -->
			</div>   	<!-- End container -->
			
		</section>   <!-- End section -->
		
		
		<!-- Start Portfolio Section
		=========================================== -->
		
		<section id="showcase">
			<div class="container">
				<div class="row wow fadeInDown" data-wow-duration="500ms">
					<div class="col-lg-12">
					
						<!-- section title -->
						<div class="title text-center">
							<h2>查看路径医嘱</h2>
							<div class="border"></div>
						</div>
						<!-- /section title -->
					
						
						<!-- /portfolio item filtering -->
						
					</div> <!-- /end col-lg-12 -->
				</div> <!-- end row -->
			</div>	<!-- end container -->
	
		<div id="myorders">
				<table class="bordered" id="example-advanced">
					<thead>
						<tr style='font-size:12px,font-family:Helvetica, Arial, sans-serif'>
							<th width="50%">医嘱名称</th>
							<th width="20%">医嘱编码</th>
							<th width="15%">执行次数</th>
							<th width="10%">执行率</th>
							<th width="5%">##</th>
						</tr>
					</thead>
					<tbody id='orderseqs'></tbody>
				</table>
			</div>
			
		</section>   <!-- End section -->
		
		
		
		<!-- Start Team Skills
		=========================================== -->
		
		<section id="team-skills" class="parallax-section">
			<div class="container">
				<div class="row wow fadeInDown" data-wow-duration="500ms">
				
					<!-- section title -->
					<div class="text-center">
					<a id="thinorders" href="#pricing" class="btn btn-transparent" >精简医嘱生成新路径</a>												
					</div>
					<!-- /section title -->
					
					
					
				</div>  		<!-- End row -->
			</div>   	<!-- End container -->
		</section>   <!-- End section -->
		
		<section id="contact-us">
			<div class="container">
				<div class="row">
					
					<!-- section title -->
					<div class="title text-center wow fadeIn" data-wow-duration="500ms">
						<h2>节点变异曲线图</span></h2>
						<div class="border"></div>
					</div>
					<!-- /section title -->
										
					<!-- Contact Form -->
					<div sytle="width = 80%,text-align:center">
						<div id="mygraph"></div>
					</div>
					<!-- ./End Contact Form -->
				
				</div> <!-- end row -->
			</div> <!-- end container -->
			
			<!-- Google Map -->
			<div class="wow fadeInDown" data-wow-duration="500ms">
				
			</div>	
			<!-- /Google Map -->
			
		</section> <!-- end section -->
		<!-- Start Our Team
		=========================================== -->
		
		<section id="our-team">
			<div class="container">
				<div class="row">
					<!-- section title -->
					<div class="title text-center wow fadeInUp" data-wow-duration="500ms">
						<h2>非路径医嘱增加</h2>
						<div class="border"></div>
					</div>
					<!-- /section title -->
				</div>  	<!-- End row -->
			</div>   	<!-- End container -->
		</section>   <!-- End section -->
		
		
		<!-- Start Twitter Feed
		=========================================== -->
		
		<section id="twitter-feed" class="parallax-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 text-center">
					
						<!-- twitter bird -->
						<div class="twitter-bird wow fadeInDown" data-wow-duration="500ms">
							<span>
								<i class="fa fa-twitter fa-4x"></i>
							</span>
						</div>
						<!-- /twitter bird -->
						
						<!-- fetching tweet -->
						<div class="tweet wow fadeIn" data-wow-duration="2000ms"></div>
						<!-- /fetching tweet -->
						
						<!-- follow us button -->
						<a href="https://twitter.com/amimorshed" title="Follow Us" target="_blank" class="btn btn-transparent wow fadeInUp" data-wow-duration="500ms">Follow Us</a>						
						<!-- /follow us button -->
						
					</div>
				</div>       <!-- End row -->
			</div>   	<!-- End container -->
		</section>   <!-- End section -->
		
		<!-- Start Pricing section
		=========================================== -->

	<section id="pricing" class="bg-one">
		<div class="container">
			<div class="row">

				<!-- section title -->
				<div class="title text-center wow fadeInDown"
					data-wow-duration="500ms">
					<h2>
						新版本路径</span>
					</h2>
					<div class="border"></div>
				</div>
				<!-- /section title -->

				<div id="myorders">
					<table class="bordered" id="bornedcp">
						<thead>
							<tr
								style='font-size: 12px, font-family :   Helvetica, Arial, sans-serif'>
								<th width="50%">医嘱名称</th>
								<th width="10%">医嘱编码</th>
								<th width="10%">规格</th>
								<th width="10%">频次</th>
								<th width="10%">领量</th>
								<th width="10%">类型</th>
							</tr>
						</thead>
						<tbody id='clearedorders'></tbody>
					</table>
				</div>


			</div>
			<!-- End row -->
		</div>
		<!-- End container -->
	</section>
	<!-- End section -->


	<!-- Start Testimonial
		=========================================== -->
		
		<section id="testimonial" class="parallax-section">
			<div class="container">
				<div class="row">				
					<div class="col-lg-12">
					
						<!-- section title -->
						<div class="sub-title text-center wow fadeInDown" data-wow-duration="500ms">
							<h3>What People Say About Us</h3>
						</div>
						<!-- /section title -->

						<!-- testimonial wrapper -->
						<div id="testimonials" class="wow fadeInUp" data-wow-duration="500ms" data-wow-delay="100ms">
						
							<!-- testimonial single -->
							<div class="item text-center">
								
								<!-- client photo -->
								<div class="client-thumb">
									<img src="img/team/client.jpg" class="img-responsive" alt="Meghna">
								</div>
								<!-- /client photo -->
								
								<!-- client info -->
								<div class="client-info">
									<div class="client-meta">
										<h3>Abul Mal Muhit</h3>
										<span>Dec 26, 2014</span>
									</div>
									<div class="client-comment">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, ex, cupiditate, error, suscipit saepe sed ea consequuntur inventore sequi sit illo.</p>
										<ul class="social-profile">
											<li><a href="#"><i class="fa fa-facebook-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin-square fa-lg"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /client info -->
							</div>
							<!-- /testimonial single -->
						
							<!-- testimonial single -->
							<div class="item text-center">
								
								<!-- client photo -->
								<div class="client-thumb">
									<img src="img/team/client.jpg" class="img-responsive" alt="Meghna">
								</div>
								<!-- /client photo -->
								
								<!-- client info -->
								<div class="client-info">
									<div class="client-meta">
										<h3>Abul Mal Muhit</h3>
										<span>Dec 26, 2014</span>
									</div>
									<div class="client-comment">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, ex, cupiditate, error, suscipit saepe sed ea consequuntur inventore sequi sit illo.</p>
										<ul class="social-profile">
											<li><a href="#"><i class="fa fa-facebook-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin-square fa-lg"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /client info -->
							</div>
							<!-- /testimonial single -->
						
							<!-- testimonial single -->
							<div class="item text-center">
								
								<!-- client photo -->
								<div class="client-thumb">
									<img src="img/team/client.jpg" class="img-responsive" alt="Meghna">
								</div>
								<!-- /client photo -->
								
								<!-- client info -->
								<div class="client-info">
									<div class="client-meta">
										<h3>Abul Mal Muhit</h3>
										<span>Dec 26, 2014</span>
									</div>
									<div class="client-comment">
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cumque, ex, cupiditate, error, suscipit saepe sed ea consequuntur inventore sequi sit illo.</p>
										<ul class="social-profile">
											<li><a href="#"><i class="fa fa-facebook-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-twitter-square fa-lg"></i></a></li>
											<li><a href="#"><i class="fa fa-linkedin-square fa-lg"></i></a></li>
										</ul>
									</div>
								</div>
								<!-- /client info -->
							</div>
							<!-- /testimonial single -->
							
						</div>		<!-- end testimonial wrapper -->
					</div> 		<!-- end col lg 12 -->
				</div>	    <!-- End row -->
			</div>       <!-- End container -->
		</section>    <!-- End Section -->
		
		
		<!--
		Start Blog Section
		=========================================== -->
				
		<section id="blog" class="bg-one">
			<div class="container">
				<div class="row">

					<!-- section title -->
					<div class="title text-center wow fadeInDown">
						<h2> Latest <span class="color">Posts</span></h2>
						<div class="border"></div>
					</div>
					<!-- /section title -->

					<div class="clearfix">
					
						<!-- single blog post -->
						<article class="col-md-3 col-sm-6 col-xs-12 clearfix wow fadeInUp" data-wow-duration="500ms">
							<div class="note">
								<div class="media-wrapper">
									<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
								</div>
								
								<div class="excerpt">
									<h3>Simple Image Post</h3>
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.</p>
									<a class="btn btn-transparent" href="single-post.html">Read more</a>
								</div>
							</div>						
						</article>
						<!-- /single blog post -->
						
						<!-- single blog post -->
						<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="200ms">
							<div class="note">
								<div id="gallery-post" class="media-wrapper">
									<div class="item">
										<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
									</div>
									<div class="item">
										<img src="img/blog/bicycle.jpg" alt="Flying bicycle" class="img-responsive">
									</div>
									<div class="item">
										<img src="img/blog/3D-beach-art.jpg" alt="3D Beach Art | Meghna" class="img-responsive">
									</div>
								</div>
								
								<div class="excerpt">
									<h3>Simple Slider Post</h3>
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.</p>
									<a class="btn btn-transparent" href="single-post.html">Read more</a>
								</div>
							</div>						
						</article>
						<!-- end single blog post -->
						
						<!-- single blog post -->
						<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="400ms">
							<div class="note">
								<div class="media-wrapper">
									<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
								</div>
								
								<div class="excerpt">
									<h3>Simple Image Post</h3>
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.</p>
									<a class="btn btn-transparent" href="single-post.html">Read more</a>
								</div>
							</div>						
						</article>
						<!-- end single blog post -->
						
						<!-- single blog post -->
						<article class="col-md-3 col-sm-6 col-xs-12 wow fadeInUp" data-wow-duration="500ms" data-wow-delay="600ms">
							<div class="note kill-margin-bottom">
								<div class="media-wrapper">
									<img src="img/blog/amazing-caves-coverimage.jpg" alt="amazing caves coverimage" class="img-responsive">
								</div>
								<div class="excerpt">
									<h3>Simple Image Post</h3>
									<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non skateboard dolor brunch.</p>
									<a class="btn btn-transparent" href="single-post.html">Read more</a>
								</div>
							</div>						
						</article>
						<!-- end single blog post -->
					</div>

					<div class="all-post text-center">
						<a class="btn btn-transparent" href="blog.html">View All Post</a>
					</div>

				</div> <!-- end row -->
			</div> <!-- end container -->
		</section> <!-- end section -->
		
		<!-- Srart Contact Us
		=========================================== -->		
		
		
		<!-- end Contact Area
		========================================== -->
		
		<footer id="footer" class="bg-one">
			<div class="container">
			    <div class="row wow fadeInUp" data-wow-duration="500ms">
					<div class="col-lg-12">
						
						<!-- Footer Social Links -->
						<div class="social-icon">
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-youtube"></i></a></li>
								<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fa fa-pinterest"></i></a></li>
							</ul>
						</div>
						<!--/. End Footer Social Links -->

						<!-- copyright -->
						<div class="copyright text-center">
							<a href="index.html">
								<img src="img/logo-meghna.png" alt="Meghna" /> 
							</a>
							<br />
							
							<p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="æ¨¡æ¿ä¹å®¶">æ¨¡æ¿ä¹å®¶</a> - Collect from <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">ç½é¡µæ¨¡æ¿</a>. Copyright &copy; 2015. All Rights Reserved.</p>
						</div>
						<!-- /copyright -->
						
					</div> <!-- end col lg 12 -->
				</div> <!-- end row -->
			</div> <!-- end container -->
		</footer> <!-- end footer -->
		
		<!-- Back to Top
		============================== -->
		<a href="javascript:;" id="scrollUp">
			<i class="fa fa-angle-up fa-2x"></i>
		</a>
		
		<!-- end Footer Area
		========================================== -->
		
		<!-- 
		Essential Scripts
		=====================================-->
		
		<!-- Main jQuery -->
		<script src="js/jquery-1.11.0.min.js"></script>
		<!-- Bootstrap 3.1 -->
		<script src="js/bootstrap.min.js"></script>
		<!-- Slitslider -->
		<script src="js/jquery.slitslider.js"></script>
		<script src="js/jquery.ba-cond.min.js"></script>
		<!-- Parallax -->
		<script src="js/jquery.parallax-1.1.3.js"></script>
		<!-- Owl Carousel -->
		<script src="js/owl.carousel.min.js"></script>
		<!-- Portfolio Filtering -->
		<script src="js/jquery.mixitup.min.js"></script>
		<!-- Custom Scrollbar -->
		<script src="js/jquery.nicescroll.min.js"></script>
		<!-- Jappear js -->
		<script src="js/jquery.appear.js"></script>
		<!-- Pie Chart -->
		<script src="js/easyPieChart.js"></script>
		<!-- jQuery Easing -->
		<script src="js/jquery.easing-1.3.pack.js"></script>
		<!-- tweetie.min -->
		<script src="js/tweetie.min.js"></script>
		<!-- Google Map API -->
		
		<!-- Highlight menu item -->
		<script src="js/jquery.nav.js"></script>
		<!-- Sticky Nav -->
		<script src="js/jquery.sticky.js"></script>
		<!-- Number Counter Script -->
		<script src="js/jquery.countTo.js"></script>
		<!-- wow.min Script -->
		<script src="js/wow.min.js"></script>
		<!-- For video responsive -->
		<script src="js/jquery.fitvids.js"></script>
		<!-- Grid js -->
		<script src="js/grid.js"></script>
		<!-- Custom js -->
		<script src="js/custom.js"></script>
		
		<!-- treetable js -->		
		<script type="text/javascript" src="js/jquery-ui.js"></script>
		<script type="text/javascript" src="js/jquery.treetable.js"></script>
		<!--图表  -->
		<script type="text/javascript" src="js/jscharts.js"></script>
		<script type="text/javascript" src="js/jscharts.plug.mb.js"></script>
		<!-- pdca操作 js -->
		<script type="text/javascript" src="js/pdca.js"></script>
		<script type="text/javascript">
		
		</script>
    </body>
</html>