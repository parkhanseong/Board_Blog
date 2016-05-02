<%@ page import="com.board.beans.Board" %>
<%@ page import="java.util.ArrayList" %>  
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
<title>Insert title here</title>

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
	
	try {
		 
        String driverName = "oracle.jdbc.driver.OracleDriver"; 
 
        String url = "jdbc:oracle:thin:@localhost:1521:XE";
 
        ResultSet rs = null;
        
        Class.forName(driverName);
 
        Connection con = DriverManager.getConnection(url,"park","qqqq1111");
 
        out.println("Oracle Database Connection Success.");
 
        Statement stmt = con.createStatement();        
 
        String sql = "select * from board order by idx desc";
 
        rs = stmt.executeQuery(sql);
 		
        ArrayList<Board> articleList = new ArrayList<Board>();
        
        while(rs.next()){
        	
        	Board article = new Board();
        	
        	article.setIdx(rs.getInt("idx"));
        	article.setTitle(rs.getString("title"));
        	//article.setContent(rs.getString("content"));
        	article.setCount(rs.getInt("count"));
        	article.setRegdate(rs.getString("regdate"));
        	article.setWriter(rs.getString("writer"));
			
        	articleList.add(article);
        	
        }
			
        request.setAttribute("articleList", articleList); //세팅된 리스트를 뷰에 포워드.

        con.close();

	}catch (Exception e) {
        out.println("Oracle Database Connection Something Problem. <hr>");
        out.println(e.getMessage());
        e.printStackTrace();
    }
%>

        <body>

		<h1>게시판 - 게시글 리스트</h1>

		<table>

		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach items="${articleList}" var="article">
			<tr>
				<td>${article.idx}</td>
				<td><a href='content.jsp?idx=${article.idx}'>${article.idx}</a></td>
				<td>${article.writer}</td>
				<td>${article.regdate}</td>
				<td>${article.count}</td>
			</tr>
		</c:forEach>
	</table>

	<a href='write.jsp'>글쓰기</a>

</body>
</html>









