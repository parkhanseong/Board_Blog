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
	//���� ���ڵ� ����� euc-kr�� ��ġ������.
	request.setCharacterEncoding("euc-kr");
	
	//int idx = 1;
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String regdate = request.getParameter("regdate");
	int count = 10000;
	
	if( title == "" || title == null ) out.println("title�� null�Դϴ�.");
	if( writer == "" || writer == null)  out.println("writer�� null�Դϴ�.");
	else if(!Pattern.matches("^[_0-9a-zA-Z-]+@[0-9a-zA-Z-]+(.[_0-9a-zA-Z-]+)*$", writer)){
		out.println("�̸��� ������ �ƴմϴ�.");
	}
	if(regdate == "" || regdate == null)
		out.println("regdate�� null�Դϴ�.");
	if(content == "" || content == null) out.println("content�� null�Դϴ�.");
	
	try{
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		
		ResultSet rs = null;
			
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "park", "qqqq1111");
		
		out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�.");
		
		Statement stmt = con.createStatement();
		
		String sql = "INSERT INTO BOARD "+
           "(IDX, TITLE, WRITER, CONTENT, COUNT, REGDATE) "+
           "VALUES (board_seq.nextval, '"+title+"', '"+writer+"' , '"+content+"', "+count+", sysdate)";
		
		stmt.executeUpdate(sql);
		
		con.close();

	} catch(Exception e){
		
		out.println("Oracle �����ͺ��̽� db�� ������ �ֽ��ϴ�. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
		
	}
	finally{
		out.print("<script>location.href='list.jsp';</script>");
	}
	
%>



<%-- 
<body>
	<h1>�Խ��� - �Խñ� ����Ʈ</h1>
	<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��¥</th>
			<th>��ȸ��</th>
		</tr>
		
		<tr>
			<th><%=idx %></th>
			<th><%=title %></th>
			<th><%=writer %></th>
			<th><%=regdate %></th>
			<th><%=count %></th>
		</tr>
	</table>
	<a href="write.jsp">�۾���</a>
</body>
</html>




 --%>
