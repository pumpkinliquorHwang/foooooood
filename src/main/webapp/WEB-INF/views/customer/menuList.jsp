<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
div .menuCategoryStyle {
   cursor:pointer;
}
dt{
	color:rgb(0, 0, 0);
}
dt:hover{
	color:white;
}
</style>
<script>
   $(function() {
      $("dd:not(:first)").css("display", "none"); //선택 dd 빼고 나머지 dd를 none으로 해라
      $("dt").css({"background-color" : "rgb(255, 171, 149)"});
      $("dl dt").click(function() {
         if ($("+dd", this).css("display") == "none") {
            $(this).siblings("dd").slideUp("fast");
            $("+dd", this).slideDown("fast");
         }
      });
   });
   
</script>
<div id="menubox">
   <dl>
      <dt>인기메뉴</dt>
      <dd>
         <c:forEach var="popu" items="${popularityMenu}">
         <div class="row menuCategoryStyle" onclick='menuModal(${popu.menuCode})' id='menuCategoryId${popu.menuCode }'>
            <div class="col-sm-9">
               <div class="mnl">
                  <p style='margin-top:8px; margin-bottom:8px;'><span style='font-weight:bold;'>
                    ${popu.menuName }</span><br /> <span style='color:black;'>${popu.menuPrice }원</span>
                  </p>
               </div>
            </div>
            <div class="col-sm-3">
               <img class="mnlogo" src="${path}/resources/upload/owner/menu/${popu.menuImage}"><br />
            </div>
         </div>
         <hr>
         </c:forEach>
      </dd>
      <c:forEach var="category" items="${categoryList}">
      <dt id="categoryBtn${category.MENUCATEGORYCODE }">${category.MENUCATEGORY }</dt>
      <dd>
      <script>
      //모달
      function menuModal(no) {
         $.ajax({
            type:"POST",
            url:"${path}/customer/menuSelect.do",
            data:{"menuCode" : no},
            dataType:"JSON",
            success: function(data) {
            	console.log(data);
               if(data.menuSoldOut==1){
                  alert('품절 되었습니다.');   
               }
               else{
               $('#menuSelectModal').modal();
               $('#menuImage').empty().append('<img src="${path}/resources/upload/owner/menu/'+data.menuImage+'" style="width:100%; height:333px;"/>');
               $('#menuTitle').empty().append(data.menuName);
               $('#menuTitle_').val(data.menuName);
               $('#menuPrice').empty().append(data.menuPrice);
               $('#menuPrice_').val(data.menuPrice);
               $('#menuCode_').val(data.menuCode);
               if(data.menuContent!=null){
            	   var h="<h6 style='float:left; font-weight:bold; margin-top:8px;'>메뉴 설명</h6>";
            	   h+="<textarea class='form-control' id='menuInfo_' style='cursor:default; background-color:rgb(207, 207, 207); font-size:12px; resize:none; border:0px; width:100%; height:100px; color:black;' readonly>"+data.menuContent+"</textarea>";
            	   $('#menu_InfoM').html(h);
               }
               else{
            	   $('#menu_InfoM').html("");
               }
               }
            }
         });
         // 모달닫을 때 마다 입력값 초기화
         $('#menuSelectModal').on('hidden.bs.modal', function (e) {
             $('#menuCount_').val("");
             $('#plusMenuPrice').html("");
         });
      }
      // 에이젝스로 값보내기
      $(document).ready(function(){
              $("#categoryBtn${category.MENUCATEGORYCODE}").click(function(){
              var businessCode=${businessCode};
              var menuCategoryCode=${category.MENUCATEGORYCODE};
              $.ajax({
                 type: "POST",
                 url: "${path}/customer/menuListEnd.do",
                 data : {"businessCode" : businessCode, "menuCategoryCode" : menuCategoryCode},
                 dataType : "JSON",
                 success:function(data) {
                    console.log(data);
                    var html="<div>";
                    for(var i=0; i<data.length; i++){
                    html+="<div class='row menuCategoryStyle' onclick='menuModal("+data[i].MENUCODE+");' id='menuCategoryId"+data[i].MENUCODE+"'>";
                    html+="<div class='col-sm-9'>";
                    html+="<div class='mnl'>";
                    html+="<p style='margin-top:8px; margin-bottom:8px;'><span style='font-weight:bold;'>"+data[i].MENUNAME+"</span><br/><span style='color:black;'>"+data[i].MENUPRICE+"원</span></p>";
                    html+="</div>";
                    html+="</div>";
                    html+="<div class='col-sm-3'>";
                    html+="<img class='mnlogo' src='${path}/resources/upload/owner/menu/"+data[i].MENUIMAGE+"'><br/>";
                    html+="</div>";
                    html+="</div>";
                    html+="<hr>";
                      $("#menuList${category.MENUCATEGORYCODE}").empty().append(html);
                    }
                    html+="</div>";
                     }
              });
           });
        });
      // 모달닫을 때 마다 입력값 초기화
      $('#menuSelectModal').on('hidden.bs.modal', function (e) {
          $('#menuCount_').val("");
          $('#plusMenuPrice').html("");
      });
      </script>
      <div id="menuList${category.MENUCATEGORYCODE }">
      </div>
      </dd>
      </c:forEach>
   </dl>
