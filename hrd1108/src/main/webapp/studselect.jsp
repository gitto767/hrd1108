<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>수강신청 도우미 시스템</h3>
  
<table class="selecttable">
  <tr>
    <th>학번</th>
    <th>성명</th>
    <th>학과</th>
    <th>학년</th>
    <th>주소</th>
    <th>연락처</th>
    <th>취미</th>
    <th>관리</th>
  </tr>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
        try{
    	String sql="select studno,name,dept,position,address,phone,hobby from stud1108";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String studno=rs.getString(1);
    		String name=rs.getString(2);
    		String dept=rs.getString(3);
    		String position=rs.getString(4);
    		String address=rs.getString(5);
    		String phone=rs.getString(6);
    		String hobby=rs.getString(7);
    		
    		%>
    	
  <tr>
    <td><%=studno %></td>
    <td><%=name %></td>
    <td><%=dept %></td>
    <td><%=position %></td>
    <td><%=address %></td>
    <td><%=phone %></td>
    <td><%=hobby %></td>
    <td><a href="studupdate.jsp?studno=<%=studno%>">수정</a>/<a href="studdelete.jsp">삭제</a></td>
  </tr>
  	<%
    	}
    }catch(Exception e){
    	System.out.println("조회실패");
    	e.printStackTrace();
    }
  %>
</table>

<div class=insertbutton><a href="studinsert.jsp">학사정보 추가</a></div>
  
</section>
<%@ include file="footer.jsp" %>
</body>
</html>