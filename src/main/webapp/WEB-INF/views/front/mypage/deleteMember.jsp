<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ��Ż��</title>
</head>
<body>
	 <div class="content sub">
            <h1 class="subtlt_h1">���� ����</h1>
            <ul class="breadcrumb sub_content">
                <li><a href="/">Ȩ</a></li>
                <li><a href="mypage">����������</a></li>
                <li><a href="">���� ����</a></li>
            </ul>

            <div id="draw" class="board">
                <form role="form" method="post" action="deleteOk" name ="userinput" onSubmit="return checkIt2()">
                <table cellspacing="0" cellpadding="0" class="table_style2">
                	<caption>ȸ��Ż��</caption>
                	<colgroup><col width="20%"><col width="*"></colgroup>
                	<tbody>
                    <tr>
                        <th>��й�ȣ</th>
                        <td><input type="password" name="password" class="input" maxlength="25" style="width: 70%;"></td>
                    </tr>
                    </tbody>
                </table>
                <div class="btn_area mt30">
                    <button type="submit" class="btn btn_gray btn_small">Ȯ��</button>
                    <button type="button" onclick="window.location.href='http://localhost:7777/project/index'" class="btn btn_gray btn_small">���</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>