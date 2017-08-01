






<!DOCTYPE html>
<html lang="ko">
<head>
	





	
	
	
	
	
	
	

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta property="og:title" content="네이버 날씨"/>
	<meta property="og:url" content="http://weather.naver.com/"/>
	<meta property="og:image" content="https://ssl.pstatic.net/static/weather/m/og_weather.png"/>
	<meta property="og:description" content="생활에 꼭 필요한 날씨와 대기환경정보"/>
	<link rel="shortcut icon" href="http://static.naver.net/www/nFavicon64.ico" type="image/x-icon">
	<title>네이버 날씨</title>
	<link rel="stylesheet" type="text/css" href="/common/css/weather_common.css?20150911">
	<link rel="stylesheet" type="text/css" href="/common/css/weather_renew.css?20150911">
	
	
	
	
		
	<!-- AU 추가 CSS -->
	<style type="text/css">
		.tab_bx.nhn_ui_panel { display: none; }
		.tab_bx.nhn_ui_selected { display: block; }
	</style>
	<!-- AU 추가 CSS -->
	<!-- AU foggy css -->
	<style type="text/css">
		div.z_select .layer_popup,
		.remove_item {
			display:none;
		}

		div.dim_new {
			position:absolute;
			left:0; top:0; padding:0; margin:0; border:0;
			width:100px; height:100px;
			background-color:white;
			opacity:0;
		}

		#favorite_region_wrapper {
			position: absolute;
			display:none;
		}
	</style>

	<!-- AU foggy css -->
	<script type="text/javascript">
		var APP = {};
		var aplDocRoot = "http://weather.naver.com";
		document.domain="naver.com";
	</script>

	<!-- nClicks -->
	<script type="text/javascript" src="/common/js/clickcr.js"></script>
	<script type="text/javascript">
		var nsc="weather.home";
		var ccsrv="cc.naver.com";
		
		
		
		
		
		
		
	</script>
	<!-- //nClicks -->

	<!-- AU 추가 script -->
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/jindo2_wcomp.js"></script>

	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/WeatherTabControl.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/WeatherMapManager.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/WeatherTabLeisureSea.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/RegionDropdown.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/RegionSelector.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/TownMainInfo.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/FoggyManager.js"></script>
	<script type="text/javascript" src="http://weather.naver.com/common/js/ajaxUI/weatherCommon.js"></script>
	<!-- AU 추가 script -->

	<script type="text/javascript">
	<!--
		var oMsg = msg.RegionSelector;
	//-->
	</script>

	<script type="text/javascript" src="/common/js/jindo.min.ns.js"></script>
	<script type="text/javascript" src="/common/js/weatherServiceCommon.js"></script>
	
	<!-- OPS방식 도움말적용  script -->
	<script type="text/javascript" src="http://static.naver.com/common/js/cs_ops_webncc.js"></script>
	
	<!-- 뉴스 GNB script -->
	<script type="text/javascript" src="/common/js/news/lnbTopNoWeather.js"></script>
	
	<!-- HTML5/CSS3 지원여부 체크 lib (Modernizr) -->
	<script type="text/javascript" src="/common/js/modernizr.min.js"></script>

	<script type="text/javascript">
		/** 동네예보 flash callback Variable */
		var naverRgnCd = "09140104";
		var sRegionCode = null;
		var browserType = "";
		
		 /**
		  * 동네예보 Flash에서 호출하는 함수
		  *
		  * 동네예보 Flash를 사용하는 위치에서
		  * townWetrURL 값이 전역 변수로 지정되어야 한다.
		  *
		  * @return 데이터경로
		  */
		function getTownWetrURL() {
			var code = sRegionCode ? sRegionCode : naverRgnCd;
			return 'http://weather.naver.com/flash/naverRgnTownFcast.nhn?naverRgnCd=' + code;
		}

		function mapSelectCurWetr(idx) {
			wMapManager.setWeatherData();
			imgSelectChange(idx);
		}

		function mapSelectChange(isToday, isAm, idx) {
			wMapManager.setWeatherData({
				code : "CT000000",
				isToday : isToday,
				isAm : isAm
			});

			imgSelectChange(idx);
			
			var selectDay = "";
			switch(idx) {
			case 1 : 
				selectDay = "현재날씨";
				break;
			case 2 :
				selectDay = "오늘오전";
				break;
			case 3 : 
				selectDay = "오늘오후";
				break;
			case 4 :
				selectDay = "내일오전";
				break;
			case 5 :
				selectDay = "내일오후";
				break;
			default : "현재날씨";
			}
			$('map_select_day').innerHTML = selectDay;
		}

		function imgSelectChange(idx) {
			var aElImg= cssquery ('.w_map li a img');

			for (var i=0, len = aElImg.length; i < len ;i++) {
				var el = aElImg[i];
				el.src = el.src.replace (/_on/, "");

				if (i + 1 == idx) {
					el.src=el.src.replace (/.gif/, "_on.gif");
				}
			}
		}

		function getFlashHTML () {
			var sCode = nhn.Flash.getCode('http://weather.naver.com/common/swf/townForecastMini_20130801.swf', {
				id : 'townForecastMini',
				width : '305',
				height : '255',
				wmode : 'transparent',
				flashVars : '',
				bgColor : '#FFFFFF',
				wheelHandler : 'flashWheelListener'
			});

			$Element ('flash_info').html ( sCode );

			return true;
		}
		
		function getAjaxHTML(naverRgnCd) {
			var townWetrReqUrl = 'http://weather.naver.com/flash/naverRgnTownFcast.nhn?m=jsonResult&naverRgnCd='+naverRgnCd;
			var townWetrAjax = new $Ajax(townWetrReqUrl, {
				type : "xhr",
				method : "post",
				onload : function(res) {
					$Element('forecast_tit').css('display', 'block');
					var jsonResult = JSON.parse(res.text());
					
					var bgLineColor = "#d3d3d3";                            // 배경 구분선 
                    var bgLineColor2 = "#d3d3d3";                           // 배경 구분선 - 날짜 
                    var txtColor = "#191919";                               // 기본 텍스트 
                    var minTempColor = "#1aa1dc";                           // 최저 온도 표시 
                    var maxTempColor = "#ff2525";                           // 최고 온도 표시 
                    var fontStyle = "10px Ghodic,Helvetica"; 

                    var lineWidth = 1;                                              // 선 두께 
                    var arcRadius = 3;                                              // 점 크기 

                    var lineNum = 15;                                               // 구분선 개수 
                    var intervalTime = 3;                                           // 시간 간격 
                    var marginTop = 20;                                             // 캔버스 내 상단 시작점 
                    var marginBottom = 10;                                          // 캔버스 내 하단 시작점 
                    var interval_X = 18;                                            // cellWidth의 간격 1 - 날짜 중간선 
                    var interval_X2 = 19;                                           // cellWidth의 간격 2 - 날짜 구분선 

                    var today = new Date(); 
                    var currentTime = today.getHours(); 

                    // 캔버스 객체 
                    var cvs = document.getElementById("canvas"); 
                    var canvasWidth = cvs.width; 
                    var canvasHeight = cvs.height; 
                    var cellWidth = canvasWidth / lineNum;          // 시간별 간격 
					
                    // 온도  
                    var arrTemp = [];
                    var startDate = "";
                    var day = "";
                    var todayCnt = jsonResult.todayColCnt;     // 오늘 시간 컬럼 카운트
                    var tmrwCnt = jsonResult.tmrwColCnt;	   // 내일 시간 컬럼 카운트
                    var atmrwCnt = jsonResult.atmrwColCnt;	   // 모레 시간 컬럼 카운트
                    var todayStartIndex = 0;
                    var tmrwStartIndex = todayCnt;
                    var atmrwStartIndex = tmrwStartIndex + tmrwCnt;
                    var currentAreaIndex = 0;
                    var windDrctn = ["S", "SW", "W", "NW", "N", "NE", "E", "SE"];
                    
                    $Element("forecast_cont").empty();  // 다른 지역 조회 시 기존 cont 영역 비우기
                    
                    for (var i = 0; i < jsonResult.townWetrs.length; i++) {
                    	objTownWetr = jsonResult.townWetrs[i];
                    	// 날씨 홈 동네날씨는 7개의 시간구간을 표시
                    	if (arrTemp.length < 7) {
							arrTemp.push(objTownWetr.tmpr);
							
							if (i == todayStartIndex || i == tmrwStartIndex || i == atmrwStartIndex) {
								if (i <= todayStartIndex && tmrwStartIndex != 0) {
									day = "오늘";
								} else if (tmrwStartIndex <= i && i < atmrwStartIndex){
									day = "내일";
								} else if (i >= atmrwStartIndex) {
									day = "모레";
								}
								$Element("forecast_cont").append('<div class="info_area" id="info_area_'+i+'"><strong class="h_date tit" id="h_date_tit_'+i+'">'+day+'</strong></div>');
								currentAreaIndex = i;
								
								if (i < todayCnt) {
									$Element("h_date_tit_"+i).addClass("today");
								}	
							}
							
							$Element("info_area_"+ currentAreaIndex).append('<ul class="forecast_lst" id="forecast_lst_'+i+'">'+
		  					 	'<li class="h_time tit" id="h_time_tit_'+i+'"><span>'+objTownWetr.hh+'</span> <span class="blind"></span></li>' +
								'<li class="h_weather"><span><img src="http://static.naver.net/weather/images/w_icon/w_s'+objTownWetr.wetrCd+'.gif" width="36" height="26" alt="'+objTownWetr.wetrTxt+'"></span></li>'+
								'<li class="h_temp"><span class="blind"></span></li>'+
								'<li class="h_rain"><div class="graph_bar"><em style="height: '+objTownWetr.rainProb+'%"><span>'+objTownWetr.rainProb+'</span></em></div></li>'+
								'<li class="h_wind"><span><i class="ic ic_v'+(windDrctn.indexOf(objTownWetr.windDrctn)+1)+'">풍향</i> <em class="txt">'+objTownWetr.windSpd+'</em></span></li>'+
								'<li class="h_humid"><div class="graph_bar"><em style="height: '+objTownWetr.humd+'%"><span>'+objTownWetr.humd+'</span></em></div></li></ul>');
							
							if (i == (todayCnt-1) || i == (tmrwStartIndex + (tmrwCnt-1)) || i == (jsonResult.townWetrs.length-1)) {
								$Element("forecast_lst_"+i).addClass("last");
							}
							if (i < todayCnt) {
								$Element("h_time_tit_"+i).addClass("today");
							}
                    	}
					}
                    
                    var maxTemp = Math.max.apply(Math, arrTemp); 
                    var minTemp = Math.min.apply(Math, arrTemp); 
                    
                    var interval_Y = Math.round((canvasHeight - (marginTop + +marginBottom)) / (maxTemp - minTemp)); 

                    if(cvs.getContext) { 
	                    var ctx = cvs.getContext("2d");
                        ctx.lineWidth = lineWidth; 
                        ctx.fillStyle = txtColor; 
                        ctx.strokeStyle = bgLineColor; 
                        ctx.font = fontStyle; 
                        ctx.textAlign = "center"; 

                        var x = 0; 
                        var y = marginTop; 

                        var timeLine = 0; 
                        var modTime = currentTime % intervalTime; 
                        if (modTime == intervalTime) { 
		                    timeLine = currentTime; 
                        } else { 
                        	timeLine = currentTime + (intervalTime - modTime); 
                        } 

                        // 1. 배경 구분선 그리기 
                        for (var i=0; i<lineNum*2; i++) { 
                            // 라인 1px로 만들기 위해 x,y 좌표에서 0.5를 뺀다 
                            var x2 = x - 0.5; 
                            ctx.beginPath(); 
                            ctx.moveTo(x2,0); 
                            ctx.lineTo(x2,canvasHeight); 
                            ctx.stroke(); 
                            ctx.closePath(); 
                        } 

                         x = 0; 
                         var temp, y2, x2;
                         var nextTemp, nextTemp_X, nextTemp_Y; 

                         // 3.온도 그래프 그리기 
                         for (var i=0; i<arrTemp.length; i++) { 
                         	temp = arrTemp[i]; 
                         	y = ((maxTemp - temp) * interval_Y) + marginTop; 

                            if (temp == maxTemp) { 
                              	y = marginTop; 
                                ctx.fillStyle = maxTempColor; 
                                ctx.font = "bold " + fontStyle; 
                            } else if (temp != minTemp) { 
                              	ctx.fillStyle = txtColor; 
                                ctx.font = fontStyle; 
                            } 
                            if (temp == minTemp) { 
                              	y = canvasHeight - marginBottom; 
                                ctx.fillStyle = minTempColor; 
                                ctx.font = "bold " + fontStyle; 
                            } else if (temp != maxTemp) { 
                              	ctx.fillStyle = txtColor; 
                                ctx.font = fontStyle; 
                            } 

                            if (i == 0){ x = x + interval_X; } 
                            else { x = x + (interval_X  + interval_X2); } 

                            // 라인 1px로 만들기 위해 x,y 좌표에서 0.5를 뺀다 
                            x2 = x - 0.5; 
                            y2 = y - 0.5; 

                            // 온도 그래프 
                            if(i+1 < arrTemp.length){ 
    	                       	// 다음 온도 좌표 구하기 
	                            nextTemp = arrTemp[i+1];
                                nextTemp_X = x2 + (interval_X  + interval_X2); 
                                nextTemp_Y = marginTop + (maxTemp - nextTemp) * interval_Y; 

                                ctx.beginPath(); 
                                ctx.moveTo(x2,y2); 
                                ctx.lineTo(x2,y2); 
                                ctx.lineTo(nextTemp_X,nextTemp_Y); 
                                ctx.stroke(); 
                                ctx.closePath(); 
                            } 

                            // 온도 점  
                            ctx.beginPath(); 
                            ctx.arc(x,y,arcRadius,Math.PI*2,0,true); 
                            ctx.fill(); 
                            ctx.closePath(); 

                            // 온도 텍스트 - 겹치지 않게 좌표보다 5px 올림 
                            ctx.fillText(temp,x,y-5); 
                    	} 
                    } 
				},
				timeout : 3,
				async : true
			});
			townWetrAjax.request();
		}
		
		function resetCanvas() {
			var cvs = document.getElementById("canvas"); 
            cvs.width = cvs.width;
            cvs.height = cvs.height;
		}

		var naverDetailRgnCd;

		var ipNaverRgnCd  = "09140104";
		var ipLareaNm = "서울특별시";
		var ipMareaNm = "중구";
		var ipSareaNm = "을지로1가";

		//var ipCityRgnCd = "";
		//var ipWareaNm = "";
		//var ipCityNm = "";

		function goCityWetrWarea(cityRgnCd) {
			location.href = "/rgn/cityWetrWarea.nhn?cityRgnCd="+cityRgnCd;
		}

		function onclickWorldCity(worldRgnCd, e){
			var cityNm;
			var evt = window.event || e;

			switch(worldRgnCd){
			case 'WDCHN00119':
				cityNm = 'beijing';
			break;
			case 'WDJPN00047':
				cityNm = 'tokyo';
			break;
			case 'WDFRA00116':
				cityNm = 'paris';
			break;
			case 'WDGBR00057':
				cityNm = 'london';
			break;
			case 'WDUSA00157':
				cityNm = 'newyork';
			break;
			case 'WDCAN00464':
				cityNm = 'vancouver';
			break;
			}
			clickcr(this,'wld.'+cityNm,worldRgnCd,'',evt);
		}

		var areaNm = "man*c";
		function setAreaNm(area){
			areaNm = area;
		}

		function onclickMainMap(clickNm, rgnId, e){
			var evt = window.event || e;

			clickcr(this,areaNm + '.' + clickNm, rgnId, '', evt);
		}

		var wMapManager = new nhn.WeatherMapManager('weatherMap', {
			mapClassName : 'main_map',
			baseURL : 'http://weather.naver.com',
			imgURL : 'https://ssl.pstatic.net/static/weather/images/w_icon/',
			oPathByMapType : {
				currentWeather : '/json/crntWetr.nhn',
				forecast : '/json/hdayFcast.nhn'
			},
			sForcastMethod :"cityRgnHdayFcast",
			doRoundTemperature : true
		});

		$Fn (function () {
			var elSelector = cssquery.getSingle('.zone_select');
			var sareaCd;

			// AjaxUI init start
			APP.info = new nhn.TownMainInfo( cssquery.getSingle ('div.m_zone1'), {
				requestURL : 'http://weather.naver.com/json/crntWetrDetail.nhn',
				imgURL : 'https://ssl.pstatic.net/static/weather/images/w_icon/',
				flashURL : 'http://weather.naver.com/common/swf/townForecastMini_20130801.swf',
				paramName : 'naverRgnCd'
			});
			// AjaxUI init end

			APP.selector = new nhn.RegionSelector(cssquery.getSingle('.zone_select'), {
				baseURL : 'http://weather.naver.com/json/rgnCat.nhn',
				defaultRegionCode : ipNaverRgnCd,
				selectedNames : {
					larea : ipLareaNm,
					marea : ipMareaNm,
					sarea : ipSareaNm
				}
			}).attach({
				SetSareaCd : function () {
					sRegionCode = this.getSelectedSareaByObject ().code;
				},
				submit : function () {
					var oSarea = this.getSelectedSareaByObject ();
					if (oSarea) {
						location.href = "/rgn/townWetr.nhn?naverRgnCd="+oSarea.code; // 최종 행정 구역을 선택했다면 세부 정보 보기
					}
					else {
						alert (oMsg.dontSelectLarea);	// 광역시·도, 시·군·구, 동·읍·면 순으로 선택해주세요
					}
				}
			});

			wMapManager.setWeatherData();
			APP.info.requestData (naverRgnCd);
			
			if (Modernizr.canvas) {
				/* HTML5 canvas 지원 브라우저*/
				getAjaxHTML(naverRgnCd);
			} else {
				/* HTML5 canvas 미지원 브라우저의 경우 기존 플래시 영역 노출 */ 
				getFlashHTML();
			}

		}).attach (document, 'domready');
	</script>

	<script type="text/javascript">
		$Fn (function () {
			var welHelp = $Element ('areaWetrHelp');
			//show and hide
			$Fn (function (e) {
				//e.stop();			0610 삭제
				welHelp.toggle();
			}).attach ($('btn_area_wetr_help'), 'click');

			//close
			$Fn (function (e) {
				e.stop();
				if (e.element.tagName == "IMG" || e.element.tagName == "A") {
					welHelp.hide();
				}
			}).attach (welHelp.$value(), 'click');

			$Fn (function (e) {
				if (e.element == $('btn_area_wetr_help')) {
					e.stop();
					return;
				}
				else {
					//welHelp.hide();
				}		//0601 추가.

			}).attach (document, 'click');
		}).attach (document, 'domready');
	</script>
	<script type="text/javascript">
		function locationErrPop() {
			var width = "445";
			var height = "448";
			//LeftPosition = (screen.width)?(screen.width-width)/2:100;
			//TopPosition = (screen.height)?(screen.height-height)/2:100;
			LeftPosition = Math.ceil((window.screen.width - width)/2);
			TopPosition = Math.ceil((window.screen.height - height)/2);
			url = "http://fdback.ngine.naver.com";
			winOpts="menubar=no,toolbar=no,location=no,status=no,scrollbars=no,width="+width+",height="+height+",resizable=no,left="+LeftPosition+",top="+TopPosition;
			
			window.open(url, '', winOpts);
		}
		
		function changeRegionWetr() {
			if (sRegionCode != null) {
				APP.info.requestData (sRegionCode);
				if (Modernizr.canvas) {
					resetCanvas();
					getAjaxHTML(sRegionCode);
					document.getElementById("weeklyWetr_info").setAttribute("href",'http://weather.naver.com/rgn/cityWetrCity.nhn?naverRgnCd='+sRegionCode);
					document.getElementById("townDetail_info").setAttribute("href",'http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd='+sRegionCode);
				} else {
					getFlashHTML();
					document.getElementById("weeklyWetr_info").setAttribute("href",'http://weather.naver.com/rgn/cityWetrCity.nhn?naverRgnCd='+sRegionCode);
					document.getElementById("townDetail_info").setAttribute("href",'http://weather.naver.com/rgn/townWetr.nhn?naverRgnCd='+sRegionCode);
				}
			}
		}
	</script>
