<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, java.sql.* , com.kh.food.customer.member.model.vo.*"  %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	Member member = (Member)request.getAttribute("member");
%>
   <c:set var="path" value="${pageContext.request.contextPath }"/>

 <style>
 	.footerdiv{
 		padding: 1px !important;
 		margin:1px !important;
 	}
 	.footerDiv{
 		padding:1px !important;
 		margin:1px !important;
 	}
 	.footerDiv2{
 	padding:1px !important;
 		margin:1px !important;
 	}
 
        .footer_info {

            font-weight: bold;
            color: white;
        }

        .footercopy {
            text-align: center;
            color: white;
        }

        .footerlist {
            color: white;
        }

        #footer {
            background-color: rgb(219, 83, 83);
            height: 220px;
        }

        #footer h5 {
            padding-right: 10px;
            padding-bottom: 6px;
            margin-bottom: 20px;
            color: #ffffff;
        }

        #footer a {
            color: #ffffff;
            text-decoration: none !important;
            -webkit-text-decoration-skip: objects;
        }

        #footer ul {
            list-style: none;
            padding-top: 10px;
            text-align: left;
            padding-left: 0;
        }

        #footer li {
            display: inline;
            padding: 0 7px;

            margin: 0px 10px;
            text-align: left;
        }

        #footer ul.footer_info li {
            margin: 0px 1px;
        }

        #footer ul.quick-links li {
            padding: 3px 0;
            -webkit-transition: .5s all ease;
            -moz-transition: .5s all ease;
            transition: .5s all ease;
        }

        #footer ul.quick-links li:hover {
            padding: 3px 0;
            margin-left: 2px;
            font-weight: 700;
        }

        #footer ul.quick-links li a i {
            margin-right: 5px;
        }

        #footer ul.quick-links li:hover a i {
            font-weight: 500;
        }

        @media (max-width :767px) {
            #footer h5 {
                padding-left: 0;
                border-left: transparent;
                padding-bottom: 0px;
                margin-bottom: 5px;
            }

        }
    </style>
<script>
function memberQnA(){
	 if(${sessionScope.logined==null}){
		 alert("????????? ??? ??????????????????");
		 location.href="${path}/customer/login.do";
	 }else{
		 location.href="${path}/member/qnaList.do?memberId=${sessionScope.logined}";
	 }
}
</script>
    <!-- Footer -->
    <footer id="footer">
        <div class="row footerdiv">
            <div class="col-md-2"> </div>
            <div class="col-md-8 footerDiv">
                <div class="row text-center text-xs-left text-sm-left text-md-center footerDiv2">

                    <div class="col-xs-12 col-sm-4 col-md-12">
                        <ul class="list-unstyled quick-links">
                            <li><a href="${path }"><i class="fa fa-angle-double-right"></i>Home</a></li>
                            <li><a href="${path }/customer/memberNoticeList.do"><i class="fa fa-angle-double-right"></i>????????????</a></li>
                            <%-- <li><a href="${path }"><i class="fa fa-angle-double-right"></i>1:1??????</a></li>
                            <li><a href="${path }/admin/memberNoticeList.do"><i class="fa fa-angle-double-right"></i>????????????</a></li> --%>
                            <li><a onclick="memberQnA();" style="cursor:pointer;"><i class="fa fa-angle-double-right"></i>1:1??????</a></li>

                        </ul>

                    </div>
                   <!--  <div class="col-xs-12 col-sm-6 col-md-6"></div> -->
                </div>
			<div class="col-xs-2 col-sm-12 col-md-12 col-lg-12">
                <ul class="footer_info">
                    <li> KH delivery(???)</li>
                    <br>
                    <li> ?????? : ??????????????? ????????? ????????? 823-25 </li>
                    <li> ????????? : KH delivery</li>
                    <li> ????????????????????? : 104-86-09535</li>
                    <li> ??????????????????????????? : KH delivery</li>
                </ul>
          	
                <p class="footercopy">Copyright 2019 ??? KH delivery Corp. All rights reserved.</p>
           </div>
            </div>
           
        </div>
       

    </footer>
</body>
</html>