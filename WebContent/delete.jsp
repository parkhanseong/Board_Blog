<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 보기</title>

<style type="text/css">
    table, td, th   {
    border:1px solid green;
    }
    th{
    background-color:green;
    color:white;
    }
</style>

</head>

<%
	//문자 인코딩 방식을 euc-kr로 일치시켜줌.
	request.setCharacterEncoding("euc-kr");
	
    String idx = request.getParameter("idx");
	System.out.println(idx);
	
	try {
		 
        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        ResultSet rs = null;
		
        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"park","qqqq1111");
        out.println("Oracle Database Connection Success.");
		
        Statement stmt = con.createStatement();        
 		String sql = "delete from board where idx = " + idx;
        rs = stmt.executeQuery(sql);
		
        %>
        
		<script>
		location.href="redirect.jsp";
		</script>
		
<% 

		con.close();

	}catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }
	
%>

</body>
</html>