</head>
<body>
<div id="wrap">
	<!-- 레이어 - 딤처리 -->
	<!-- <div class="dim_new"></div> -->
	<!-- 스킵네비게이션 -->
    <div id="u_skip">
    	<a href="#lnb"><span>메인 메뉴로 바로가기</span></a>
        <a href="#content"><span>본문으로 바로가기</span></a>
    </div>
    <!-- //스킵네비게이션 -->
	<!-- header -->
	<div id="header">
		





	<script type="text/javascript">
	//	function newsSearch(frm) {
	//		document.charset='euc-kr';
	//		window.onbeforeunload = function () {document.charset='utf-8';};
	//	}

		isMobileOver = false;
		
		function onMobileOver() {
			isMobileOver = true;
			window.setTimeout(showPlusMobile, 500);

		}
		
		function onMobileOut() {
			isMobileOver = false;
			window.setTimeout(hidePlusMobile, 1);
		}
		
		function showPlusMobile() {
			if (isMobileOver) {
				document.getElementById("plusMobile").style.display="block";
				document.getElementById("ie6Mobile").style.display="block";
			}
		}
		
		function hidePlusMobile() {
			if (isMobileOver == false) {
				document.getElementById("plusMobile").style.display="none";
				document.getElementById("ie6Mobile").style.display="none";
			}
		}

		function mobilePreview(){
			// 팝업창의 크기
			var nWidth = 375;
			var nHeight = 645;
			
			// popup 윈도우의 위치
			var nLeft = screen.availWidth - nWidth;
			var nTop = (screen.availHeight - nHeight)/2;
			var wId = window.open('http://mobile.naver.com/service/popup_iphone.nhn?url=htts://m.weather.naver.com','mobile_preview','top='+nTop+',left='+nLeft+',resizable=no,width='+nWidth+',height=' + nHeight);

			wId.focus();
		} 

		function blockChk() { 
			var aa = "http://webmsg.naver.com/popup_send/send_url.php?code=weather&SMSID=ESW00017&MMSID=EMG00005"; 
			var smsPopup = window.open(aa,"pop_alert","toolbar=no,scrollbars=no ,width=285,height=402,top=100,left=100"); 
			smsPopup.focus();
			return; 
		}

		// 공통GNB관련 변수 선언부 
		var gnb_service="weather";
		var gnb_template="gnb_utf8";
		var gnb_logout="http://weather.naver.com";
		var gnb_brightness=1 ;
		var gnb_item_hide_option= 0;
	</script>
	
	<div class="weather_gnb_wrap">
		<div id="gnb">
			<script type="text/javascript" charset="utf-8" src="http://static.gn.naver.net/template/gnb_utf8.nhn?2017080113"></script>
		</div>
	</div>
	
	<!-- <iframe title="GNB" id="gnb_box" name="gnb_new" src="http://gn.naver.com/?tmpl=210" width="100%" height="22" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe> -->

	<div id="snb_wrap">
		<h1><a href="http://www.naver.com/" onclick="clickcr(this,'STA.naverlogo','','',event)"><img src="http://static.naver.com/weather/images/bi_naver.gif" width="73" height="25" alt="NAVER"></a>
		<a href="http://weather.naver.com" onclick="clickcr(this,'STA.weather','','',event)"><img src="http://static.naver.com/common/snb/090513/h_weather.gif" width="39" height="25" alt="날씨" title="날씨"></a></h1>

		<ul class="snb_related_service">
		<li><a href="http://news.naver.com" onclick="clickcr(this,'STA.news','','',event)"><img src="http://static.news.naver.net/image/news/2013/03/snb_h_news.gif"width="26" height="13" alt="뉴스"></a></li>
		<li><a href="http://newsstand.naver.com" onclick="clickcr(this,'STA.newsstand','','',event)"><img src="http://static.news.naver.net/image/news/2013/05/snb_h_newsstand.gif" width="61" height="13" alt="뉴스스탠드"></a></li>		
		<li><a href="http://sports.news.naver.com/" onclick="clickcr(this,'STA.sports','','',event)"><img src="http://static.news.naver.net/image/news/2013/03/snb_h_sports.gif" width="38" height="13" alt="스포츠"></a></li>
		</ul>
	</div>
	<div class="lnb">
		<span class="lnb_date"><strong>08</strong>.<strong>01.</strong><span class="day">(화)</span></span>
		
			
			
				
 <div class="lnb_today">
	<h3><a href="http://news.naver.com/main/history/mainnews/index.nhn" class="nclicks(nct.main)" title="이 시각 주요뉴스 배열 이력">주요뉴스</a></h3>
	<div id="lnb.mainnews">
		
		<ul>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=101&oid=003&aid=0008099216" class="nclicks(nct.maintxt,,1)" title = "폭염·폭우에 '반값' 고강도 대책…밥상물가 잡힐까">폭염·폭우에 '반값' 고강도 대책…밥상물가 잡힐까</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=101&oid=421&aid=0002869143" class="nclicks(nct.maintxt,,2)" title = "부동산 대책 2일 발표한다…투기과열지구·다주택자 규제 유력 ">부동산 대책 2일 발표한다…투기과열지구·다주택자 규제…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009447181" class="nclicks(nct.maintxt,,3)" title = "적십자회담도 불발…정부 &quot;이산가족문제 해결 노력&quot;">적십자회담도 불발…정부 &quot;이산가족문제 해결 노력&quot;</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009447451" class="nclicks(nct.maintxt,,4)" title = "與 &quot;어떤 경우에도 北과 대화&quot;…野 &quot;대북정책 전면 재검토..&quot;">與 &quot;어떤 경우에도 北과 대화&quot;…野 &quot;대북정책 전면 재검…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=103&oid=422&aid=0000269615" class="nclicks(nct.maintxt,,5)" title = "기세 올리는 무더위…서울 등 곳곳 '폭염'">기세 올리는 무더위…서울 등 곳곳 '폭염'</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009447547" class="nclicks(nct.maintxt,,6)" title = "이총리 &quot;국무위원, 정부 정확한 입장 알고 소통해야&quot;">이총리 &quot;국무위원, 정부 정확한 입장 알고 소통해야&quot;</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=103&oid=016&aid=0001271980" class="nclicks(nct.maintxt,,7)" title = "예보 틀리고 특보 늦고…기상청 &quot;어찌하오리까&quot; 울상">예보 틀리고 특보 늦고…기상청 &quot;어찌하오리까&quot; 울상</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=103&oid=079&aid=0002995590" class="nclicks(nct.maintxt,,8)" title = "블랙리스트 조사위 &quot;피해자로 둔갑한 가해자 밝혀낼 것&quot;">블랙리스트 조사위 &quot;피해자로 둔갑한 가해자 밝혀낼 것&quot;</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=421&aid=0002869478" class="nclicks(nct.maintxt,,9)" title = "공무원 육아휴직수당, 첫 3개월간 2배로 인상…월봉급액..">공무원 육아휴직수당, 첫 3개월간 2배로 인상…월봉급액.…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=101&oid=277&aid=0004046338" class="nclicks(nct.maintxt,,10)" title = "강남에 슈퍼리치 36% 거주…&quot;첫 부동산 구입은 강남 아파트&quot;">강남에 슈퍼리치 36% 거주…&quot;첫 부동산 구입은 강남 아파…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=104&oid=001&aid=0009447522" class="nclicks(nct.maintxt,,11)" title = "시진핑 &quot;당에 軍 절대복종…실전 군대 만들자&quot;">시진핑 &quot;당에 軍 절대복종…실전 군대 만들자&quot;</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=105&oid=421&aid=0002869469" class="nclicks(nct.maintxt,,12)" title = "&quot;취미·레저용 드론 20종 중 8개, 폭발·발화 위험&quot;">&quot;취미·레저용 드론 20종 중 8개, 폭발·발화 위험&quot;</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=421&aid=0002869455" class="nclicks(nct.maintxt,,13)" title = "경찰 '부안여고 성추행 사건' 일단락…교사 2명 검찰 송치">경찰 '부안여고 성추행 사건' 일단락…교사 2명 검찰 송…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009446957" class="nclicks(nct.maintxt,,14)" title = "홍준표 &quot;본처라고 우겨 본들 첩은 첩&quot;…바른정당 폄하">홍준표 &quot;본처라고 우겨 본들 첩은 첩&quot;…바른정당 폄하</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009447100" class="nclicks(nct.maintxt,,15)" title = "국방부, '부인 갑질' 의혹 제기된 육군대장 감사 착수">국방부, '부인 갑질' 의혹 제기된 육군대장 감사 착수</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=101&oid=055&aid=0000554373" class="nclicks(nct.maintxt,,16)" title = "할증기준 이하 경미한 사고에 보험료 42% 급등 이유는?">할증기준 이하 경미한 사고에 보험료 42% 급등 이유는?</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=001&aid=0009447262" class="nclicks(nct.maintxt,,17)" title = "&quot;잘못 가르쳐서&quot;…중학교 교사가 기말고사 답안 몰래 고쳐">&quot;잘못 가르쳐서&quot;…중학교 교사가 기말고사 답안 몰래 고…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=001&aid=0009447103" class="nclicks(nct.maintxt,,18)" title = "檢 중간간부 인사 내주 가닥…전공·기수파괴 '예고'">檢 중간간부 인사 내주 가닥…전공·기수파괴 '예고'</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=101&oid=008&aid=0003912971" class="nclicks(nct.maintxt,,19)" title = "SK·한화·CJ 등 대기업 몸집 불려…한달새 계열사 9개 증가">SK·한화·CJ 등 대기업 몸집 불려…한달새 계열사 9개…</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=100&oid=001&aid=0009447059" class="nclicks(nct.maintxt,,20)" title = "中 신화통신, 美 압박에 &quot;분풀이 대상 잘못 찾았다&quot; 반박">中 신화통신, 美 압박에 &quot;분풀이 대상 잘못 찾았다&quot; 반박</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=104&oid=055&aid=0000554457" class="nclicks(nct.maintxt,,21)" title = " 美 궁중 암투 어디까지…'웨스트 윙' 권력 다툼"> 美 궁중 암투 어디까지…'웨스트 윙' 권력 다툼</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=032&aid=0002807320" class="nclicks(nct.maintxt,,22)" title = "'어린왕자'의 바오밥나무, 국내에서 처음으로 꽃 피웠다">'어린왕자'의 바오밥나무, 국내에서 처음으로 꽃 피웠다</a>
			</li>
		
			<li>
			
			<a href="http://news.naver.com/main/read.nhn?mode=LSD&mid=shm&sid1=102&oid=023&aid=0003301853" class="nclicks(nct.maintxt,,23)" title = "자사고&#8231;외고 폐지 소식에 '비평준 일반고'로 몰려드는..">자사고&#8231;외고 폐지 소식에 '비평준 일반고'로 몰려…</a>
			</li>
		
		</ul>
		
	</div>
