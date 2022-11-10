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
   String studno=request.getParameter("studno");
   String name=request.getParameter("name");
   String dept=request.getParameter("dept");
   String position=request.getParameter("position");   
   String[] val=request.getParameterValues("hobby");
   String hobby="";
   if(val !=null){
   	for(int i=0;i<val.length;i++){
   		if(i==(val.length-1)){
   			hobby+=val[i];
   		}else{
   		hobby+=val[i]+",";
   		}
   	}
   }
   String address=request.getParameter("address");
   String phone=request.getParameter("phone");
   
   try{
	   String sql="update stud1108 set studno=?,name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, studno);
	   pstmt.setString(2, name);
	   pstmt.setString(3, dept);
	   pstmt.setString(4, position);
	   pstmt.setString(5, address);
	   pstmt.setString(6, phone);
	   pstmt.setString(7, hobby);
	   pstmt.setString(8, studno);
	   pstmt.executeUpdate();
	   %>
	   <script>
	     alert("등록 완료");
	     location.href="studselect.jsp";
	   </script>
	   <%
   }catch(Exception e){
   	System.out.println("저장 실패");
   	e.printStackTrace();
   } 
%>

</body>
</html>