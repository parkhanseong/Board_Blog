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
	//���� ���ڵ� ����� euc-kr�� ��ġ������.
	request.setCharacterEncoding("euc-kr");
	
	int idx = 1;
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
		<h1>�Խ��� - �Խñ� ����Ʈ</h1>
		<table>
		<tr>
			<th>��ȣ</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>����</th>
			<th>��¥</th>
			<th>��ȸ��</th>
		</tr>
        
        <%   
        
        while(rs.next()){
 
            out.print("<tr>");
            
            out.print("<td>" + rs.getString("idx") + "</td>"); //idx
            
            out.print("<td>" + rs.getString("title") + "</td>"); //����
  
            out.print("<td>" + rs.getString("writer") + "</td>"); // �ۼ���

            out.print("<td>" + rs.getString("writer") + "</td>"); //����

            out.print("<td>" + rs.getString("regdate") + "</td>"); //date
 
            out.print("<td>" + rs.getString(count) + "</td>"); //��ȸ��
 
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
	<a href="write.jsp">�۾���</a>

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






