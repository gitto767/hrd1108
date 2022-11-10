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
  <h3>교과목목록</h3>
  
<table class="selecttable">
  <tr>
    <th>과목코드</th>
    <th>과목명</th>
    <th>학점</th>
    <th>담당강사</th>
    <th>요일</th>
    <th>시작시간</th>
    <th>종료시간</th>
    <th>관리</th>
  </tr>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
        try{
    	String sql="select id,subject_name,credit,b.name,week,start_hour,end_hour from sub1108 a,teacher1108 b where a.lecturer=b.idx";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String id=rs.getString(1);
    		String subject_name=rs.getString(2);
    		String credit=rs.getString(3);
    		String lecturer=rs.getString(4);
    		String week=rs.getString(5);
    		String start_hour=rs.getString(6);
    		String end_hour=rs.getString(7);
    		
    		%>
    	
  <tr>
    <td><%=id %></td>
    <td><%=subject_name %></td>
    <td><%=credit %></td>
    <td><%=lecturer %></td>    
    <td><%=week %></td>
    <td><%=start_hour %></td>
    <td><%=end_hour %></td>
    <td><a href="subupdate.jsp?id=<%=id%>">수정</a>/<a href="subdelete.jsp?id=<%=id %>">삭제</a></td>
  </tr>
  	<%
    	}
    }catch(Exception e){
    	System.out.println("조회실패");
    	e.printStackTrace();
    }
  %>
</table>

<div class=insertbutton><a href="subinsert.jsp">학사정보 추가</a></div>
  
</section>
<%@ include file="footer.jsp" %>
</body>
</html>