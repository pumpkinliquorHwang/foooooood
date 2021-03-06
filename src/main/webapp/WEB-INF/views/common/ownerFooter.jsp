<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
            background: rgba(6, 4, 75, 0.986) !important;
            
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
            background-color: transparent;
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

    <!-- Footer -->
    <footer id="footer">
        <div class="row footerdiv">
            <div class="col-md-2"> </div>
            <div class="col-md-8 footerDiv">
                <div class="row text-center text-xs-left text-sm-left text-md-center footerDiv2">

                    <div class="col-xs-12 col-sm-4 col-md-12">
                        <ul class="list-unstyled quick-links">
                            <li><a href="${path }/"><i class="fa fa-angle-double-right"></i>Home</a></li>
                            <li><a href="${path }/owner/ownerNoticeListOwnerView.do"><i class="fa fa-angle-double-right"></i>????????????</a></li>
                            <li><a href="${path }/owner/oneVSoneList.do"><i class="fa fa-angle-double-right"></i>1:1??????</a></li>
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