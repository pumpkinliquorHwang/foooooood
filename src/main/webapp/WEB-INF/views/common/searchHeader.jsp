<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<%
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic+Coding:400,700&amp;subset=korean" rel="stylesheet">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>finalproject</title>
<style>

body{
font-family: 'Nanum Gothic Coding', monospace;

}
div#map{height:1px;weight:1px;visibility: hidden;}

div.newsletter div.search1{text-align:center; margin-top:0.25%;}   
btn:active{color:blue;}
div.newsletter div.search1 .btn{background-color:#F6F6F6; }
div.newsletter div.search1 .btn:hover{background-color:red; color:white;}
#japan:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/??????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:144px;
 }
  #pran:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/???????????????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:134px;
 }
 #chicken:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/??????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:74px;
 }
  #pizza:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/??????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:74px;
 }
 #china:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/?????????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:74px;
 }
 #korea:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/??????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:74px;
 }
 #bossam:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/??????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:124px;
 }
 #bunsik:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/?????????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:74px;
 }
  #dessert:hover{cursor:pointer;
 	background:url("${path}/resources/images/customer/menuBtn/?????????.png");
    height:auto;
    animation:walk 1s steps(1) infinite,
                forward 0s linear infinite;
    text-indent:-10000px;
    width:94px;
 }
div.group{text-align:center; box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.4);background-color:#F6F6F6; margin-top:1%; padding:0; display:none;}
div.group1{text-align:center;box-shadow: 0px 0px 5px 1px rgba(0, 0, 0, 0.4);padding:0;background-color:#F6F6F6;} 
div.newsletter,div.group{display:inline-block;}
 @media (max-width:843px){
	div.group{
	 display:none; 
	}
	
}
@media (min-width:843px){
	div.group1{
	
	display:none;
	}
	
} 
#memberHeaderTitle1:hover{
 	cursor:pointer;
 	background:url("${path}/resources/images/owner/main/???????????????2.gif");
 	 width:100px;
    height:70px;
    animation:walk 1s steps(200) infinite,
                forward 18s linear infinite;
 }
 @keyframes walk{
    0%{
        background-position: 0px;
    }
    100%{
        background-position: 258px;
    }
}


</style>
</head>
<body>





