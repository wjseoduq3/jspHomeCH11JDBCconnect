<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인 - DB 연동 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		
		String sql = "INSERT INTO student_tbl(sno, name, dept) VALUES ('"+sno+"', '"+name+"', '"+dept+"')";
		
		// mySQL과 연결에 필요한 4개의 변수 선언
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jdy_school_db";
		String username ="root";
		String password ="12345";
		
		Connection conn = null; // db와의 커넥션 생성
		Statement stmt = null; // sql문을 실행시켜주는 객체
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			stmt = conn.createStatement(); //sql을 실행시켜주는 객체
			
			int resultNum = stmt.executeUpdate(sql); //sql문을 DB에 실행시킴(insert, update, delete --> 성공하면 1 반환)
			if (resultNum == 1) {
				out.println("sql명령 실행 성공");
			} else {
				out.println("sql명령 실행 실패");
			}
		} catch(Exception e) {
			out.println("DB연결 실패!!");
			e.printStackTrace();
		} finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
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