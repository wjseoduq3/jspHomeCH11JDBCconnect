<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC 연결 테스트</title>
</head>
<body>
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jdy_school_db";
		String username ="root";
		String password ="12345";
		
		Connection conn = null;
		
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			out.println(conn);
		} catch(Exception e) {
			out.println("DB연결 실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>

</body>
</html>