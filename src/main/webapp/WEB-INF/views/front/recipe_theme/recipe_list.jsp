<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<div class="container">
	<div class="row">
		<c:forEach items="${recipe_onePageList}" var="list">
			<div class="col-xs-12 col-sm-6 col-md-3  imglist">
				<div class="col-item">
					<div class="photo">
						<a href="recipe_details?p_no=${list.p_no}&code=${1}"><img src="upload/RTP/${list.p_thumbFile}" class="img-responsive" alt="a" /></a>
					</div>
					<div class="info">

						<div class="row namesize">
							<div>
								<h6>Recipe >> ${list.p_category1}</h6>
								<a href="recipe_details?p_no=${list.p_no}&code=${1}"><h5>${list.p_title}</h5></a>
							</div>
							<!-- <div class="rating hidden-sm col-md-6">
                        <i class="price-text-color fa fa-star"></i>
                        <i class="price-text-color fa fa-star"></i>
                        <i class="price-text-color fa fa-star"></i>
                        <i class="price-text-color fa fa-star"></i>
                        <i class="fa fa-star"></i>
                     </div> -->
						</div>
						<div class="separator clear-left">
							<h5 id="listfont_size">
								<p class="btn-add">
									<i class="fa fa-shopping-cart"></i>
									<se:authentication property="name" var="LoginUser" />
									<se:authorize
										access="hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_COP')">
										<!-- 권한을 검사한다. 관리자나 일반 사용자, 판매자일 경우 -->
										<a
											href="cart?p_price=${list.p_price}&p_no=${list.p_no}&id=${LoginUser}&code=${1}"
											class="hidden-sm">장바구니 담기</a>
									</se:authorize>
								</p>
							</h5>
							<p class="btn-details">$ ${list.p_price}</p>
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
						<a href="recipe_list?pageNum=${startPage-5}">[이전]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">

						<c:if test="${categoryValue=='no'}">
							<a href="recipe_list?pageNum=${i}">[${i}]</a>
						</c:if>
						<c:if test="${categoryValue!='no'}">
							<a href="recipe_list?pageNum=${i}&p_category1=${categoryValue}">[${i}]</a>
						</c:if>

					</c:forEach>
					<c:if test="${endPage<pageCount}">
						<a href="recipe_list?pageNum=${startPage+5}">[다음]</a>
					</c:if>
				</c:if>
			</td>
		</tr>
	</div>
</div>