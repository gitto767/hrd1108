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
    	 String sql="insert into teacher1108 values(?,?,?,?)";
    	 pstmt.setString(1, idx);
    	 pstmt.setString(2, name);
    	 pstmt.setString(3, major);
    	 pstmt.setString(4, field);
    	 pstmt.executeUpdate();    	 
         %>
	   <script>
	     alert("등록 완료");
	     location.href="teacherselect.jsp";
	   </script>
	   <%
 }catch(Exception e){
 	System.out.println("저장 실패");
 	e.printStackTrace();
 } 
%>
</body>
</html>