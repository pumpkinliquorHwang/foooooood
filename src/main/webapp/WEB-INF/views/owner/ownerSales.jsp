<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
.counter {
	background-color: white;
	/*  padding: 20px 0; */
	border-radius: 5px;
	height: 110px;
}

.count-title {
    font-size: 40px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}
.count-number {
	text-align: left;
	margin-left: 20px;
}

.count-text {
	font-size: 18px;
	font-weight: bold;
	margin-top: 10px;
	margin-left: 20px;
	margin-bottom: 0;
	text-align: left;
	color: gray;
}


.fa-2x {
    margin: 0 auto;
    float: none;
    display: table;
    color: #4ad1e5;
}
.saleDiv{
margin-top:100px;
}
.saleDiv2 {
	background-color: rgb(243, 243, 243);
	height: 130px;
}
.saleDiv3{
margin-bottom:50px;
}

#countYear {
	color: rgb(189, 112, 189);
}

#countMonth {
	color:rgb(116, 116, 240);
}

#countDay {
	color: rgb(70, 219, 219);
}

#countWeek {
	color: rgb(250, 102, 102);
}
.saleDiv4{
	margin-bottom : 10px;
}
.saleBtn,.bt1{
	background-color: white !important;
	border-color : rgba(6, 4, 75, 0.986) !important;
	color:rgba(6, 4, 75, 0.986) !important;
}
</style>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>

	<div class="container">
	<div class="row">
	    <br/>
	   <div class="col text-center saleDiv3">
		<h2>?????? ??????</h2>
		</div>
		
             
		
	</div>
	<div class="row text-center saleDiv2">
	        <div class="col">
	        <div class="counter">
		      <p class="timer count-title count-number" data-to="100" data-speed="1500" id="countDay">${todaySales}???</p>
		       <p class="count-text ">??????</p>
	    	</div>
		    </div>
            <div class="col">
              <div class="counter">
			      <p class="timer count-title count-number" data-to="1700" data-speed="1500" id="countWeek">${weekSales }???</p>
			      <p class="count-text ">?????????</p>
    		  </div>
            </div>
            <div class="col">
             <div class="counter">
		      <p class="timer count-title count-number" data-to="11900" data-speed="1500" id="countMonth">${monthSales }???</p>
		      <p class="count-text ">?????????</p>
    		 </div>
    		</div>
            <div class="col">
             <div class="counter">
		      <p class="timer count-title count-number" data-to="157" data-speed="1500" id="countYear">${yearSales }???</p>
		      <p class="count-text ">??????</p>
    		 </div>
            </div>
      </div>
         
         <div class="row saleDiv">
                     <div class="col-md-12 saleDiv4">
                    	<div class="row">
	                         	<div class="col-md-1">
	                         		<button class="btn btn-default saleBtn" onclick="fn_sale(${businessCode});">?????????</button>
	                          		
	                          	</div>
	                          	<div class="col-md-1">
	                          		<button class="btn btn-default saleBtn"  onclick="fn_date(${businessCode});">?????????</button>
	                          		
	                          	</div>
	                          	<div class="col-md-10"></div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card categoryDiv">
                          <div class="card-body">
                          	<form action="${path}/owner/selectStoreSalesEnd.do" method="post">
                              <div class="row">
                                  <div class="col-md-1">
                              	  	<p style="font-size:18px;">??????</p>
                              	  </div>
                                  <div class="col-md-3">
                                  	<input type="date" class="form-control"  name="payDate1" required="required" min="2019-03-01" max="2019-03-29">
                                  </div>
                                  <div class="col-md-3">
                                  	<input type="date" class="form-control" name="payDate2" required="required" min="2019-03-01" max="2099-03-26">
                                  </div>
                                  <div class="col-md-5">
                                  <input type="hidden" name="businessCode" value="${businessCode}">
                                  <input type="submit" class="btn btn-primary bt1" value="??????">
                                  </div>
                              </div>
                              </form>
                              <div class="row">
                                  <div class="col-md-12">
    									<table class="table table-hover orderTable">
					<thead>
						<tr>
							<th width=7%>??????</th>
							<th width=18%>????????????</th>
							<th width=27%>?????????</th>
							<th width=9%>?????????</th>
							<th width=9%>????????????</th>
							<th width=10%>????????????</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="o" items="${orderOneList}" varStatus="status">		
							<tr style="cursor:pointer;">						
								<td  class="td1"><c:out value="${status.count}"/></td>
								<td  class="td1">${o.payDate}</td>
								<td  class="td1">${o.memberName}?????? ???????????????.</td>
								<td  class="td1">${o.deliveryPay}</td>							
								<td  class="td1">${o.price }</td>
								<td  class="td1">${o.payOrderMethod}</td>							
							</tr>
							
					</c:forEach> 
					</tbody>
				</table>
				<div class="paging">
					${pageBar}
				</div>
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>
                    </div>
                </div>
         
         
</div>
	
	
</section>

<script>
function fn_sale(businessCode){
	location.href="${path }/owner/selectStoreGoodsSales.do?businessCode="+businessCode;
}
function fn_date(businessCode)
{
	location.href="${path }/owner/selectStoreSales.do?businessCode="+businessCode;
	}

</script>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>