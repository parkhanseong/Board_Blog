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
</head>

<%
	//문자 인코딩 방식을 euc-kr로 일치시켜줌.
	request.setCharacterEncoding("euc-kr");
	
	int idx = 1;
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
 
        %>
        
        
        <body>
		<h1>게시판 - 게시글 리스트</h1>
		<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
        
        <%   
        
        while(rs.next()){
 
            out.print("<tr>");
            
            out.print("<td>" + rs.getString("idx") + "</td>"); //idx
            
            out.print("<td>" + rs.getString("title") + "</td>"); //제목
  
            out.print("<td>" + rs.getString("writer") + "</td>"); // 작성자

            out.print("<td>" + rs.getString("writer") + "</td>"); //내용

            out.print("<td>" + rs.getString("regdate") + "</td>"); //date
 
            out.print("<td>" + rs.getString(count) + "</td>"); //조회수
 
            out.print("</tr>");
 
        }
 
%>
     
 		
	<%-- 	<tr>
			<th><%=idx %></th>
			<th><%=title %></th>
			<th><%=writer %></th>
			<th><%=content %></th>
			<th><%=regdate %></th>
			<th><%=count %></th>
		</tr> --%>

	</table>
	<a href="write.jsp">글쓰기</a>

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







