<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link rel="stylesheet" href="resources/css/user/reviewT_user.css" />
<script src="resources/js/user/star_user.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

<!-- 평점에 맞춰 색변화 -->
<script>
	function callrating(reviewNo, rate) {
		/* alert("review_rate : " + rate); */
		var starElement = document.getElementById("star2_" + reviewNo);
		starElement.style.width = rate * 20 + "%";
	}
</script>
<script>
	 function reportCheck() {
			alert("이미 신고된 글입니다");
			
		}
</script>

</head>
<body onload="callrating();">


	<!-- 남기문 (신고 완료 / 이미 신고되었다는 메세지 띄워줌..) -->
	
	<!-- 메세지 -->
	<c:if test="${msg != ''}">
			
		<script>
			alert("${msg}");
			location.replace("review_list_user?m_no=${m_no}&s_no=${s_no}");
		</script>
		
	</c:if>



	
	<div class="tc">
		<div class="a">
			<div class="aa"><a href="stay_detail_user?s_no=${s_no }">객실</a></div>
			<div class="aa"><a href="stay_detail_info_user?s_no=${s_no }">숙소정보</a></div>
			<div class="aa">후기</div>
		</div>
		
		 
	</div>
	
	<div class="total">
		<div  class="tcimg">
			<img src="resources/upload_img/admin/stay/${listS[0].s_img1 }" alt="호텔대표이미지">
		</div>
		<div class="tctext">
			 ${listS[0].s_name } 
		</div>
		<div class="b">
			<div class="repl">후기(${totalRCont })</div>
			<div class="star_avg">
				<span><i class="fa-solid fa-star" style="color: #f4d210;"></i></span> <span id="st1">${rateAvg }</span> <span id="st2">/5</span>

			</div>
		</div>
		
		<!-- 검색기능 -->
		<form action="review_list_user" method="post">
		<div class="sft">
			<select name="fS" id="c1">
				<option value="lately" >최신순</option>
				<option value="likerate" >인기순</option>
			</select> 
			<br> 
		<!-- 	<select name="fS" id="tAndRS">
				<option value="lately" >최신순</option>
				<option value="likerate" >인기순</option>
			</select> -->
			<div id="pS">포토후기만 보기 
				<c:choose>
					<c:when test="${pS }">
						<input type="checkbox" name="pS" value="pS" checked />
					</c:when>
					<c:otherwise>
							<input type="checkbox" name="pS" value="pS" />
					</c:otherwise>
				</c:choose>
				<input type="hidden" name="s_no" value="${s_no }" />
				<input type="submit" value="검색"/>
			
				<!-- 포토후기만 보기 <input type="checkbox" name="pS" value="pS"> -->
				
			</div>
		</div>
		</form>
	</div>

	<!-- 평점 -->
	<c:forEach items="${rlist}" var="dto">
    <div class="total">
        <div class="d">
            <div class="dt">
            
                <span class="star"> <i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i>
                <span id="star2_${dto.review_no}" style="width: ${dto.review_rate * 20}%;">
                <i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i><i class="fa-solid fa-star" ></i></span> <input
                        type="range"
                        value="${dto.review_rate}" step="1" min="1" max="5" oninput="callrating('${dto.review_no}', this.value);">
                </span>
            </div>
            <div class="dl">아이디 : ${dto.m_no }&nbsp;&nbsp;&nbsp;&nbsp;
                / 등록일 : ${dto.review_date }</div>
            <div class="dr">
            
          <!--  좋아요 --> 
          
                <a href="review_user_like?review_no=${dto.review_no }&s_no=${s_no }&m_no=${m_no }"> <input type="image" name="button" src="resources/img/user/review/reviewLikeIcon.png" width="30px"></a>
					${dto.likes }

		  <!--  신고하기 --> 
					<c:if test="${dto.report_no eq '0' }">
						 <a href="report?review_no=${dto.review_no }&s_no=${s_no }">
                <input type="image" name="button" src="resources/img/user/review/reviewAlertIcon.png" width="30px">
               
                </a>
					</c:if>
					<c:if test="${dto.report_no ne '0' }">
						
                <input type="image" name="button"  onclick="reportCheck();" src="resources/img/user/review/reviewAlertIcon.png" width="30px">
               
             
					</c:if>


            </div>
            <div class="db">
                <textarea name="" id="review_content" cols="156" rows="2">${dto.review_content }</textarea>
            </div>
        </div>
        <c:if test="${dto.photo_url ne null }">
            <div class="image-container">
                <img src="resources/upload_img/user/review/${dto.photo_url }" alt="reviewP" /> 
            </div>
        </c:if>
    </div>
</c:forEach>

</body>
</html>