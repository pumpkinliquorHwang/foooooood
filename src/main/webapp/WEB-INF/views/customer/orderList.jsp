<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
.img-circle {
    border-radius: 50%;
   	width:150px;
   	height:150px;

}
table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	thead#tableHead{ background-color: rgb(250, 163, 148); color: white } 

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating span{
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
    cursor:pointer;
}
#activeOn{background-color: rgb(250, 163, 148); color:white;}
#activeOff:hover{
	background-color: rgb(250, 163, 148);
	color:white;
}

#noImg1{
 cursor:pointer;
}

.star_rating span.on {color:crimson;}

.menu1{
}

#cancelBtn{
	background-color : white;
	border-color :red;
	color:red;
}

#cancelBtn1{
	background-color : white;
	border-color :rgb(250, 163, 148);
	color:rgb(250, 163, 148);
}
#modal{
	background-color : white;
	border-color :rgb(250, 163, 148);
	color:rgb(250, 163, 148);
}
</style>
<script>
	
$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $("#file").on('change', function(){
        readURL(this);
    });
});

function fileUpload(){
	$("#file").click();
}


function detailOrder1(payorderNum,menucode){
	console.log(payorderNum,menucode);

	$.ajax({
		url:"${path}/member/orderOne.do",
		dataType : 'json',
		data : {
			"payorderNum" : payorderNum,
			"menucode" : menucode
		},
		success : function(mem1){
			console.log(mem1);
			var menu = "";
			var sum = "";
			for(var i=0; i<mem1.length; i++)
				{
					menu += mem1[i].MENUNAME+"("+mem1[i].COUNT+") ";
					sum = Number(sum) + Number(mem1[i].PRICE);
				}
			sum = Number(sum) + Number(mem1[0].DELIVERYPAY);
			console.log(menu);
			$('.category').val(mem1[0].STORECATEGORY);
			$('.storeName').val(mem1[0].STORENAME);
			$('.payDate1').val(mem1[0].PAYDATE);
			$('.way').val(mem1[0].PAYORDERMETHOD);
			$('.price').val(sum+"???");
			$('.payRequest').val(mem1[0].PAYREQUEST);
			$('.menu1').val(menu);
			$('#orderListModal1').modal();
			
			
		},
		error: function (mem1){
			alert(mem1);
		}
		
	});
	
}
</script>
	
	
			
 			
 	
 	
 	
 	
 	
 	<section>
<div class="container">

 			
 			
	<div class="row" >
		<div class="col-md-3 ">
		     <div class="list-group ">
  <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}" id="activeOn" class="list-group-item list-group-item-action" style="z-index:0;">?????? ????????????</a>
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">??????????????????</a>
              <a href="${path }/member/markList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">??????????????????</a>
              <a href="${path }/member/myReview.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">?????? ??????</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">?????? ????????????</a>
            </div> 
		</div>
		<div class="col-md-9">	
	
		<h4 id="titleText">${sessionScope.logined}??? ?????? ?????? </h4>
		
		
		<div id="qnaList">
			<table class="table table-hover" id="qnaTable">
				<thead id="tableHead">
					<tr>	
						<th>????????????</th>	
						<th>?????????</th>
						<th>?????? ??????</th>	
						<th>????????????</th>
						<th>????????????</th>
						<th>????????????</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="m">
						<tr class="pnt" style='cursor:pointer;'>
						
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});" style="vertical-align: middle; cursor:pointer;"><c:out value="${m.STORECATEGORY }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});" style="vertical-align: middle;"><c:out value="${m.STORENAME }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});" style="vertical-align: middle;"><c:out value="${m.PAYDATE}"/></td>

							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});" style="vertical-align: middle;">
							<c:set var="state" value="${m.ORDERSTATE }" />
							<c:choose>
								<c:when test="${ state eq 0}">
									????????????
								</c:when>
								<c:when test="${ state eq 1}">
									????????????
								</c:when>
								<c:when test="${ state eq 2}">
									?????????
								</c:when>
								<c:when test="${ state eq 3}">
									????????????
								</c:when>
								<c:when test="${ state eq 4}">
									????????????
								</c:when>
							</c:choose>
						
							</td>
							<td>
								<c:if test="${ state eq 3}">
									<button class="btn btn-default" value="${m.MEMBERID}"  id="modal" type="button" onclick="fn_review(${m.BUSINESSCODE},${m.MEMBERNUM},${m.PAYNUM },this)">??????</button>
								</c:if>
							</td>
							<td>
								<c:if test="${ state eq 3 || state eq 4 }">
									<button class="btn btn-default" id="cancelBtn1" value="${m.IMPID }" onclick="fn_cancel(${m.PAYORDERNUM},${m.IMPID })" disabled="disabled">????????????</button>
							
								</c:if>
								<c:if test="${ state eq 0 || state eq 1 || state eq 2 }">
								<button class="btn btn-default" id="cancelBtn" value="${m.IMPID }" onclick="fn_cancel(${m.PAYORDERNUM},this)">????????????</button>
								</c:if>
							</td>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
