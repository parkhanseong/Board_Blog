<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="insert.jsp" method="post" >

����:<input type="text" name="title" /><br/>
�ۼ���:<input type="text" name="writer" /><br/>
����:<input type="text" style="width: 500px; height: 200px;" name="content" /><br/>
<!-- ��¥:<input type="text" name="regdate" /><br/> -->

<input type="submit" />

</form>


<script>
	function formCheck() {
		
		var title = document.forms[0].title.value;
		var writer = document.forms[0].writer.value;
		var content= document.forms[0].content.value;
		var regdate = document.forms[0].regdate.value;
		
		if(title == null || title == ""){
			alert("������ �Է��ϼ���.");
			document.forms[0].title.focus();
			return false;
		}
		if(writer == null || writer == ""){
			alert("�ۼ��ڸ� �Է��ϼ���.");
			document.forms[0].writer.focus();
			return false;
		}else if( writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null ){
			alert("�̸��� �������� �Է��ϼ���.");
			document.forms[0].writer.focus();
			return false;
		}
		if(content== null || content == ""){
			alert("������ �Է��ϼ���.");
			document.forms[0].content.focus();
			return false;
		}
		if(regdate== null || regdate == ""){
			alert("������ �Է��ϼ���.");
			document.forms[0].regdate.focus();
			return false;
		}else if(regdate.match(/^\d\d\d\d\d\d+$/ig) == null){
			alert("���� ����(6�ڸ�)���� �Է��ϼ���.");
			document.forms[0].regdate.focus();
			return false;
		}
	}
	</script>
		
		
</body> 
</html> 


