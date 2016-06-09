<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE htmL>
<style>
.tok_nav {
	position: relative;
	z-index: 110;
	width: 100%;
	min-width: 1020px;
	height: 100px;
	background: #00d2b9;
	top: 40px;
	padding: 20px 30px 20px 50px;
	align: float;
}

.tok_nav .fr {
	width: auto;
	height: 40px;
}

.fr {
	float: right !important;
}

.tok_nav .save {
	border-color: #00a894;
	background: #00b5a6;
}

.tok_nav .btn_type2 {
	width: 70px;
	height: 20px;
	padding-top: 10px;
	font-weight: bold;
	line-height: 12px;
}

.btn_type2 {
	display: inline-block;
	border: 1px solid #25baa8;
	border-radius: 2px;
	text-align: center;
	color: #fff;
	zoom: 1;
}

#content {
	width: 920px;
	padding: 50px 50px 100px;
}

fieldset {
	border: 0;
	display: block;
}

div {
	display: block;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}

.filebox label {
	color: #fff;
	background-color: #337ab7;
	border-color: #2e6da4;
}

.form-control-category {
	display: inline_block;
	width: 30%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}

.form-control {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
	-webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow
		ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s, box-shadow ease-in-out
		.15s;
	transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
}
</style>
<html>
<div id="product_register_content">
	<div class="tok_nav" position="relative">
		<div align="float">
			<h2>요리톡 등록</h2>
		</div>
		<div class="fr">
			<div class="save">
				<a href="#" class="btn_type2">저장</a>
			</div>
		</div>
	</div>
	<br>
	<div id="content" class="form">
		<form action="cookRecipewrite" method="post" enctype="multipart/form-data">
			<input type="hidden" name="statusType">
			<fieldset class="fieldSet_value">
				<h3 class="">기본 정보</h3>
				<h4 class="">
					<label>카테고리명</label>
				</h4>
				<select name="k_category" required="required"
					class="form-control-category">
					<option value="">레시피카테고리</option>
					<option value="밥">밥</option>
					<option value="국/찌개">국/찌개</option>
					<option value="밑반찬">밑반찬</option>
					<option value="메인반찬">메인반찬</option>
					<option value="일품요리">일품요리</option>
					<option value="간식">간식</option>
					<option value="기타">기타</option>
				</select>
				<h4 class="">
					<label>레시피명</label>
				</h4>
				<input type="text" id="cook_name" title="레시피명" name="k_title"
					maxlength="100" size="100" required="required"> <strong
					class="nameRealLength">/100</strong>
				<h4 class="">
					<label>레시피 이미지</label>
				</h4>
				<input type="file" name="files[0]" required="required">

				<h4 class="">
					<label>썸네일 이미지</label>
				</h4>
				<input type="file" name="files[1]" required="required">

				<h4 class="">
					<label>레시피 영상</label>
				</h4>
				<input type="text" name="k_src" id="k_src" title="주소" size="100" placeholder="src"> <br> <br>
				<div>
					<input type="submit" class="btn_type2" value="상품등록"> <input
						type="reset" class="btn_type2" value="취소">
				</div>
			</fieldset>
		</form>
	</div>
</div>
</html>