</div>
<script>
// 수량 올릴때마다 가격 변동
function plusCount() {
   var price=$('#menuPrice_').val();
   var plus=$('#menuCount_').val();
   $('#plusMenuPrice').html(price*plus);
   $('#plusMenuPrice_').val(price*plus);
   // 모달닫을 때 마다 입력값 초기화
   $('#menuSelectModal').on('hidden.bs.modal', function (e) {
       $('#menuCount_').val("");
       $('#plusMenuPrice').html("");
   });
}
// 장바구니 누르면 컨트롤러로 값 전송 및 모달끄기
$(document).ready(function(){
   $("#menuInsert_").click(function(){
      var menuCount=$("#menuCount_").val();
      if(menuCount.trim().length==0||menuCount<=0||menuCount>=100){
         alert('수량을 잘못 입력하셨습니다.');
         return false;
      }
      var same=0;
      var plusMenuPrice=$("#plusMenuPrice_").val();
      var menuPrice=$("#menuPrice_").val();
      var menuTitle=$("#menuTitle_").val();
      var menuCode=$('#menuCode_').val();
      var businessCode=${businessCode};
      $.ajax({
         type:"POST",
         url:"${path}/customer/menuInsert.do",
         data:{"plusMenuPrice" : plusMenuPrice, "menuCount" : menuCount, "menuPrice" : menuPrice, "menuTitle" : menuTitle, "businessCode" : businessCode, "menuCode" : menuCode},
         dataType:"JSON",
         success: function(data) {
            console.log(data);
            var wishResultBusinessCode=businessCode;
            $.ajax({
               type:"POST",
               url:"${path}/customer/menuInfo2.do?menuCount="+data.menuCount+"&businessCode="+businessCode+"&menuTitle="+data.menuTitle+"&menuPrice="+menuPrice+"&plusMenuPrice="+plusMenuPrice+"&menuCode="+data.menuCode,
               dataType:"html",
               success: function(data) {
                  $('#janbgaID').html(data);
                  $.ajax({
                     type:"POST",
                     url:"${path}/customer/wishResult.do?businessCode="+wishResultBusinessCode,
                     dataType:"html",
                     success: function(data){
                        $('#plusMenuPrice_result').html(data);
                     }
                  });
               }
            });
         }
      });
   });
   $("#menuInsert_").click(function(){
      $('#menuSelectModal').modal("hide");
   });
   // 모달닫을 때 마다 입력값 초기화
   $('#menuSelectModal').on('hidden.bs.modal', function (e) {
       $('#menuCount_').val("");
       $('#plusMenuPrice').html("");
   });
});
// 모달닫을 때 마다 입력값 초기화
$('#menuSelectModal').on('hidden.bs.modal', function (e) {
    $('#menuCount_').val("");
    $('#plusMenuPrice').html("");
});
</script>
<!-- 모달 -->
<div class="modal" id="menuSelectModal" role="dialog">
   <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
         <div class="modal-header">
            <p class="modal-title" id="menuTitle" style="font-weight:bold;"></p>
            <input type="hidden" id="menuTitle_" name="menuTitle" value=""/>
            <button type="button" class="close" data-dismiss="modal">×</button>
         </div>
         <div class="modal-body" style="height: auto;">
            <div class="menu-image" id="menuImage"></div>
            <br/>
            <h6 class="menu-priceM" style="float:left; font-weight:bold;">가격</h6>
            <h6 class="menu-price" id="menuPrice" style="text-align:right;"></h6>
            <input type="hidden" id="menuPrice_" name="menuPrice" value=""/>
            <br/>
            <h6 class="menu-countM" style="float:left; font-weight:bold; margin-bottom:0px; margin-top:8px;">수량</h6>
            <input type="number" min="0" onkeyup="plusCount();" name="menuCount" id="menuCount_" class="form-control" style="float:right; width:3em;"/>
            <br/>
            <br/>
            <br/>
            <div id="menu_InfoM"></div>
            <div style="background-color:rgb(231, 231, 231); height:5em; margin-top:2em;">
            <h5 style="font-weight:bold; float:left; padding-left:1em; line-height:80px;">총 주문금액</h5>
            <h5 style="float:right; padding-right:1em; line-height:80px;" id="plusMenuPrice"></h5>
            <input type="hidden" id="plusMenuPrice_" name="plusMenuPrice" value=""/>
            <input type="hidden" id="menuCode_" name="menuCode" value=""/>
            </div>
         </div>
         <div class="modal-footer">
            <div class="container">
            <div class="row">
            <div class="col-sm-6" style="padding-left:0px; padding-right:0px;">
            <button type="button" id="menuInsert_" class="btn btn-success btn-lg btn-block">장바구니담기</button>
            </div>
            <div class="col-sm-6" style="padding-left:0px; padding-right:0px;">
            <button type="button" id="modalPay_" class="btn btn-danger btn-lg btn-block">주문하기</button>
            <script>
            $(document).ready(function(){
               $("#modalPay_").click(function(){
               var menuCount=$("#menuCount_").val();
               var minPrice=${minPrice.minPrice};
               var plusMenuPrice=$("#plusMenuPrice_").val();
               var menuPrice=$("#menuPrice_").val();
               var menuTitle=$("#menuTitle_").val();
               var menuCode=$('#menuCode_').val();
               var businessCode=${businessCode};
               var price=$('#menuPrice_').val();
               var plus=$('#menuCount_').val();
                     if(menuCount.trim().length==0||menuCount<=0||menuCount>=100){
                        alert('수량을 잘못 입력하셨습니다.');
                        return false;
                     }
              		 $.ajax({
	                       type:"POST",
	                       url:"${path}/customer/menuInsert.do",
	                       data:{"plusMenuPrice" : plusMenuPrice, "menuCount" : menuCount, "menuPrice" : menuPrice, "menuTitle" : menuTitle, "businessCode" : businessCode, "menuCode" : menuCode},
	                       dataType:"JSON",
	                       success: function(data) {
	                    	   var reresultPrice=data.insertResultPrice;
								console.log(data);
								if(minPrice>reresultPrice){
									alert('최소 주문금액에 맞춰 주문해주세요.');
									return false;
								}
								else{
									location.href="${path}/customer/pay.do?businessCode="+businessCode;
									return true;
								}
	                       }
                      });
                  });
            });
            </script>
            </div>
            </div>
            </div>
         </div>
      </div>  
   </div>
</div>