<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c&libraries=services"></script> 




   
   <script>
  
   
   
   $(document).ready(function(){
   $("button").click(function(){
    var sBtn = $(".group");    //  ul > li ?????? sBtn?????? ?????????. (?????????????????? li??? ?????? ??????.)
    sBtn.find("button").click(function(){   // sBtn??? ?????? ??????  a ?????? ?????? ??????.
     sBtn.removeClass("active");     // sBtn ?????? (active) ???????????? ?????? ??????.
     $(this).parent().addClass("active"); // ????????? a??? (active)???????????? ?????????.
    });
   });
   });

   
   
   
   
   
   
   
   $(function(){
	   $('#memberHeaderTitle1').hover(function(){
		   $('#memberHeaderTitle1').css({"width":"270"});
		   $('#memberHeaderTitle2').hide();
		   $('#memberHeaderTitle1').click(function(){
			   location.href="${path}/member/main.do";
		   });
	   },
	  	function(){
		 	$('#memberHeaderTitle2').show();
		 	$('#memberHeaderTitle1').css({"width":"300"});
	   });
   });
   
    $(document).ready(function () {
      $("#positionBtn").click(function(){
    	  
    	  if(${sessionScope.logined==null}){
    		  alert("???????????? ??????????????????");
    		  location.href="${path }/customer/login.do";
    	  }else{
            function getLocation() {
                if (navigator.geolocation) { // GPS??? ????????????
                    navigator.geolocation.getCurrentPosition(function(position) {
                     var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;
                    
                    
                    var coords = new daum.maps.LatLng(latitude);
                    var coords1 = new daum.maps.LatLng(longitude); 
                    
                    $('#lat').val(coords1.jb); // ??????
                    $('#lng').val(coords.jb)// ??????
                    
                    console.log(coords1.jb);//??????
                    console.log(coords.jb);//??????
                     
                        var mapContainer = document.getElementById('map'), // ????????? ????????? div 
                     mapOption = {
                        center: new daum.maps.LatLng(latitude, longitude), // ????????? ????????????
                        level: 3 // ????????? ?????? ??????
                    };   
                        function resizeMap() {
                            var mapContainer = document.getElementById('map');
                            mapContainer.style.width = '1px';
                            mapContainer.style.height = '1px'; 
                        }
                        function relayout() {    
                            map.relayout();
                        }

                      //??????-?????? ?????? ????????? ???????????????
                      var geocoder = new daum.maps.services.Geocoder();
                      
                    
                      //????????? ???????????????    
                     var map = new daum.maps.Map(mapContainer, mapOption);  

                      searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                 
              function searchAddrFromCoords(coords, callback) {
          	    // ????????? ????????? ?????? ????????? ????????????
          	   geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                }
                      
               function displayCenterInfo(result, status) {
            	    if (status === daum.maps.services.Status.OK) {

            	        for(var i = 0; i < result.length; i++) {
            	            // ???????????? region_type ?????? 'H' ?????????
            	            if (result[i].region_type === 'H') {
            	            	$('#location1').val(result[i].address_name); 
            	          
            	                break;
            	            }
            	        }
            	    }    
            	}
                    
               function searchDetailAddrFromCoords(coords, callback) {
                   // ????????? ????????? ?????? ?????? ????????? ???????????????
                   geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                 
               }

                     }, function(error) {
                       console.error(error);
                     }, {
                       enableHighAccuracy: true,
                       maximumAge: 0,
                       timeout: Infinity
                     });
                } else {
                  alert('GPS??? ???????????? ????????????');
                }
              }
              getLocation();   
    	  }
      }); 
      
}); 
     
   
   
   
   
   
   //?????? ?????? ??????
   
       var geocoder = new daum.maps.services.Geocoder();
  
 
    function execDaumPostcode() {
    	if(${sessionScope.logined==null}){
    		alert("???????????? ??????????????????");
    		location.href="${path }/customer/login.do";
    	}else{
    		
         new daum.Postcode({ 
            oncomplete: function(data) {
                // ??? ????????? ?????? ????????? ?????? ????????? ????????????.
                // ???????????? ????????? ?????? ?????? ????????? ??????('')?????? ????????????, ?????? ???????????? ?????? ??????.
                var fullAddr = data.address; // ?????? ?????? ??????
                var extraAddr = ''; // ????????? ?????? ??????
 
                // ?????? ????????? ????????? ???????????? ????????????.
                if(data.addressType === 'R'){
                    //??????????????? ?????? ?????? ????????????.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // ???????????? ?????? ?????? ????????????.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // ?????????????????? ????????? ?????? ????????? ????????? ???????????? ?????? ????????? ?????????.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // ?????? ????????? ?????? ????????? ?????????.
              $('#location1').val(fullAddr);
                // ????????? ?????? ????????? ??????
                geocoder.addressSearch(data.address, function(results, status) {
                    // ??????????????? ????????? ???????????????
                    if (status === daum.maps.services.Status.OK) {
 
                        var result = results[0]; //????????? ????????? ?????? ??????
 
                        // ?????? ????????? ?????? ????????? ?????????
                          
                        
                        
                    var coords = new daum.maps.LatLng(result.x);
                    var coords1 = new daum.maps.LatLng(result.y); 
                    
                    $('#lat').val(coords.jb); // ??????
                    $('#lng').val(coords1.jb)// ??????
                    
                    console.log(coords.jb);//??????
                    console.log(coords1.jb);//??????
                     
                    }
                });
            }
         }).open(); 
    } 
    }
  



  //??????????????? ????????? ????????????
    function mainpage(){
       location.href="${path}/member/main.do";
    }
  
   function locationSearchStore(){
		 if(${sessionScope.logined==null}){
			 alert("????????? ??? ??????????????????");
			 location.href="${path }/customer/login.do";
		 	return false;
		 }
			return true;
	 }
	 
   

   
   </script>

                  <div id="map" style="width:0.1px;height:0.1px;"></div>   


       
        <div class="newsletter" style="margin-bottom:80px"> 
                <div id="hd container">             
                <div class="row" >           
                <div class="col-sm-12 headerDiv2">
              <div class="headerDiv1">
               <c:if test="${sessionScope.logined==null }">
               <a href="${path }/owner/ownerMain.do">????????? ?????????</a>
                 <a href="${path }/customer/login.do">?????????</a>
                    <a href="${path }/member/memberEnroll.do">????????????</a>
                   
              </c:if> 
               <c:if test="${sessionScope.logined!=null}">
               <a href="${path }/customer/logout.do">????????????</a>
               <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}">???????????????</a>
               
             
              </c:if> 
              </div>
              <form action="${path}/customer/searchmenuView" onsubmit="return locationSearchStore()" method="post">
                    <div class="content1">
                       <h2 id='memberHeaderTitle1' style="margin:auto; width:300px;"><span id="memberHeaderTitle2" onclick="mainpage();" style="cursor:pointer;"><img src="${path }/resources/images/owner/main/???????????????.png" width=70px;/><span style="color:white; font-weight:bold;">???</span><span style="font-size:16px;">?????????</span> <span style="color:white; font-weight:bold;">???</span><span style="font-size:16px;">??????</span> <span style="color:white; font-weight:bold;">???</span><span style="font-size:16px;">???</span></span></h2>
                    </div>
                </div>
             <div class="col-sm-12">	
                  <div class="content">
                  <div class="input-group">
                       <a style="cursor:pointer;" id="positionBtn"><img id="locationImg" src="${path }/resources/images/place.png" onmouseover="this.src='${path}/resources/images/placeHover.png'" onmouseout="this.src='${path }/resources/images/place.png'"></a>
                       <input type="hidden" value="${sessionScope.lat }" name="lat" id="lat"/>
 						<input type="hidden" value="${sessionScope.lng }" name="lng" id="lng"/>
 						<input type="hidden" value="??????" name="category"/>   
                    <input type="text" id="location1" onclick="execDaumPostcode();" name="myAddr" value="${sessionScope.myAddr }" class="form-control" placeholder="??????????????? ???????????? ??????????????????"  readonly/>
                       <span class="input-group-btn">
                       
                       <button class="btn" onclick="locationSearchStore();" type="submit">??????</button>

                       </span>
                  </div>
                  </div>
              </div>
                </form>
                </div> 
                </div>
                <div class="group1  col-md-12 col-lg-12">
                	 <select class="form-control" name="menuSearch" id="menuSearch" onchange="window.open(value,'_self');">
					            <option  disabled selected>????????????</option>
					            <option value="${path}/customer/searchmenuView.do?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">????????????</option>
					            <option value="${path}/customer/searchmenuView?category=?????????/??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">?????????</option> 
					            <option value="${path}/customer/searchmenuView?category=???????????????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">???????????????</option>
					            <option value="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">??????</option>
					            <option value="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">??????</option>
					            <option value="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">?????????</option>
					            <option value="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">??????</option>
					            <option value="${path}/customer/searchmenuView?category=??????/??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">??????/??????</option>
					            <option value="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">??????</option>
					            <option value="${path}/customer/searchmenuView?category=?????????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}">?????????</option>
					            </select>
                
                </div>
                   <div class="group col-md-12 col-lg-12">
                <div class="btn-group btn-group-lg search1">
               <button type="button" class="btn btn-default active" id="all1"onclick="allview();">????????????</button> 
              <button type="button" class="btn btn-default active" id="japan" onclick="don();">?????????/??????</button>
              <button type="button" class="btn btn-default active" id="pran" onclick="fre();">???????????????</button>
              <button type="button" class="btn btn-default active" id="chicken" onclick="chi();">??????</button>
              <button type="button" class="btn btn-default active" id="pizza" onclick="piz();">??????</button>
              <button type="button" class="btn btn-default active" id="china" onclick="jun();">??????</button>
              <button type="button" class="btn btn-default active" id="korea" onclick="kor();">??????</button>
              <button type="button" class="btn btn-default active" id="bossam" onclick="jok();">??????/??????</button>
              <button type="button" class="btn btn-default active" id="bunsik" onclick="base();">??????</button>
              <button type="button" class="btn btn-default active" id="dessert" onclick="des();">?????????</button>
                
       </div>      
               </div>          
       </div>
       

       


<script>

function allview(){
	
	
    
	location.href="${path}/customer/searchmenuView.do?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}";

}
function don(){
	location.href="${path}/customer/searchmenuView?category=?????????/??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function fre(){
	location.href="${path}/customer/searchmenuView?category=???????????????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function chi(){
	location.href="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function piz(){
	location.href="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function jun(){
	location.href="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function kor(){
	location.href="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function jok(){
	location.href="${path}/customer/searchmenuView?category=??????/??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function base(){
	location.href="${path}/customer/searchmenuView?category=??????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}"; 
}

function des(){
	location.href="${path}/customer/searchmenuView?category=?????????&myAddr=${sessionScope.myAddr}&lat=${sessionScope.lat}&lng=${sessionScope.lng}";
	
}


</script>
        
             
                 
                 
            

 

                            