</div>
<ul class="lnb_side" tabindex="0">
<li>
<a href="http://news.naver.com/main/hotissue/sectionList.nhn?mid=hot&sid1=110&cid=1019690" class="nclicks(nct.right1)"
title="상식in뉴스"
>상식in뉴스
</a>
</li>
<li>
<a href="http://news.naver.com/main/officeList.nhn" class="nclicks(nct.right2)"
title="언론사 뉴스"
>언론사 뉴스
</a>
</li>
<li>
<a href="http://newslibrary.naver.com/search/searchByDate.nhn" class="nclicks(nct.right3)"
title="라이브러리"
target="_blank">라이브러리
</a>
</li>
<li class="end">
<a href="http://news.naver.com/main/history/mainnews/index.nhn" class="nclicks(nct.right4)"
title="이 시각 주요뉴스 배열 이력"
>기사배열 이력
</a>
</li>
</ul>


			
		
	</div>
	
<script type="text/javascript">
	//GNB영역 외부를 클릭했을때 GNB Layer 닫기
	$Fn(function(we){
		if(!$Element(we.element).isChildOf("gnb_my_lyr") && !$Element(we.element).isChildOf("gnb_lst")){
			gnbAllLayerClose();
		}
	}).attach($Element(document), "click");
</script>

	</div>

	<div id="container">
		<!-- left area -->
		<div class="snb">
			







