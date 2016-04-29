<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.regex.Pattern"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<%
	//문자 인코딩 방식을 euc-kr로 일치시켜줌.
	request.setCharacterEncoding("euc-kr");
	
	//int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	int count = 10000;
	
	if( title == "" || title == null ) out.println("title이 null입니다.");
	if( writer == "" || writer == null)  out.println("writer가 null입니다.");
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer)){
		out.println("이메일 형식이 아닙니다.");
	}
	if(regdate == "" || regdate == null)
		out.println("regdate가 null입니다.");
	if(content == "" || content == null) out.println("content가 null입니다.");
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		ResultSet rs = null;
			
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "park", "qqqq1111");
		
		out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다.");
		
		Statement stmt = con.createStatement();
		
		String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, CONTENT, COUNT, REGDATE) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , '"+content+"', "+count+", sysdate)";
		
		stmt.executeUpdate(sql);
		
		con.close();

	} catch(Exception e){
		
		out.println("Oracle 데이터베이스 db에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
		
	}
	finally{
		out.print("<script>location.href='list.jsp';</script>");
	}
	
%>



<%-- 
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
		
		<tr>
			<th><%=idx %></th>
			<th><%=title %></th>
			<th><%=writer %></th>
			<th><%=regdate %></th>
			<th><%=count %></th>
		</tr>
	</table>
	<a href="write.jsp">글쓰기</a>
</body>
</html>




 --%>
