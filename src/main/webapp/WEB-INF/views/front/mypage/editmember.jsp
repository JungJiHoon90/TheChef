<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="content sub">
            <h1 class="subtlt_h1">���� ����</h1>
            <ul class="breadcrumb sub_content">
                <li><a href="/">Ȩ</a></li>
                <li><a href="mypage">����������</a></li>
                <li><a href="">���� ����</a></li>
            </ul>
            <div class="container">

	<div class="row">
		<div
			class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
			<form role="form" action="editOk" method="post"
				name="userinput" onsubmit="return checkIt1()">
				<h2>ȸ������ ����</h2>
				<hr class="colorgraph">
				<h5>���̵�</h5>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="text" name="id" id="User_id" disabled="disabled" value="${identify.id}" 
								class="form-control input-lg"  tabindex="3"><br><!-- disabled�� �ٲ��� ���ϵ��� ������-->
						</div>
					</div>
				</div>
				<h5>�� ��й�ȣ</h5>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password" id="password"
								class="form-control input-lg" placeholder="Password"
								tabindex="5">
						</div>
					</div>
				</div>
				<h5>�� ��й�ȣ Ȯ��</h5>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div class="form-group">
							<input type="password" name="password2"
								id="password_confirmation" class="form-control input-lg"
								placeholder="Confirm Password" tabindex="6">
						</div>
					</div>
				</div>
				<h5>�̸�</h5>
				<div class="form-group">
					<input type="text" name="name" id="name" disabled="disabled" value="${myname.name}"
						class="form-control input-lg" placeholder="Name" tabindex="3">
				</div>
				<h5>����</h5>
				<div class="form-group">
					<div class="btn-group" data-toggle="buttons">
						<label class="active_btn btn btn-default active"> <input
							type="radio" name="gender" value="men"  id="man" autocomplete="off" checked="checked">
							����<span class="glyphicon glyphicon-ok"></span><img
							src="https://cdn0.iconfinder.com/data/icons/small-n-flat/24/678099-profile-filled-48.png"
							alt="">
						</label><label class="active_btn btn btn-default"> <input
							type="radio" name="gender" id="women" value="women" autocomplete="off"
							chacked> ����<span class="glyphicon glyphicon-ok"></span><img
							src="https://cdn3.iconfinder.com/data/icons/rcons-user-action/32/girl-48.png"
							alt="">
						</label>
					</div>
				</div>
				<h5>�̸���</h5>

				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-6">
						<div id="email_box" class="form-group">

							<input type="text" name="email1" id="e-mail" value="${elemail}"
								class="form-control input-lg" placeholder="Email Address"
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
							<option value="">�����Է�</option>
						</select>
					</div>
				</div>

				<h5>����ó</h5>
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
							<input type="tel" name="phone2" id="phone" value="${cphone}"
								class="form-control input-lg" maxlength="4">
						</div>
					</div>
					-
					<div style="width: 35%; display: inline-block;">
						<div class="form-group">
							<input type="tel" name="phone3" id="phone" value="${cphone1}"
								class="form-control input-lg" maxlength="4">
						</div>
					</div>
				</div>
				<h5>�ּ�</h5>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<div class="form-group">
							<input type="text" name="zip_code" id="address" size="5" value="${zip.zip_code}"
								class="form-control input-lg" maxlength="5"
								placeholder="zip code" tabindex="4">
						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-6">
						<button type="button" id="style_button"
							class="btn3d btn btn-default btn-lg" name="confirm_id"
							OnClick="openAddr()">
							<h5><span class="glyphicon glyphicon-map-marker"></span>�����ȣ</h5>
						</button>
					</div>
				</div>
				<div class="form-group">
					<input type="text" name="address1" id="address"  value="${add}"
						class="form-control input-lg" maxlength="30" placeholder="address"
						tabindex="4" >
				</div>
				<div class="form-group">
					<input type="text" name="address2" id="address" value="${add1}"
						class="form-control input-lg" maxlength="30" placeholder="address"
						tabindex="4">
				</div>

				<h5>����</h5>
				<div class="form-group">
					<input type="date" name="birth" class="form-control input-lg" value="${bir.birth}"
						placeholder="����">
				</div>

				
				<!-- ROLE_COP ���� ����� -->
				<hr class="colorgraph">
				<div class="row">
					<div class="col-xs-12 col-md-6">
						<input type="submit" value="Register"
							class="btn btn-primary btn-block btn-lg" tabindex="7">
					</div>
				</div>
			</form>
		</div>
	</div>
	</div>
</body>
                