<script type="text/javascript" src="/common/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="/common/js/json2.js"></script>

<script type="text/javascript">
var j = jQuery.noConflict();
var memberId = "";

j(document).ready(function(){
	if (memberId == null || memberId == "") {
		fn_noLogin();	
	} else {
		j.ajax({
			type : "POST"
			, async : true
			, url : "/nidapi/interest_area_api.nhn"
			, dataType : "json"
			, data : {
				mode : "getListWithSvcForCache"
				, id : memberId
				, svc_cd : "002"
			}
			, cache : false
			, success : function(responseData) {
				var concernRgnCnt = responseData.result.length;
				
				if (concernRgnCnt == 0) {
					fn_emptyConcernRgn();
				} else {
					fn_JsonParser(responseData);
				}
			}, error : function(resultData) {
				
			}
		});	
	}
});

function fn_JsonParser(responseData) {
	j.ajax({
		type : "POST"
		, async : true
		, url : "/common/concernArea.nhn"
		, dataType : "html"
		, data : {
			"jsonResult" : JSON.stringify(responseData) 
		}
		, cache : false
		, success : function(data) {
			j('#concernArea').html(data);
		}
	});
}

function fn_noLogin() {
	j('#concernArea').html('<div class="lst" style="display:block"><div class="alert">로그인 후 이용해 주세요.</div></div>');
}

function fn_emptyConcernRgn() {
	j('#concernArea').html('<div class="lst" style="display:block"><div class="alert2">관심지역 설정이<br>필요합니다.</div></div>');
}

function concernRgnPopup() {
	var rurl = 'http://weather.naver.com/common/blankPopup.nhn';
	var name = "관심지역설정";
	window.open(rurl, name, "toolbar=no,location=no,menubar=no,scrollbals=yes,status=no,resizable=no");
}

function concernHelpShow() {
	var helpHtml = '<div class="ly_dsc" style="display:none">'
		+ '<p>관심지역 설정 기능이 로그인을<br>하지 않아도 사용하실 수 있게<br>개선될 예정이며, 기존<br>설정하신 지역이 유지되지 않을<br>수 있으니 참고 바랍니다.</p>'
		+ '<a href="javascript:concernHelpHide();" title="닫기" class="close"><span>닫기</span></a>'
		+ '</div>';
	
	if(!j('#concernArea div').is('.ly_dsc')){
		j('#concernArea div.lst').prepend(helpHtml);
	}
	j('#concernArea div.ly_dsc').attr('style', 'display:block').attr('style');
}

function concernHelpHide() {
	j('#concernArea div.ly_dsc').attr('style', 'display:none').attr('style');
}

</script>
<!-- LNB -->
<div id="lnb" class="lnb_out">
	<h2><a href="/main/wetrMain.nhn" onclick="clickcr(this,'men.title','','',event)" class="select">날씨 홈</a></h2> 
             <!-- [D] 선택메뉴 <li>에 class="on" (1,2depth 모두) --> 
	
	<ul class="lnb">
		
			
			
				<li><a href="/rgn/cityWetrMain.nhn" onclick="clickcr(this,'men.local','','',event)" class="w_type1"><span>지역별 날씨</span></a></li>
			
		
		
		
			
			
				<li><a href="/period/weeklyFcast.nhn" onclick="clickcr(this,'men.week','','',event)" class="w_type2"><span>기간별 날씨</span></a></li>
			
		
		
		
			
			
				<li><a href="/news/wetrNewsList.nhn" onclick="clickcr(this,'men.news','','',event)" class="w_type3"><span>뉴스,기상특보</span></a></li>
			
		

		
						
			
				<li><a href="/photo/satPhoto.nhn?photoType=IR&photoRgn=L" onclick="clickcr(this,'men.sat','','',event)" class="w_type4"><span>날씨영상</span></a></li>
			
		
		
		
			
			
				<li><a href="/life/lifeNdx.nhn?cityRgnCd=CT001000" onclick="clickcr(this,'men.life','','',event)" class="w_type5"><span>생활정보</span></a></li>
			
		
		
		
			
			
				<li><a href="/world/worldWetrCtnt.nhn?worldRgnCd=WD00000004" onclick="clickcr(this,'men.wld','','',event)" class="w_type6"><span>세계날씨</span></a></li>	
			
		
		
		
			
			
				<li class="last"><a href="/air/airFcast.nhn" onclick="clickcr(this,'men.air','','',event)" class="w_type7"><span>대기환경정보</span></a></li>
			
		
			
	</ul>
</div>

