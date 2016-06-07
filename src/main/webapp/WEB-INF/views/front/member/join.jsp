<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 페이지 입니다.</title>

<!-- 주소 API 사용하기위한 테그 -->
<script language="JavaScript">
	
</script>

</head>

<div class="container">

	<div class="row">
		<div
			class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action="join_members" method="post"
				name="userinput" onsubmit="return checkIt()">
				<h2>회원가입</h2>
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="id" id="User_id"
								class="form-control input-lg" placeholder="아이디" tabindex="3" minlength="4"><br>
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<button type="button" id="btnCheckUid"
							class="btn3d btn btn-default btn-lg" name="confirm_id">
							<h5><sp	an class="glyphicon glyphicon-ok"></span>중복확인</h5>
						</button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control input-lg" placeholder="비밀번호"
								tabindex="5" minlength="6">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password2"
								id="password_confirmation" class="form-control input-lg"
								placeholder="비밀번호 확인" tabindex="6" minlength="6">
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" name="name" id="name"
						class="form-control input-lg" placeholder="이름" tabindex="3">
				</div>
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<label class="active_btn btn btn-default active"> <input
							type="radio" name="gender" value="men"  id="man" autocomplete="off" checked="checked">
							남성<span class="glyphicon glyphicon-ok"></span><img
							src="https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678099-profile-filled-48.png"
							alt="">
						</label><label class="active_btn btn btn-default"> <input
							type="radio" name="gender" id="women" value="women" autocomplete="off"
							chacked> 여성<span class="glyphicon glyphicon-ok"></span><img
							src="https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/girl-48.png"
							alt="">
						</label>
					</div>
				</div>
				<div class="row" id="emailmargin">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div id="email_box" class="form-group">

							<input type="text" name="e-mail1" id="e-mail"
								class="form-control input-lg" placeholder="이메일"
								tabindex="4" />
						</div>
					</div>
					@
					<div class="col-xs-12 col-sm-6 col-md-6" id="email_float">
						<input type="text" name="email2" value="gmail.com" ReadOnly="true"
							class="form-control input-lg" /> <select id="select_size"
							class="form-control input-lg" name="emailCheck"
							onchange="SetEmailTail(emailCheck.options[this.selectedIndex].value)">
							<option value="gmail.com">gmail.com</option>
							<option value="naver.com">naver.com</option>
							<option value="nate.com">nate.com</option>
							<option value="daum.net">daum.net</option>
							<option value="">직접입력</option>
						</select>
					</div>
				</div>
				<div class="row">
					<div style="width: 23%; display: inline-block; padding-left: 15px">
						<div class="form-group">
							<select id="select_size" class="form-control input-lg"
								name="phone1">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>019</option>
								<option>02</option>
								<option>031</option>
								<option>032</option>
								<option>041</option>
								<option>042</option>
								<option>043</option>
								<option>044</option>
								<option>051</option>
								<option>052</option>
								<option>053</option>
								<option>054</option>
								<option>055</option>
								<option>061</option>
								<option>062</option>
								<option>063</option>
								<option>064</option>
							</select>
						</div>
					</div>
					-
					<div style="width: 35%; display: inline-block;">
						<div class="form-group">
							<input type="tel" name="phone2" id="phone"
								class="form-control input-lg" maxlength="4" placeholder="연락처">
						</div>
					</div>
					-
					<div style="width: 35%; display: inline-block;">
						<div class="form-group">
							<input type="tel" name="phone3" id="phone"
								class="form-control input-lg" maxlength="4">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="form-group">
							<input type="text" name="zip_code" id="address" size="5"
								class="form-control input-lg" maxlength="5"
								placeholder="우편번호" tabindex="4" disabled="disabled">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<button type="button" id="style_button"
							class="btn3d btn btn-default btn-lg" name="confirm_id"
							OnClick="openAddr()">
							<h5><span class="glyphicon glyphicon-map-marker"></span>우편번호</h5>
						</button>
					</div>
				</div>
				<div class="form-group">
					<input type="text" name="address1" id="address"
						class="form-control input-lg" maxlength="30" placeholder="주소"
						tabindex="4" disabled="disabled">
				</div>
				<div class="form-group">
					<input type="text" name="address2" id="address"
						class="form-control input-lg" maxlength="30" placeholder="상세주소"
						tabindex="4">
				</div>
				<div class="form-group">
					<input type="date" name="birth" class="form-control input-lg"
						placeholder="생일">
				</div>
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<label class="active_btn btn btn-defatul active"> <input
							type="radio" name="role_name" value="ROLE_USER" id="role_user" autocomplete="off" checked="checked">
							구매자 <span class="role_name glyphicon glyphicon-shopping-cart"></span>
						</label><label class="active_btn btn btn-default"> <input
							type="radio" name="role_name" value="ROLE_COP" id="role_cop" autocomplete="off"
							chacked> 판매자 <span class="role_name glyphicon glyphicon-barcode"></span>
						</label>
					</div>
				</div>
				<!-- ROLE_COP 협업 담당자 -->
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="회원가입"
							class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
				</div>
				<div class="modal-body">
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Similique, itaque, modi, aliquam nostrum at sapiente consequuntur
						natus odio reiciendis perferendis rem nisi tempore possimus ipsa
						porro delectus quidem dolorem ad.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">I
						Agree</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
</div>