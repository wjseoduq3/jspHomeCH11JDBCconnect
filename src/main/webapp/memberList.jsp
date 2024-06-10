<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SELECT 연습</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		
		String sql = "SELECT * FROM student_tbl";
			
		// mySQL과 연결에 필요한 4개의 변수 선언
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/jdy_school_db";
		String username ="root";
		String password ="12345";
		
		Connection conn = null; // db와의 커넥션 생성
		Statement stmt = null; // sql문을 실행시켜주는 객체
		ResultSet rs = null; // select를 쓸 때 결과값받는 자료 타입
		
		try {
			Class.forName(driverName); // mySQL 드라이브 불러오기
			conn = DriverManager.getConnection(url, username, password); //DB와의 커넥션 생성
			stmt = conn.createStatement(); //sql을 실행시켜주는 객체
			
			// int resultNum = stmt.executeUpdate(sql); //sql문을 DB에 실행시킴(insert, update, delete --> 성공하면 1 반환)
			
			rs = stmt.executeQuery(sql);
			
			// ArrayList memberList = new ArrayList();
			// memberList = null;
			
			// rs안의 자료를 하나씩 끄집어 내는 과정
			while(rs.next()) {
				int sno = rs.getInt("sno");
				String name = rs.getString("name");
				String dept = rs.getString("dept");
				
				out.println(sno + "/" + name + "/" + dept + "<br><br>");
			}
		} catch(Exception e) {
			out.println("회원목록 불러오기 실패!!");
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