<!-- 관심지역 설정/내가 찾아본 동네 -->
<div class="village_out">
	<div class="tit">
		<h3><img src="https://ssl.pstatic.net/static/weather/images/h3_zone_weather.gif" width="61" height="11" alt="관심지역 날씨"></h3>
		<a href="javascript:concernHelpShow();" title="도움말" class="help">도움말</a>
		
	</div>
	<div id="concernArea"></div>
	<!-- 내가 찾아본 동네 -->
	<div class="tit t2">
		<h3><img src="https://ssl.pstatic.net/static/weather/images/h3_view_village.gif" width="73" height="11" alt="내가 찾아본 동네"></h3>
		<span><a href="" id="btn_help" onclick="clickcr(this,'vst.help','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/btn_help.gif" width="14" height="14" alt="내가 찾아본 동네 : 도움말"></a></span>
	</div>
	<div class="lst_out">
		<!-- 도움말 레이어 -->
		<div id="layer_bubble_out" class="layer_bubble" style="display:none; top:-5px; left:0px;">
			<div class="layer_content">
				<!-- Layer Content -->
				<div class="layer_body">
					<h5>내가 찾아본 동네</h5>
					<ul>
					<li>동네별 날씨를 확인한 다음 다시 접속하면 [내가 찾아본 동네]에 날씨 정보가 나타납니다 . [내가 찾아본 동네]에 나타나는 지역은 <span>최대 5개</span>입니다.</li>
					<li style="margin-top:7px;">내가 찾아본 동네가 관심 지역으로 등록된 지역이면<br>
						[관심 지역 날씨]에 날씨 정보가 나타납니다.</li>
					<li style="margin-top:7px;">행정구역변경으로 지역구분 및 지역명에 변동이 있을<br>
						경우,&nbsp;&nbsp;내가 찾아본 동네에서 삭제될 수 있습니다.</li><!-- 100702 추가 -->
					</ul>
					<h6>내가 찾아본 동네를 삭제하는 방법</h6>
					<ul>
					<li>컴퓨터에 저장된 쿠키를 삭제한 다음 새 창에서 다시<br>
						접속하십시오.</li>
					 <li style="margin-top:3px;"><em class="txt_ip">Internet Explorer</em>에서는 <span>[도구 &gt; 인터넷 옵션]</span> 메뉴를 
                             	선택한 다음 <span>[검색 기록]</span>의 <span>[삭제]</span> 버튼을 눌러 쿠키를 
						삭제할 수 있습니다.</li>
					</ul>
				</div>
				<a href="#" class="close_layer"><img src="http://static.naver.com/weather/images/btn_layer_close.gif" alt="레이어닫기" width="12" height="12"></a>
				<!-- //Layer Content -->
			</div>
			<span class="shadow shadow2"></span>
		</div>
		<!-- //도움말 레이어 -->
		<div class="lst" style="display:none;" id="tracedRgn">
			<table cellpadding="0" cellspacing="0" border="0">
			<caption class="blind">내가 찾아본 동네 날씨 목록</caption>
			<col><col width="36"><col width="30">
			<tbody>
			
			</tbody>
			</table>
		</div>
	</div>
	<!-- //내가 찾아본 동네 -->
</div>
<!-- 배너 -->
<!-- 392669_thumb_DA.jpg -->
<!-- http://mobile.naver.com/mobileweb/weather.nhn -->
<!-- 도움말 -->
<div class="img_mrgn"><a href="#" onclick="clickcr(this,'lef.help','','',event); OPS.viewOPS('ops', {url : 'https://help.naver.com/support/service/main.nhn',  param : 'serviceNo=5843&categoryNo=13449'}); return false;" title="새 창"><img src="https://ssl.pstatic.net/static/weather/images/img_left_help.gif" width="145" height="28" alt="네이버 고객센터 날씨 : 도움말"></a></div>
<!-- 자료제공 -->
<div id="banner_wi" class="img_mrgn"><a href="http://www.weatheri.co.kr/" onclick="clickcr(this,'lef.banner','','',event)" target="_blank"><img src="http://static.naver.com/weather/images/img_left_weatheri.gif" width="145" height="33" alt="자료제공 - weatheri"></a></div>
<div id="banner_kw" class="img_mrgn"><a href="http://www.kweather.co.kr/" onclick="clickcr(this,'lef.banner','','',event)" target="_blank"><img src="http://static.naver.com/weather/images/img_left_kweather_v1.gif" width="145" height="33" alt="자료제공 - kweather"></a></div>
<div id="banner_aw" style="display: none;" class="img_mrgn"><a href="http://www.accuweather.com/ " onclick="clickcr(this,'lef.banner','','',event)" target="_blank"><img src="http://static.naver.net/weather/images/logo_accuweather.gif" width="145" height="33" alt="자료제공 - accuweather"></a></div>
<div id="banner_wn" style="display: none;" class="img_mrgn"><a href="https://global.weathernews.com/?language=ko" onclick="clickcr(this,'lef.banner','','',event)" target="_blank"><img src="http://static.naver.net/weather/images/logo_weathernews.gif" width="145" height="33" alt="자료제공 - weathernews"></a></div>
<script type="text/javascript">
	var path = location.pathname;
	if(path.indexOf("/world/") >= 0){
		$Element("banner_wi").hide();
		$Element("banner_kw").hide();
		$Element("banner_aw").show();
		$Element("banner_wn").show();
	}
	if(path.indexOf("/main/") >= 0 || path.localeCompare("/") == 0){
		$Element("banner_wi").show();
		$Element("banner_kw").show();
		$Element("banner_aw").show();
		$Element("banner_wn").show();
	}
