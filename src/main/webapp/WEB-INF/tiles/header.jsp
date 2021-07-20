<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- header -->
	<header class="header">
	<!--[1]-->
	<nav class="nav header-nav">
		<!--[2]-->

		<div class="home-container">
			<!--[3-1]-->
			<div class="home">
				<a href="${pageContext.request.contextPath}">HireHigher</a>
			</div>
			<div class="main-search-bar-container">
				<input type="text" placeholder="" class="main-search-bar"> <a
					href="#" class="main-search-button"> <img src="${pageContext.request.contextPath }/resources/img/search-logo.png">
				</a>
			</div>
		</div>

		<ul class="nav-links">
			<c:choose>
				<c:when test="${sessionScope.userVO eq null}">
					<!--[3-2]-->
					<li><a href="${pageContext.request.contextPath }/jobBoard/jobList">RECRUITMENT <img src="${ pageContext.request.contextPath }/resources/img/recruitment-logo.png">
            		</a></li>
					
					<li><a href="${pageContext.request.contextPath }/workBoard/workBoard">MARKET <img src="${ pageContext.request.contextPath }/resources/img/cart-logo.png">
					</a></li>
					
					<li><a href="${pageContext.request.contextPath }/user/userLogin">SIGN-IN <img src="${ pageContext.request.contextPath }/resources/img/signin-logo.png">
					</a></li>
					
					<li><a href="${pageContext.request.contextPath }/user/userJoin">SIGN-UP <img src="${ pageContext.request.contextPath }/resources/img/signup-logo.png">
					</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/jobBoard/jobList">RECRUITMENT <img src="${ pageContext.request.contextPath }/resources/img/recruitment-logo.png">
            		</a></li>
					
					<li><a href="${pageContext.request.contextPath }/workBoard/workBoard">MARKET <img src="${ pageContext.request.contextPath }/resources/img/cart-logo.png">
					</a></li>
					
					<li><a href="${pageContext.request.contextPath }/userQuestion/faqList">FAQ <img src="${ pageContext.request.contextPath }/resources/img/faq-logo.png">
					</a></li>
					
					<li><a href="${pageContext.request.contextPath }/user/userLogout">SIGN-OUT <img src="${ pageContext.request.contextPath }/resources/img/signin-logo.png">
					</a></li>
				</c:otherwise>	
			</c:choose>
		</ul>

	</nav>
</header>