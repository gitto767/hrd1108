<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
 	if(document.form.idx.value==""){
		alert("강사코드을 입력하세요");
		document.form.ㅑㅇㅌ.focus();} 

 	else{document.form.submit();} }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>강사 수정</h3>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String idx=request.getParameter("idx");
    try{
    	String sql="select * from teacher1108 where idx=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, idx);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String name=rs.getString("name");
    		String major=rs.getString("major");
    		String field=rs.getString("field");
    		%>    		
  <form name="form" method="post" action="teacherupdateProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>강사 ID</th>
        <td><input type="text" name="idx" value="<%=idx %>"></td>
      </tr>
      <tr>
        <th>강사명</th>
        <td><input type="text" name="name" value="<%=name %>"></td>
      </tr>
       <tr>
        <th>전 공</th>
        <td><input type="text" name="major" value="<%=major %>"></td>
      </tr>
       <tr>
        <th>세부전공</th>
        <td><input type="text" name="field" value="<%=field %>"></td>
      </tr> 

      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="수정" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      <%
    	}
    }catch(Exception e){
    	System.out.println("수정 실패");
    	e.printStackTrace();
    }
  %>
    </table>
  </form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>