</script>			
		</div>
		<!-- //left area -->

		<!-- content -->
		<div id="content">
		<!-- 날씨정보(지도) -->
		<div class="weather_info">
			<!-- 전국 지도 -->
			<div class="w_map">
				<ul class="tab">
				<li><a href="#a_whtr" onclick="mapSelectCurWetr(1); setAreaNm('man*c'); clickcr(this,'man.cur','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/tab_w_1_on.gif" width="51" height="20" alt="현재날씨"></a></li>
				<li><a href="#a_whtr" onclick="mapSelectChange(true, true, 2); setAreaNm('man*t'); clickcr(this,'man.today1','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/tab_w_2.gif" width="51" height="20" alt="오늘오전"></a></li>
				<li><a href="#a_whtr" onclick="mapSelectChange(true, false, 3); setAreaNm('man*T'); clickcr(this,'man.today2','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/tab_w_3.gif" width="51" height="20" alt="오늘오후"></a></li>
				<li><a href="#a_whtr" onclick="mapSelectChange(false, true, 4); setAreaNm('man*m'); clickcr(this,'man.tomorrow1','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/tab_w_4.gif" width="51" height="20" alt="내일오전"></a></li>
				<li><a href="#a_whtr" onclick="mapSelectChange(false, false, 5); setAreaNm('man*M'); clickcr(this,'man.tomorrow2','','',event); return false;"><img src="https://ssl.pstatic.net/static/weather/images/tab_w_5.gif" width="51" height="20" alt="내일오후"></a></li>
				</ul>
				<h4 id="map_select_day">현재날씨</h4>
				<!-- 지도 영역 -->
				<div class="main_map" id="weatherMap">
					<!-- 서울/경기 -->
					<a href="#" id="m_CT001000" class="zone z1" onClick="javascript:goCityWetrWarea('CT001000');onclickMainMap('capitol','CT001000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 서해5도 -->
					<a href="#" id="m_CT002000" class="zone z2" onClick="javascript:goCityWetrWarea('CT002000');onclickMainMap('west5','CT002000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 영서 -->
					<a href="#" id="m_CT003000" class="zone z3" onClick="javascript:goCityWetrWarea('CT003000');onclickMainMap('youngseo','CT003000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 영동 -->
					<a href="#" id="m_CT004000" class="zone z4" onClick="javascript:goCityWetrWarea('CT004000');onclickMainMap('youngdong','CT004000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 충북 -->
					<a href="#" id="m_CT005000" class="zone z5" onClick="javascript:goCityWetrWarea('CT005000');onclickMainMap('chungbuk','CT005000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 충남 -->
					<a href="#" id="m_CT006000" class="zone z6" onClick="javascript:goCityWetrWarea('CT006000');onclickMainMap('chungnam','CT006000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 경북 -->
					<a href="#" id="m_CT007000" class="zone z7" onClick="javascript:goCityWetrWarea('CT007000');onclickMainMap('gyungbuk','CT007000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 경남 -->
					<a href="#" id="m_CT008000" class="zone z8" onClick="javascript:goCityWetrWarea('CT008000');onclickMainMap('gyungnam','CT008000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 울릉/독도 -->
					<a href="#" id="m_CT009000" class="zone z9" onClick="javascript:goCityWetrWarea('CT009000');onclickMainMap('dokdo','CT009000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 전북 -->
					<a href="#" id="m_CT010000" class="zone z10" onClick="javascript:goCityWetrWarea('CT010000');onclickMainMap('chunbuk','CT010000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 전남 -->
					<a href="#" id="m_CT011000" class="zone z11" onClick="javascript:goCityWetrWarea('CT011000');onclickMainMap('chunnam','CT011000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 제주도 -->
					<a href="#" id="m_CT012000" class="zone z12" onClick="javascript:goCityWetrWarea('CT012000');onclickMainMap('jeju','CT012000',event);">
						<span class="ico"></span>
						<span class="temp"></span>
					</a>
					<!-- 현재시간 -->
					<div class="date" id="sTime"></div>

				</div>
				<!-- //지도 영역 -->
			</div>
			<!-- 날씨 정보 -->
			<div class="w_info">
				<!-- 현재 지역 -->
				
				<div class="now_zone">
				<!-- 
					<span></span>
					<img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s.gif" width="36" height="26" alt="">
					<span class="temp"><strong></strong>℃</span>
					
					<span>현재</span>
				-->
				</div>
				 
				<!-- 날씨 최신 뉴스 -->
				<dl class="w_news2">
				<dt><img src="https://ssl.pstatic.net/static/weather/images/h4_weather_news.gif" width="41" height="11" alt="날씨뉴스">
					<a href="/news/wetrNewsList.nhn" onclick="clickcr(this,'man.tonews','','',event)">
						<img src="http://static.naver.com/weather/images/txt_more.gif" width="31" height="9" alt="더보기">
					</a>
				</dt>
				
				<dd>
					<p class="thum">
						<a href="http://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=248&oid=056&aid=0010488314" onclick="clickcr(this,'man.tvimage','056_0010488314','1',event)"><img src="http://imgnews.naver.net/image/thumb100/056/2017/08/01/10488314.jpg" width="88" height="66" alt="날씨 뉴스 동영상 섬네일"></a>
					</p>
					<ul class="text">
						<li class="tit">
						<a href="http://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=248&oid=056&aid=0010488314" onclick="clickcr(this,'man.tvimage','056_0010488314','1',event)">전국 곳곳 소나기…폭염 특보...</a></li>
						<li class="date">KBS 뉴스<img src="https://ssl.pstatic.net/static/weather/images/bar1.gif" width="1" height="7" alt=""><span>2017.08.01.</span></li>
					</ul>
				</dd>
				
				<dd>
					<!-- 날씨 뉴스 리스트 -->
					<ul class="news_list">
					
						
						<li><a href="http://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=248&oid=052&aid=0001041245" onclick="clickcr(this,'man.tv','052_0001041245','1',event)">[날씨] 서울 등 중북부·남부 폭...</a></li>
						
					
						
						<li><a href="http://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=248&oid=421&aid=0002868729" onclick="clickcr(this,'man.tv','421_0002868729','2',event)">[오늘의 날씨] 강원(1일, 화)</a></li>
						
					
						
						<li><a href="http://news.naver.com/main/read.nhn?mode=LS2D&mid=sec&sid1=103&sid2=248&oid=052&aid=0001041126" onclick="clickcr(this,'man.tv','052_0001041126','3',event)">[날씨] 오늘 오전까지 국지성 호...</a></li>
						
					
					</ul>
				</dd>
				</dl>
				<!-- 기상특보 -->
				<div class="w_nflash_list">
					<img src="https://ssl.pstatic.net/static/weather/images/ico_newsflash.gif" width="45" height="16" alt="기상특보" class="w_icon">
					<div class="w_nflash">
						<div id="RollingTest1" class="rolling_list_area">
							<ul>
								 
	                            <li> 
	                                <a href="/news/wetrSrptList.nhn?sortOrder=1" onclick="clickcr(this,'man.toflash','','',event)" title="폭염주의보 발표"> 
	                                    <strong>폭염주의보 발표</strong> 
	                                    <em>08.01. 13:00</em> 
	                                    <span>(1) 폭염주의보 발표 : 세종, 부산, 대전, 인천(옹진군 제외), 경상남도(남해, 고성...</span> 
	                                </a> 
	                            </li> 
	                             
	                            <li> 
	                                <a href="/news/wetrSrptList.nhn?sortOrder=2" onclick="clickcr(this,'man.toflash','','',event)" title="폭염주의보 발표"> 
	                                    <strong>폭염주의보 발표</strong> 
	                                    <em>08.01. 10:00</em> 
	                                    <span>(1) 폭염주의보 발표 : 광주, 서울, 제주도(제주도남부), 경상남도(진주, 양산, 사천...</span> 
	                                </a> 
	                            </li> 
	                            
	                    	</ul> 
						</div>
					</div>
				</div>
				<!-- //기상특보 -->
				<ul class="w_wicon">
				<li class="fir"><a href="/period/weeklyFcast.nhn" onclick="clickcr(this,'man.toweek','','',event)"><img src="https://ssl.pstatic.net/static/weather/images/img_w_info1_1.gif" width="61" height="42" alt="주간예보"></a></li>
				<li class="sec"><a href="/life/sunRiseSetView.nhn" onclick="clickcr(this,'man.tosun','','',event)"><img src="https://ssl.pstatic.net/static/weather/images/img_w_info2_1.gif" width="61" height="42" alt="일출일몰시간"></a></li>
				<li><a href="/life/wetrClsrmIcon.nhn" onclick="clickcr(this,'man.toicon','','',event)"><img src="https://ssl.pstatic.net/static/weather/images/img_w_info3_1.gif" width="61" height="42" alt="날씨아이콘"></a></li>
				</ul>
				<!-- //100629 기상특보 -->
			</div>
		</div>
		
				
		
		
		
		
		<div class="section">
			<div class="news_air">
				<a href="/air/airFcast.nhn">
					<img src="http://dthumb.phinf.naver.net/?type=w1&amp;src=http://image.rmcnmv.naver.net/ncr/2017/08/01/151/531C05F3D319F3BC95337E0C93290C13681_muploader_k_480P_854_1024_128_logo.jpg&amp;twidth=128&theight=72" alt="오늘(화) 전국 대기 ‘청정’…자외선 주의!">
					<strong>오늘의 대기환경</strong>
					<p>안녕하세요. 에어가드K 공기지능센터에서 전해드리는 대기오염 예보입니다. 오늘도 전국의 대기질 청정합니다. 단, 무더위...</p>	
					<span class="og">2017.08.01. 케이웨더</span>
				</a>
			</div>
		</div>
		
		
		
		
		
					
		
		<!-- 090814 -->
		<div class="zone_weather">
			<div class="tit">
				<h3 class="tit_main"><img src="https://ssl.pstatic.net/static/weather/images/h3_zone_weather2.gif" width="63" height="13" alt="지역별 날씨"></h3>
				<span><a href="" id="btn_area_wetr_help" onclick="return false;"><img src="http://static.naver.com/weather/images/btn_help.gif" width="14" height="14" alt="지역별 날씨 노출의 원칙 : 도움말"></a></span>
				<!-- 도움말 레이어 -->
				<div id="areaWetrHelp" class="layer_zone" style="display:none; top:45px; *top:39px; left:0; ">
					<div class="layer_content">
						<span class="layer_arr"><img src="http://static.naver.com/weather/images/layer_arr.gif" alt="" width="11" height="6"></span>
						<!-- Layer Content -->
						<div class="layer_body">
							<h5>지역별 날씨 노출의 원칙</h5>
							<ul>
							<li>네이버 날씨서비스에서 날씨를 조회한  <span>‘최근접속지역’</span> 날씨가  최우선 노출됩니다.</li>
							<li>최근 접속 지역이 없을 경우, <span>‘기본 제공지역’</span> (서울 중구 을지로 1가)이 대체 노출됩니다.</li>
							<li><span>‘최근접속지역’ 은  브라우저 쿠키정보를 기반으로 제공됩니다.</span><br>
							따라서 다른 컴퓨터에서 접속하거나, 브라우저 쿠키를 삭제한 경우 실제 최근 접속지역과 <br>
							다른 지역이 노출될 수 있습니다.</li> 
							<li><span>자주보는 지역은 좌측 상단의 ‘관심지역’ 날씨를 활용하실 수 있습니다.</span><br>
							로그인 후 관심지역을 등록하시면, 로그인 상태에서 쿠키상태나 브라우저와 상관없이 <br>
							원하는 지역의 날씨를 빠르게 조회하실 수 있습니다.</li> 
							</ul>
						</div>
						<a href="javascript:tggleArearWetrHelp();" class="close_layer"><img src="http://static.naver.com/weather/images/btn_x2.gif" alt="레이어닫기" width="10" height="9"></a>
						<!-- //Layer Content -->
					</div>
				<span class="shadow shadow2"></span>
				</div>
				<!-- //도움말 레이어 -->				
			</div>
		</div>
		<div class="zone_select">
			<div class="z_select">
				<div id="region_larea_header" class="ipt">
					<a href="#" class="input_zone" style="width:61px">광역시/도</a><span class="show"></span>
				</div>
				<div id="region_marea_header" class="ipt">
					<a href="#" class="input_zone" style="width:85px">시/군/구</a><span class="show"></span>
				</div>
				<div id="region_sarea_header" class="ipt">
					<a href="#" class="input_zone" style="width:93px">동/면/읍</a><span class="show"></span>
				</div>
				<!-- Layer -->
				<div id="region_larea_list_wrapper" class="layer_popup" style="left:64px; top:33px; display:none;">
					<div class="mini_content">
						<!-- Layer Content -->
						<div class="mini_body">
							<!-- 광역시/도 -->
							<ul id="region_larea_list" class="sel1"></ul>
						</div>
						<a href="#" class="mini_close"><img src="https://ssl.pstatic.net/static/weather/images/btn_x.gif" alt="레이어닫기" width="15" height="14"></a>
					</div>
					<span class="shadow shadow1"></span><span class="shadow shadow2"></span><span class="shadow shadow3"></span>
				</div>
				<div id="region_marea_list_wrapper" class="layer_popup" style="left:64px; top:33px; display:none;">
					<div class="mini_content">
					<!-- Layer Content -->
					<div class="mini_body">
						<!-- 시/군/구 -->
						<div class="mini_scroll">
						<ul id="region_marea_list" class="sel2"></ul>
						</div>
						<!-- 시/군/구 -->
					</div>
					<a href="#" class="mini_close"><img src="https://ssl.pstatic.net/static/weather/images/btn_x.gif" alt="레이어닫기" width="15" height="14"></a>
					<!-- //Layer Content -->
					</div>
					<span class="shadow shadow1"></span><span class="shadow shadow2"></span><span class="shadow shadow3"></span>
				</div>
				<div id="region_sarea_list_wrapper" class="layer_popup" style="left:64px; top:33px; display:none;">
					<div class="mini_content">
					<!-- Layer Content -->
					<div class="mini_body">
						<!-- 동/읍/면 -->
						<div class="mini_scroll">
						<ul id="region_sarea_list" class="sel2"></ul>
						</div>
						<!-- 동/읍/면 -->
					</div>
					<a href="#" class="mini_close"><img src="https://ssl.pstatic.net/static/weather/images/btn_x.gif" alt="레이어닫기" width="15" height="14"></a>
					<!-- //Layer Content -->
					</div>
					<span class="shadow shadow1"></span><span class="shadow shadow2"></span><span class="shadow shadow3"></span>
				</div>
				<!-- //Layer -->
			</div>
			<span class="btn_inquire"><a href="javascript:changeRegionWetr();"><img src="https://ssl.pstatic.net/static/weather/images/btn_search.gif" width="35" height="22" alt="지역별 날씨 지역 선택 조회"></a></span>
			<span class="btn_view"><a id="nhn_ui_submit" href="#a_whtr" title="서울특별시 중구 을지로1가" class="btn_submit" onclick="clickcr(this,'vil.view1','','',event)"><img src="https://ssl.pstatic.net/static/weather/images/btn_view.gif" width="73" height="22" alt="자세히 보기"></a></span>
		</div>
		<!-- 현재지점/동네별 -->
		<div class="m_zone1">
			<h4 class="regionMarea">중구 <span>현재 지점의 날씨를 알려드립니다.</span></h4>
			<table cellpadding="0" cellspacing="0" border="0" class="m_tbl">
			<caption class="blind"><span id="crntRgnNm">중구</span>의 현재지점 날씨</caption>
			<col width="48"><col width="32"><col width="45"><col width="149">
			<tbody>
			<tr class="now">
				<th scope="row">현재<br><span class="date">(08.01.)</span></th>
				<td colspan="2" class="ico"><img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_l2.gif" width="64" height="46" alt=""></td>
				<td class="info">구름조금
					<p>기온 <span class="temp"><strong>32</strong>℃</span>
					
						
						
							<span class="form"></span>
							<span class="temp2"><strong>-</strong><span class="temp3"></span></span>
						
					
					<br>
					
								
					
						
						
						<span class="_temp3">
							어제보다
							
							
							<span class="temp temp3"><strong>+6</strong>℃</span>
							
							
							
						</span>	
						
					
					
					
					
					</p>
				</td>
			</tr>
			
				<tr class="line">
					<th scope="row" rowspan="2">오늘<br><span class="date">(08.01.)</span></th>
					<td class="time">오전</td>

					<td class="ico"><img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" width="36" height="26" alt=""></td>
					<td class="info">흐리고 가끔 비
						<p>기온 <span class="temp"><strong>25</strong>℃</span>
						강수확률 <span class="temp2"><strong>70</strong>%</span></p>
					</td>
				</tr>

				<tr>
					<td class="time">오후</td>
					<td class="ico"><img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" width="36" height="26" alt=""></td>
					<td class="info">구름많음
						<p>기온 <span class="temp"><strong>32</strong>℃</span>
						강수확률 <span class="temp2"><strong>20</strong>%</span></p>
					</td>
				</tr>
			
				<tr class="line">
					<th scope="row" rowspan="2">내일<br><span class="date">(08.02.)</span></th>
					<td class="time">오전</td>

					<td class="ico"><img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" width="36" height="26" alt=""></td>
					<td class="info">구름많음
						<p>기온 <span class="temp"><strong>26</strong>℃</span>
						강수확률 <span class="temp2"><strong>20</strong>%</span></p>
					</td>
				</tr>

				<tr>
					<td class="time">오후</td>
					<td class="ico"><img src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" width="36" height="26" alt=""></td>
					<td class="info">구름많고 한때 비
						<p>기온 <span class="temp"><strong>33</strong>℃</span>
						강수확률 <span class="temp2"><strong>60</strong>%</span></p>
					</td>
				</tr>
			
			</tbody>
			</table>
			<p class="link"><a id="weeklyWetr_info" href="/rgn/cityWetrCity.nhn?naverRgnCd=09140104" onclick="clickcr(this,'vil.week','','',event);" >주간 예보 확인</a></p>
		</div>
		<div class="m_zone2">

			<h4 class="regionSarea">을지로1가 <span>3시간 단위 동네별 날씨예보입니다.</span></h4>
			<div class="weather_graph ty_sml" id="flash_info">
				<div class="forecast_tit" id="forecast_tit" style="display:none;">
					<ul>
						<li class="h_date"><span>날짜</span></li>
						<li class="h_time"><span>시간</span></li>
						<li class="h_weather"><span>날씨</span></li>
						<li class="h_temp"><span>기온<br>
							<em>(&#176;C)</em></span></li>
						<li class="h_rain"><span>강수<br>확률<br>
							<em>(%)</em></span></li>
						<li class="h_wind"><span>풍향<br>풍속<br>
							<em>(m/s)</em></span></li>
						<li class="h_humid"><span>습도<br>
							<em>(%)</em></span></li>
					</ul>
				</div>
				<div class="forecast_cont" id="forecast_cont">
				</div>
				<canvas id="canvas" width="258" height="68" class="canvas_graph"> 
            	    <p>No canvas support.</p> 
                </canvas> 
			</div>
						<p class="link"><a id="townDetail_info" href="/rgn/townWetr.nhn?naverRgnCd=09140104" onclick="clickcr(this,'vil.view2','','',event);">동네별 날씨 확인</a></p>
		</div>

		<!-- 재해재난 -->
		<!-- "재해재난 ON/OFF" 일 경우에 대한 처리 -->
		<div class="weather_disaster" style=
											
											"display:none;"
											>
			
			
				<h3><img src="http://static.naver.com/n/local/208/disaster/h_disaster.gif" width="178" height="13" alt="지금 우리 도시/동네 상황을 알려주세요"></h3>
				<div class="state_alert">
					<p class="st"><img src="https://ssl.pstatic.net/static/weather/images/h_statealert.gif" width="202" height="42" alt="우리주변 피해지역의 현장상황을 알려주세요!"></p>
					<p class="txt"><img src="https://ssl.pstatic.net/static/weather/images/txt_statealert.gif" width="257" height="43" alt="지금 내가 있는 도시나 동네의 기상상태, 현장 상황 등을 문서, 사진, 동영상 등으로 공유해주시면 해당 지역 또는 인근 지역의 주민들에게 큰 도움이 될 수 있습니다."></p>
					<a href="http://www.naver.com/include/disaster_board3.html" class="btn_alert" target="_new"><img src="https://ssl.pstatic.net/static/weather/images/btn_statealert.gif" width="96" height="96" alt="현장상황 전달하기"></a>
				</div>
			
			
			
		</div>
		<!-- //재해재난 -->
		<!-- 오늘의 세계 날씨 -->
		<div class="today_world">
			<div class="tw_tit">
				<h3><img src="https://ssl.pstatic.net/static/weather/images/h3_today_world.gif" width="87" height="13" alt="오늘의 세계날씨"></h3>

				<a href="/world/worldWetrCtnt.nhn?worldRgnCd=WD00000004" onclick="clickcr(this,'wld.more','','',event)">
					<img src="http://static.naver.com/weather/images/txt_more.gif" width="31" height="9" alt="더보기">
				</a>
			</div>
			<ul class="td_list">
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDCHN00119" onclick="onclickWorldCity('WDCHN00119', event);">베이징</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l3.gif" width="64" height="46" alt="흐림"></p>
					<p>흐림<br><span><strong>
						
							
							
									30
							
						
					</strong>℃</span></p>
				</li>
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDJPN00047" onclick="onclickWorldCity('WDJPN00047', event);">도쿄</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l4.gif" width="64" height="46" alt="비"></p>
					<p>비<br><span><strong>
						
							
							
									29
							
						
					</strong>℃</span></p>
				</li>
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDFRA00116" onclick="onclickWorldCity('WDFRA00116', event);">파리</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l1.gif" width="64" height="46" alt="맑음"></p>
					<p>맑음<br><span><strong>
						
							
							
									16
							
						
					</strong>℃</span></p>
				</li>
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDGBR00057" onclick="onclickWorldCity('WDGBR00057', event);">런던</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l1.gif" width="64" height="46" alt="맑음"></p>
					<p>맑음<br><span><strong>
						
							
							
									14
							
						
					</strong>℃</span></p>
				</li>
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDUSA00157" onclick="onclickWorldCity('WDUSA00157', event);">뉴욕</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l1.gif" width="64" height="46" alt="맑음"></p>
					<p>맑음<br><span><strong>
						
							
							
									25
							
						
					</strong>℃</span></p>
				</li>
			
				<li>
					<span class="city"><a href="/world/worldWetrCity.nhn?worldRgnCd=WDCAN00464" onclick="onclickWorldCity('WDCAN00464', event);">밴쿠버</a></span>
					<p class="ico"><img src="http://static.naver.com/weather/images/w_icon/w_l2.gif" width="64" height="46" alt="구름조금"></p>
					<p>구름조금<br><span><strong>
						
							
							
									24
							
						
					</strong>℃</span></p>
				</li>
			
			</ul>
		</div>

		</div>
		<!-- //content -->

		<!-- right area -->
		<div class="aside">
			






			<!-- 레저날씨 -->
			<div class="rt_leisure">
				<h4><img src="http://static.naver.com/weather/images/h4_rt_leisure.gif" width="43" height="12" alt="레저날씨"></h4>
				<ul class="lst">
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSMT001" onclick="clickcr(this,'les.mt','LSMT001','',event)">산</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSBC001" onclick="clickcr(this,'les.beach','LSBC001','',event)">해수욕장</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSBB001" onclick="clickcr(this,'les.baseball','LSBB001','',event)">야구장</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSFB018" onclick="clickcr(this,'les.football','LSFB018','',event)">축구장</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSAP001" onclick="clickcr(this,'les.air','LSAP001','',event)">공항</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSSR001" onclick="clickcr(this,'les.ski','LSSR001','',event)">스키장</a></li>
				<li><a href="/rgn/lsurWetrOthers.nhn?lsurRgnCd=LSGF001" onclick="clickcr(this,'les.golf','LSGF001','',event)">골프장</a></li>
				<!-- <li><a href="/rgn/lsurWetrHwayMain.nhn" onclick="clickcr(this,'les.hw','','',event)">고속도로</a></li> -->
				</ul>
			</div>
			<!-- 지난 날씨 달력 -->
			<div class="rt_calendar">
				<h4><img src="http://static.naver.com/weather/images/h4_rt_last_calendar.gif" width="66" height="12" alt="지난 날씨 달력"></h4>
				<form name="past" method="get" action="" target="_top">
				<input type="hidden" name="ym">
				<table width="176" cellspacing="0" cellpadding="0">
				<caption class="blind">도시,년도 선택목록</caption>
				<tr>
				<td align="left">
					<label for="pastAddr1" class="blind">지역</label>
					<select name='upperNaverRgnCd' id='pastAddr1' style='width:84px;height:18px' >
					<option value="09" >서울특별시</option>
					<option value="17" >세종특별자치시</option>
					<option value="08" >부산광역시</option>
					<option value="11" >인천광역시</option>
					<option value="06" >대구광역시</option>
					<option value="05" >광주광역시</option>
					<option value="07" >대전광역시</option>
					<option value="10" >울산광역시</option>
					<option value="01" >강원도</option>
					<option value="02" >경기도</option>
					<option value="16" >충청북도</option>
					<option value="15" >충청남도</option>
					<option value="04" >경상북도</option>
					<option value="03" >경상남도</option>
					<option value="13" >전라북도</option>
					<option value="12" >전라남도</option>
					<option value="14" >제주도</option>
					</select>
					<label for="pastYear" class="blind">연도</label>			
					<select id="pastYear" name="year" style="width:84px;height:18px" onChange='chk_month()'>
					</select>
				</td>
				</tr>
				<tr><td height="7"></td></tr>
				</table>
				</form>
				<script type="text/javascript">
					var year = '2017';
					var f = document.past;
	
					for(var i=year; i>=2002; i--)
					{
						var nIndex = f.year.length;
						f.year.options[nIndex] = new Option(i+'년', i);
					}
				</script>	
				<table width="177" cellspacing="1"  cellpadding="0" class="calendar">
					<tr align="center">
						<td id='m_1' width="43" height="26">1월</td>
						<td id='m_2' width="43" height="26">2월</td>
						<td id='m_3' width="43" height="26">3월</td>
						<td id='m_4' width="44" height="26">4월</td>
					</tr>
					<tr align="center">
						<td id='m_5' width="43" height="26">5월</td>
						<td id='m_6' width="43" height="26">6월</td>
						<td id='m_7' width="43" height="26">7월</td>
						<td id='m_8' width="44" height="26">8월</td>
					</tr>
					<tr align="center">
						<td id='m_9' width="43" height="26">9월</td>
						<td id='m_10' width="43" height="26">10월</td>
						<td id='m_11' width="43" height="26">11월</td>
						<td id='m_12' width="44" height="26">12월</td>
					</tr>
				</table>

				<script type="text/javascript">
				function past_go(obj, month, e) {					
					var frm = document.past;
					var ym = frm.year.value + (month < 10 ? '0' : '') + month;			
					var upperNaverRgnCd = frm.upperNaverRgnCd.value;
					var evt = window.event || e;

					clickcr(obj,'pst.month', frm.upperNaverRgnCd.value, ym ,evt);

					obj.href = '/period/pastWetrMain.nhn?ym='+ym+'&upperNaverRgnCd='+upperNaverRgnCd;				
				}
				
				function chk_month()
				{	
					var date1 = new Date('2017','7','1');
					time1 = date1.getTime();
					yy = document.past.year.value;
	
					for(i = 1; i <= 12; i++)
					{
						var date2 = new Date(yy, i - 1);
						var time2 = date2.getTime();
						if(time1 - time2 > 0)
						{
							no_link = false;
							obj = document.getElementById('m_' + i);
							obj.style.backgroundColor = '';
							obj.innerHTML = "<a href=\"#\" onclick=\"past_go(this, " + i +", event);\" class='gray03'>" + i + "월</a>";
						}
						else
						{
							no_link = true;
							obj = document.getElementById('m_' + i);
							obj.style.backgroundColor = '#FFFFFF';
							obj.innerHTML = "<span style='color:#989898'>" +i + "월</span>";
						}
					}
				}
				chk_month();
				</script>
			</div>

		</div>
		<!-- //right area -->
	</div>

	<!-- footer area -->
	<div id="footer">
		




<!-- Footer 090928-->
	<ul>
	<li class="frst"><a href="http://www.naver.com/rules/service.html" onclick="clickcr(this,'fot.service','','',event)" target="_blank">이용약관</a></li>
	<li><a href="http://www.naver.com/rules/privacy.html" onclick="clickcr(this,'fot.privacy','','',event)" target="_blank"><strong>개인정보처리방침</strong></a></li>
	<li><a href="http://www.naver.com/rules/disclaimer.html" onclick="clickcr(this,'fot.disclaimer','','',event)" target="_blank">책임의 한계와 법적고지</a></li>
	<li><a href="https://help.naver.com/support/service/main.nhn?serviceNo=5843" onclick="clickcr(this,'fot.whelp','','',event)" target="_blank">날씨 고객센터</a></li>
	</ul>
	<p class="copy">본 콘텐츠의 저작권은 제공처에 있으며, 이를 무단 이용하는 경우 저작권법 등에 따라 법적책임을 질 수 있습니다.</p>
	<address>
		<a class="logo" href="http://nhncorp.com/" onclick="clickcr(this,'fot.nhn','','',event)" target="_blank"><img alt="naver" src="http://static.naver.com/common/footer/ci_naver.gif" width="63" height="11" alt="NAVER"></a>
		<em>Copyright &copy;</em>
		<a href="http://nhncorp.com/" onclick="clickcr(this,'fot.nhn','','',event)" target="_blank">NAVER Corp.</a>
		<span>All Rights Reserved.</span>
	</address>
<!--//Footer 090928-->

	<!-- AU Favorite Region -->
	<script type="text/javascript">
		$Fn (function () {
			//------------------------------------
			// help

			var welHelp = $Element ( 'layer_bubble_out');
			//show and hide
			$Fn (function (e) {
				//e.stop();			0610 삭제
				welHelp.toggle();
				if($('tracedRgn').style.display == "none"
					&& $('tracedRgn').getElementsByTagName('tr').length != 0 ) {
					$('tracedRgn').style.display = 'block';
				}
			}).attach ($('btn_help'), 'click')

			//close
			$Fn (function (e) {
				e.stop();
				if (e.element.tagName == "IMG" || e.element.tagName == "A") {
					welHelp.hide();
					if($('tracedRgn').getElementsByTagName('tr').length != 0 ){
						$('tracedRgn').style.display = 'block';
					}
				}
			}).attach (welHelp.$value(), 'click');

			$Fn (function (e) {
				if (e.element == $('btn_help')) {
					e.stop();
					return;
				}
				else {
					//welHelp.hide();
					if($('tracedRgn').getElementsByTagName('tr').length != 0 ){
						$('tracedRgn').style.display = 'block';
					}
				}		//0601 추가.

			}).attach (document, 'click');
		}).attach (document, 'domready');
	</script>
	<!-- AU Favorite Region -->
	<script type="text/javascript" src="/common/js/lcslog.js"></script>
	<script type="text/javascript">
		lcs_do();
		getGNB();
	</script>

	</div>
	<!-- //footer area -->
</div>

<script type="text/javascript" src="/common/js/allowSwfForChrome.js"></script> 
<script type="text/javascript"> 
	allowSwfForChrome.allow("http://weather.naver.com/common/swf/chromeFlashRestrictionEscape.swf", 305, 255);
</script> 
<script type="text/javascript" src="/common/js/jindo_component.js"></script>
<script type="text/javascript">
// <![CDATA[
	var vert, vert2;
	window.onload = function() {
		var eULItem1 = jindo.$$.getSingle('.rolling_list_area > ul');

		if( eULItem1 != null){
			var weULItem1 = jindo.$Element(eULItem1);
			
			var aItem1 = jindo.$$('li',eULItem1);
			
			var nItemLength = aItem1.length;
			
			//제목의 기준으로 1보다 크면 룰링이 됩니다. 
			if(nItemLength > 1 ){
				var nIdx = 0;
				var vs = new jindo.Timer();
				vs.start(function() {
					//첫번째 child를 삭제하고 제일 마지막에 붙이는 방식으로 진행.
					weULItem1.remove(aItem1[nIdx]);
					weULItem1.append(aItem1[nIdx] || '');
					nIdx = (nIdx+1)%(nItemLength);
					return true;
				}, 2000);
				//마우스 오버 시에 타이머 일시정지.
				jindo.$Fn(function(e){
					vs.pause(); 
				}).attach(eULItem1, "mouseover");
				
				//마우스 아웃 시에 타이머 재가동.
				jindo.$Fn(function(e){
					vs.resume(); 
				}).attach(eULItem1, "mouseout");
			}
		}//End if( elList1 != null && elList2 != null)
	};

// ]]>
</script>		
<!-- // Ajax UI End. -->
</body>
</html>
