<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
	<link href="common.css" rel="stylesheet"> 
 	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>
	function chk(){
		if(cc == 1){
			$(".menu_bar .gnb_bg").slideDown(0);
			$(".menu_bar ul li ul").css("display","block").slideDown(0);
			$(".two_depth").slideDown(0);
			$(".two_depth ul").css("opacity","1");
			$(".two_depth ul").css("height","auto");
			$(".two_depth ul").css("transition","all .1s .1s ease-in-out");
			$(".two_depth ul").css("-webkit-transition","all .1s .1s ease-in-out");
			$(".two_depth ul").css("transform","translateY(0)");
			$(".two_depth ul").css("-webkit-transform","translateY(0)");
		}else{
			$(".menu_bar .gnb_bg").slideUp(0);
			$(".two_depth").slideUp(0);
			$(".two_depth ul").css("opacity","0");
			$(".two_depth ul").css("height","1px");
			$(".two_depth ul").css("transition","all .1s .1s ease-in-out");
			$(".two_depth ul").css("-webkit-transition","all .1s .1s ease-in-out");
			$(".two_depth ul").css("transform","translateY(30px)");
			$(".two_depth ul").css("-webkit-transform","translateY(30px)");
		}
		}
		$(function(){
		$('.menu_area').mouseover(function(){
			setTimeout(chk, 100);
			cc = 1;
			$(this).addClass('active');
		});
		$('.menu_area').mouseout(function(){
			setTimeout(chk, 400);
			cc = 0;
			$('#menu_area ul li').removeClass('active');
		});
		$('.menu_area ul li a').focus(function(){
			setTimeout(chk, 100);
			cc = 1;
			$(this).parent().addClass('active');
		});
		$('.menu_area ul li a').blur(function(){
			setTimeout(chk, 100);
			cc = 0;
			$('#menu_area ul li').removeClass('active');
		});
		});
		$(function(){
		$(".menu_area > ul > li").mouseenter(function(){
			$(this).find(" > a").addClass("active");
		});
		$(".menu_area > ul > li").mouseleave(function(){
			$(this).find(" > a").removeClass("active");
		});
		});
	</script>
	<style>
.swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    .swiper-slide img {
      display: block;
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .autoplay-progress {
      position: absolute;
      right: 16px;
      bottom: 16px;
      z-index: 10;
      width: 48px;
      height: 48px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
      color: var(--swiper-theme-color);
    }

    .autoplay-progress svg {
      --progress: 0;
      position: absolute;
      left: 0;
      top: 0px;
      z-index: 10;
      width: 100%;
      height: 100%;
      stroke-width: 4px;
      stroke: var(--swiper-theme-color);
      fill: none;
      stroke-dashoffset: calc(125.6 * (1 - var(--progress)));
      stroke-dasharray: 125.6;
      transform: rotate(-90deg);
    }	
</style>

<div id="wrap">
		<!--메뉴 시작-->
		<div class="header_top" style="height:40px; background: #8C8C8C"></div>
		<div class="header">
			<div class="top_bar">
				<div class="wsize">
					<div class="logo">
					<h1><a href="#"><img src="img/logo_4.png"></a></h1>
					</div>
					<ul class="aside_menu">
						<li class="login"><a href="#">로그인</a></li>
						<li class="join"><a href="#">회원가입</a></li>
					</ul>
				</div>
			</div>
			<div class="menu_bar">
				<div class="menu_area active">
					<div class="gnb_bg" style="display: none;"></div>
				<ul>
					<li><a href="#">자료검색</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">이용안내</a>
						<div class="two_depth">
								<p class="bmenu_tit">이용안내</p>
								<ul>	
									<li><a href="#" >열람실 이용안내
									</a></li>
									<li><a href="#" >성수도서관 VR 투어
									</a></li>
									<li><a href="#" >회원가입 안내
									</a></li>
									<li><a href="#" >도서대출/반납
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">디지털도서관</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">문화마당</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">이용자마당</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">큐레이션</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">도서관소개</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
					<li><a href="#">나의도서관</a>
						<div class="two_depth">
								<p class="bmenu_tit">자료검색</p>
								<ul>	
									<li><a href="#" >통합자료 검색
									</a></li>
									<li><a href="#" >신착자료 검색
									</a></li>
									<li><a href="#" >대출 베스트
									</a></li>
									<li><a href="#" >정기간행물
									</a></li>
								</ul>
						</div>
					</li>
				</ul>
				</div>
			</div>
			







