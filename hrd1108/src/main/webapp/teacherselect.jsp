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
  <h3>강사 목록</h3>
  <%@ include file="dbconn.jsp" %>
  <table class="selecttable">
    <tr>
      <th>강사코드</th>
      <th>강사명</th>
      <th>전공</th>
      <th>세부전공</th>
      <th>관리</th>
    </tr>
    <%
      ResultSet rs=null;
      PreparedStatement pstmt=null;
      try{
    	  String sql="select * from teacher1108";
    	  pstmt=conn.prepareStatement(sql);
    	  rs=pstmt.executeQuery();
    	  while(rs.next()){
    		  String idx=rs.getString(1);
        	  String name=rs.getString(2);
        	  String major=rs.getString(3);
        	  String field=rs.getString(4);    	
        	  
       %>
       
    <tr>
      <td><%=idx %></td>
      <td><%=name %></td>
      <td><%=major %></td>
      <td><%=field %></td>
      <td><a href="teacherupdate.jsp?idx=<%=idx%>">수정</a>/<a href="teacherdelete.jsp?idx=<%=idx%>">삭제</a></td>
    
 <%
    	  }
    	  
      }catch(Exception e){
    	  System.out.println("DB 오류");
    	  e.printStackTrace();
    	  
      }
      
   %>
  </table>
  
</section>
<%@ include file="footer.jsp" %>

</body>
</html>