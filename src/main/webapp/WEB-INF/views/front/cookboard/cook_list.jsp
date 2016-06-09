<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<div class="row">
		<c:forEach items="${Cook_onePageList}" var="list">
			<div class="col-xs-12 col-sm-6 col-md-3  imglist">
				<div class="col-item">
					<div class="photo">
						<a href="Cook_details?k_no=${list.k_no}&code=${1}"><img
							src="upload/CookRecipe/${list.k_thumbFile}"
							class="img-responsive" alt="a" /></a>
					</div>
					<div class="info">
						<div class="row namesize">
							<div>
								<h6>Recipe >> ${list.k_category}</h6>
								<a href="Cook_details?k_no=${list.k_no}&code=${1}"><h5>${list.k_title}</h5></a>
							</div>
						</div>
						<div class="separator clear-left">
							<h5 id="listfont_size">
								<p class="btn-add">
									<i class="fa fa-shopping-cart"></i>
									<se:authentication property="name" var="LoginUser" />
									<se:authorize
										access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')">
										<!-- 권한을 검사한다. 관리자나 일반 사용자, 판매자일 경우 -->

									</se:authorize>
								</p>
							</h5>
							<p class="btn-details">$</p>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="pagesize">
		<tr>
			<td colspan="3" height="100px">
				<!-- 페이지 카운트 --> <c:if test="${count>0}">
					<c:set var="pageCount"
						value="${allCount / pageSize + ( allCount % pageSize == 0 ? 0 : 1 )}" />
					<c:set var="startPage" value="${1}" />
					<c:set var="pageBlock" value="${5}" />
					<fmt:parseNumber var="result" value="${currentPage/pageBlock}"
						integerOnly="true" />
					<c:if test="${currentPage%pageBlock !=0 }">
						<c:set var="startPage" value="${result*pageBlock+1}" />
					</c:if>
					<c:if test="${currentPage%pageBlock==0}">
						<c:set var="startPage" value="${(result-1)*pageBlock+1}" />
					</c:if>
					<c:set var="endPage" value="${startPage+pageBlock-1}" />
					<c:if test="${endPage>pageCount}">
						<c:set var="endPage" value="${pageCount}" />
					</c:if>
					<c:if test="${startPage>5}">
						<a href="cook_list?pageNum=${startPage-5}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">

						<c:if test="${categoryValue=='no'}">
							<a href="cook_list?pageNum=${i}">[${i}]</a>
						</c:if>
						<c:if test="${categoryValue!='no'}">
							<a href="cook_list?pageNum=${i}&k_category=${categoryValue}">[${i}]</a>
						</c:if>

					</c:forEach>
					<c:if test="${endPage<pageCount}">
						<a href="cook_list?pageNum=${startPage+5}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>
	</div> 
</div>