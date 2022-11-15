<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>
<%
  PreparedStatement pstmt=null;
  String idx=request.getParameter("idx");
  String name=request.getParameter("name");
  String major=request.getParameter("major");
  String field=request.getParameter("field");
  
  try{
	  String sql="update teacher1108 set idx=?,name=?,major=?,field=? where idx=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, idx);
	  pstmt.setString(2, name);
	  pstmt.setString(3, major);
	  pstmt.setString(4, field);
	  pstmt.setString(5, idx);
	  pstmt.executeUpdate();
	  %>
	   <script>
	     alert("수정 완료");
	     location.href="teacherselect.jsp";
	   </script>
	   <%
  }catch(Exception e){
	  System.out.println("수정 실패");
	  e.printStackTrace();
  }
%>
</body>
</html>