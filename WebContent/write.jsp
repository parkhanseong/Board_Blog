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

제목:<input type="text" name="title" /><br/>
작성자:<input type="text" name="writer" /><br/>
내용:<input type="text" style="width: 500px; height: 200px;" name="content" /><br/>
<!-- 날짜:<input type="text" name="regdate" /><br/> -->

<input type="submit" />

</form>


<script>
	function formCheck() {
		
		var title = document.forms[0].title.value;
		var writer = document.forms[0].writer.value;
		var content= document.forms[0].content.value;
		var regdate = document.forms[0].regdate.value;
		
		if(title == null || title == ""){
			alert("제목을 입력하세요.");
			document.forms[0].title.focus();
			return false;
		}
		if(writer == null || writer == ""){
			alert("작성자를 입력하세요.");
			document.forms[0].writer.focus();
			return false;
		}else if( writer.match(/^(\w+)@(\w+)[.](\w+)$/ig) == null ){
			alert("이메일 형식으로 입력하세요.");
			document.forms[0].writer.focus();
			return false;
		}
		if(content== null || content == ""){
			alert("내용을 입력하세요.");
			document.forms[0].content.focus();
			return false;
		}
		if(regdate== null || regdate == ""){
			alert("내용을 입력하세요.");
			document.forms[0].regdate.focus();
			return false;
		}else if(regdate.match(/^\d\d\d\d\d\d+$/ig) == null){
			alert("숫자 형식(6자리)으로 입력하세요.");
			document.forms[0].regdate.focus();
			return false;
		}
	}
	</script>
		
		
</body> 
</html> 