${pageBar}
</section>
	
 
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<div class="modal" id="reviewModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">?????? ??????</h4>
			</div>
			<form action="${path }/customer/memberReview.do" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<table class="table">
						<tr>
							<th style="vertical-align: middle; font-weight:bold; width:100px;">??????</th>
							<td>
								<p class="star_rating">
								    <span id="1" onclick=mark(this) class="on">???</span>
								    <span id="2" onclick=mark(this)>???</span>
								    <span id="3" onclick=mark(this)>???</span>
								    <span id="4" onclick=mark(this)>???</span>
								    <span id="5" onclick=mark(this)>???</span>
									<input type="hidden" id="star" name="grade"/>
								</p>
							</td>

						
						</tr>
						<tr>
							<th style="vertical-align: middle;">
							</th>
							<td>
								<input type="hidden" id="businessCode" name="bsCode" value=""/>
								<input type="hidden" id="memberNum" name="memNum" value=""/>
								<input type="hidden" id="memberId" name="memId" value=""/>
								<input type="hidden" id="payNum" name="payNum" value=""/>
								<textarea id="textarea" name="context" cols="50" rows="5" placeholder="????????? ????????? ?????????." onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this)" required="required"></textarea>
							</td>					
						</tr>
						<tr>
							<th style="vertical-align: middle;">
							<td>
							<label for="jdd_file1"><img class="defaultImg" id="noImg1" src="${path}/resources/images/noImg.png" style="width:150px; height:150px; border: 1px solid #d9d9d9;"></label>
							<input id="jdd_file1" type="file" class="jdd_file" name="img"/>
							</td>
						</tr>
					</table>
					<div class="modal-footer">
	        			<button type="submit" class="btn btn-secondary" >??????</button>
	        			<button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
	      			</div>
				</div>
			
			</form>
		
		</div>
	
	</div>

</div>

<script>
//????????????
function fn_cancel(payOrderNum,e){
 	var impId = $(e).val();
	console.log(impId);
	console.log(payOrderNum + "::" + impId)
	var UP = confirm("????????? ???????????? ???????????????????");
	if(UP == true)
		{
			$.ajax({
				url: "${path}/member/cancelOrder.do",
				data: { "payOrderNum" : payOrderNum , "impId" : impId},
				success:function(data)
				{
					console.log(data);
					if(data!=0)
						{
							$(e).css("color","rgb(250, 163, 148)").css("border-color","rgb(250, 163, 148)").attr("disabled",true).attr("readonly",true);
						}
					alert("??????????????? ???????????????.");
				}
			})
		}
	else
		{
			alert("????????? ??????????????????.");
		}
}


function noSpaceForm(obj){		
	var str_space = /(<([^>]+)>)/ig;  // ????????????
	
	   
    if(str_space.test(obj.value)) { //????????????
        obj.focus();
        obj.value = obj.value.replace(str_space,''); // ????????????
        return false;
    }
   
	
}

function fn_review(businessCode,membernum,payNum,e){
	$.ajax({
		type: "POST",
		url: "${path}/member/reviewCon.do?payNum=" + payNum,
		data: JSON,
		success: function(data){
			if(data.REVIEWNUM != null) {
				alert("?????? ????????? ???????????????.");
			}
			else {
				var memberId = $(e).val();
				$('#businessCode').val(businessCode);
				$('#memberId').val(memberId);
				$('#memberNum').val(membernum);
				$('#payNum').val(payNum);
				$('#reviewModal').modal();			
				console.log("????????????");
			}
		}
	});		
}

$( ".star_rating span" ).click(function() {
	console.log("star ??????");
    $(this).parent().children("span").removeClass("on");
    $(this).addClass("on").prevAll("span").addClass("on");
    return false;
});


function mark(e)
{
	
	var score=$(e).attr('id');
	$("#star").val(score);
	console.log(e)
	console.log(score)
	
	
	}
	
$("#jdd_file1").hide();


$(document).ready(function(){
	
	$(document).on("change",".jdd_file", handleImgRecipeFileSelect);
});




function handleImgRecipeFileSelect(e) {
	
  var files = e.target.files;	
  var filesArr = Array.prototype.slice.call(files);
  filesArr.forEach(function(f){
      if(!f.type.match("image.*")) 
      {
          alert("???????????? ????????? ???????????? ???????????????");
          return;
      }

      sel_file = f;

      var reader = new FileReader();
      reader.onload = function(e){
      		$("#noImg1").attr("src",e.target.result).css('width','150px').css('height','150px');      
      }
      reader.readAsDataURL(f);
  });
  
}


</script>

<!-- ?????? ?????? -->
<div class="modal" id="orderListModal1" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">?????? ???????????? </h4>
				<button type="button" class="close" data-dismiss="modal">??</button>
			</div>
			<form action="${path}/customer/memberQnaUpdate.do"  method="post">
				<div class="modal-body" style="height: 700px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">????????????</th>
							<td><input type="text"  class="form-control category" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">?????????</th>
							<td><input type="text"  class="form-control storeName" value="" readonly/></td>						
						</tr>						
						<tr>
							<th style="vertical-align: middle">????????????</th>
					<td><input type="text"  id="payDate1" class="form-control payDate1"  readonly/></td>						
						</tr>	
						<tr>
							<th style="vertical-align: middle">????????????</th>
							<td><textarea class="form-control menu1" rows="5" value="" readonly></textarea></td>											
						</tr>						
						<tr>
							<th style="vertical-align: middle">?????? ??????</th>
							<td><input type="text"  class="form-control way" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">??????</th>
							<td><input type="text"  class="form-control price" value="" readonly/></td>						
						</tr>						 	 
					
						<tr>
							<th style="vertical-align: middle">????????????</th>
							<td><textarea  class="form-control payRequest" style="resize: none" rows="6" readonly></textarea></td>						
						</tr>															 
					</table>
						
				</div>
				
			</form>
		</div>  
	</div>
</div>


