<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table width="500" cellpadding="0" cellspacing="0" border="1">
		<form action="FQ_write" method="post">
			<tr>
				<td>ī�װ�</td>
				<td><input type="text" name="fq_category" size="50"></td>
			</tr>
			<tr>
				<td>Ÿ��Ʋ</td>
				<td><input type="text" name="fq_title" size="50"></td>
			</tr>
			<tr>
				<td>����</td>
				<td><textarea name="fq_contents" rows="10"></textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="�Է�"></td>
			</tr>
		</form>
	</table>
	
	
	<a href="FQ_list">��Ϻ���</a>&nbsp;&nbsp; 
</body>
</html>