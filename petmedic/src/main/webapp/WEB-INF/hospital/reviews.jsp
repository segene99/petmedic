<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/reviewList.css">
<style>
/* table{ */
/* border: 1px solid #E8E2E2; */
/* } */
</style>

<script>
//리뷰보이기 글자제한
document.addEventListener("DOMContentLoaded", function () {
  var reviewElements = document.getElementsByClassName("review");
  for (var i = 0; i < reviewElements.length; i++) {
    var reviewText = reviewElements[i].textContent;
    if (reviewText.length > 100) {
      reviewElements[i].textContent = reviewText.substring(0, 100) + "...";
    }
  }
});



</script>

</head>
<body>

	<div class="container structure">	
		
		<div class="row" id="reviewContainer">
			<c:choose>
				<c:when test="${empty revList}">
					<div class="col-md-12 text-center">해당되는 리뷰가 없습니다.</div>
				</c:when>
				<c:otherwise>
					<c:set var="sti" value="0" />
					<c:forEach items="${revList}" var="review">
						<div class="col-md-6 mt-sm-4"
							onclick="openHosDetailReviewModal(${review.rev_hos_seq})"
							style="font-size: 0.85rem;">
							<div class="revShadow review-box">
								<div class="row" style="padding: 10px">
									<div class="col-8">
										<div class="user-info">
											<div class="profileupper">
												<b>${review.rev_userid}</b>
												<div class="star-rating" id="st-${sti = sti+1}">
													<script>
												       $(function(){generateStarRating(${sti}, ${review.rev_star});}) ;
												       
												     //이전별점
												          function generateStarRating(idx, starValue) {
												        	  	console.log('starValue', starValue);
												            for (var i = 1; i <= 5; i++) {
												            var starHtml = '';
												              starHtml += '<input type="radio" id="' + i + '-stars" name="rev_star" value="' + i + '"';
												             
												              if (i<= starValue) {
												            	  if(i== starValue) starHtml += ' checked';
													              starHtml += ' /><label for="' + i + '-stars" class="star starChk">&#9733;</label>';
												              }else{
													              starHtml += ' /><label for="' + i + '-stars" class="star">&#9733;</label>';
												              }
													         $("#st-"+idx).append(starHtml);
												            }
												          }
												       </script>
												</div>
											</div>
											<hr style="color: #125c13">
										</div>
										<div class="review-details-up">

											<div class="text-left">
												<b>제목: </b>${review.rev_title}</div>
											<hr>
											<div class="review">${review.rev_content}</div>

										</div>

									</div>
									<div class="col-4">
										<img
											src="${pageContext.request.contextPath}/img/${review.rev_pic}"
											alt="mdo" class=" profilepic-hos-det-rev"
											onerror="this.src='${pageContext.request.contextPath}/img/catdefault.png'" />
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>



<script>

//블러처리 해제
document.addEventListener("DOMContentLoaded", function () {
  var reviewContainer = document.getElementById("reviewContainer");
  var showMoreButton = document.getElementById("showMoreButton");

var userid = '<%=session.getAttribute("users_id")%>';
var hosid = '<%=session.getAttribute("hos_id")%>';


  if(userid == null || hosid == null){
  	// Add the following code to check the user's login status
 		 var isLoggedIn = false; // Set this variable based on the user's login status
  } else {
  	var isLoggedIn = true;
  }

  if (isLoggedIn) {
    reviewContainer.style.filter = "none"; // Remove the blur effect
    reviewContainer.style.pointerEvents = "auto"; // Enable interaction with the review container
    showMoreButton.style.display = "none"; // Hide the "Show More" button
  }
});





</script>
</body>
</html>