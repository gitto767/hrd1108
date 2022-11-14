<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.subject_name.value==""){
		alert("과목명을 입력하세요");
		document.form.subject_name.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>교과목 수정</h3>
  <%@ include file="dbconn.jsp" %>
  <%
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  String id=request.getParameter("id");
  
  try{
	  String sql="select * from sub1108 where id=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, id);
	  rs=pstmt.executeQuery();
	  if(rs.next()){
		  String subject_name=rs.getString("subject_name");
		  String credit=rs.getString("credit");
		  String lecturer=rs.getString("lecturer");
		  String week=rs.getString("week");
		  String start_hour=rs.getString("start_hour");
		  String end_hour=rs.getString("end_hour");
	 %>
  <form name="form" method="post" action="subupdateProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>교과목 코드</th>
        <td><input type="text" name="id" value="<%=id %>"></td>
      </tr>
      <tr>
        <th>과목명</th>
        <td><input type="text" name="subject_name" value="<%=subject_name %>"></td>
      </tr>
       <tr>
        <th>학점</th>
        <td><input type="text" name="credit" value="<%=credit %>"></td>
      </tr>
       <tr>
        <th>담당강사</th>
        <td>
          <select name="lecturer">
            <option selected hidden="" disabled>담당교수선택</option>
            <option value="1" <%if(lecturer.equals("1")){%>selected<%}%>>김교수</option>
            <option value="2" <%if(lecturer.equals("2")){%>selected<%}%>>이교수</option>
            <option value="3" <%if(lecturer.equals("3")){%>selected<%}%>>박교수</option>
            <option value="4" <%if(lecturer.equals("4")){%>selected<%}%>>우교수</option>
            <option value="5" <%if(lecturer.equals("5")){%>selected<%}%>>최교수</option>
            <option value="6" <%if(lecturer.equals("6")){%>selected<%}%>>강교수</option>
            <option value="7" <%if(lecturer.equals("7")){%>selected<%}%>>황교수</option>                     
          </select>
        </td>
      </tr>
      <tr>
        <th>수업요일</th>
        <td>
          <label><input type="radio" name="week" value="1" <%if(week.equals("1")){%>checked<%} %>>월요일</label>
          <label><input type="radio" name="week" value="2" <%if(week.equals("2")){%>checked<%} %>>화요일</label>
          <label><input type="radio" name="week" value="3" <%if(week.equals("3")){%>checked<%} %>>수요일</label>
          <label><input type="radio" name="week" value="4" <%if(week.equals("4")){%>checked<%} %>>목요일</label>
          <label><input type="radio" name="week" value="5" <%if(week.equals("5")){%>checked<%} %>>금요일</label>
          <label><input type="radio" name="week" value="6" <%if(week.equals("6")){%>checked<%} %>>토요일</label>
        </td>
      </tr>
      
      <tr>
        <th>시작</th>
        <td><input type="text" name="start_hour" value="<%=start_hour%>"></td>
      </tr>
      <tr>
        <th>종료</th>
        <td><input type="text" name="end_hour" value="<%=end_hour%>"></td>
      </tr>
      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="수정" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      
    </table>
    <%
     }
  }catch(Exception e){
	  e.printStackTrace();
	  System.out.println("데이터베이스오류");
  }
  %>
  </form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>