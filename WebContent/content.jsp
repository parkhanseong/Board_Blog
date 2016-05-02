<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>�Խñ� ����</title>

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
	//���� ���ڵ� ����� euc-kr�� ��ġ������.
	request.setCharacterEncoding("euc-kr");
	
    String idx = request.getParameter("idx");
    System.out.print(idx);
	
	try {
		 
        String driverName = "oracle.jdbc.driver.OracleDriver"; 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
        ResultSet rs = null;

        Class.forName(driverName);
        Connection con = DriverManager.getConnection(url,"park","qqqq1111");
        out.println("Oracle Database Connection Success.");

        Statement stmt = con.createStatement();        
 		String sql = "select * from board where idx = " + idx ;
        rs = stmt.executeQuery(sql);

        while(rs.next()){
        	
        	request.setAttribute("idx", rs.getInt("idx"));
        	request.setAttribute("writer", rs.getString("writer"));
        	request.setAttribute("regdate", rs.getString("regdate"));
        	request.setAttribute("count", rs.getString("count"));
        	request.setAttribute("title", rs.getString("title"));
        	request.setAttribute("content", rs.getString("content"));
			
        }
		con.close();

	}catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }
        	
%>
        
        <body>
		<h1>�Խ��� - �Խñ� ��ȸ</h1>
		<table border="1">
		<tr>
			<th>��ȣ</th>
            <td>${idx}</td> 
			
			<th>�ۼ���</th>
            <td>${writer}</td> 

			<th>��¥</th>
            <td>${sysdate}</td> 

			<th>��ȸ��</th>
            <td>${count}</td> 
		</tr>
			
		<tr>
			<th colspan="2">����</th>
            <td>${title}</td> 
		</tr>
			
		<tr>			
			<th colspan="2">����</th>
            <td>${content}</td> 
		</tr>
		
		</table>        
        
    <a href="delete.jsp?idx=${idx}">�Խñ� ����</a>
	<a href="list.jsp">�������</a>

</body>
</html>

