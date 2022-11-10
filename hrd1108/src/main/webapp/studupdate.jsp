<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
 	if(document.form.name.value==""){
		alert("성명을 입력하세요");
		document.form.custid.focus();} 

 	else{document.form.submit();} }
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
  <h3>학사정보 수정 화면</h3>
<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String studno=request.getParameter("studno");
    try{
    	String sql="select * from stud1108 where studno=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, studno);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String name=rs.getString("name");
    		String dept=rs.getString("dept");
    		String position=rs.getString("position");
    		String hobby=rs.getString("hobby");
    		String address=rs.getString("address");
    		String phone=rs.getString("phone");
    		String hby[]=hobby.split(",");
   
    	%>

<form name="form" method="post" action="studupdateProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>학번</th>
        <td><input type="text" name="studno" value="<%=studno%>"></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name" value="<%=name %>"></td>
      </tr>
       <tr>
        <th>학과</th>
        <td>
          <select name="dept">
            <option value="1" <%if(dept.equals("1")){ %>selected<%} %>>컴퓨터공학과</option>
            <option value="2" <%if(dept.equals("2")){ %>selected<%} %>>기계공학과</option>
            <option value="3" <%if(dept.equals("3")){ %>selected<%} %>>전자과</option>
            <option value="4" <%if(dept.equals("4")){ %>selected<%} %>>영문학과</option>
            <option value="5" <%if(dept.equals("5")){ %>selected<%} %>>일어과</option>
            <option value="6" <%if(dept.equals("6")){ %>selected<%} %>>경영학과</option>
            <option value="7" <%if(dept.equals("7")){ %>selected<%} %>>무역학과</option>
            <option value="8" <%if(dept.equals("8")){ %>selected<%} %>>교육학과</option>          
          </select>
        </td>
      </tr>
      <tr>
        <th>학년</th>
        <td>
          <label><input type="radio" name="position" value="1" <%if(position.equals("1")){ %>checked<%} %>>1학년</label>
          <label><input type="radio" name="position" value="2" <%if(position.equals("2")){ %>checked<%} %>>2학년</label>
          <label><input type="radio" name="position" value="3" <%if(position.equals("3")){ %>checked<%} %>>3학년</label>
          <label><input type="radio" name="position" value="4" <%if(position.equals("4")){ %>checked<%} %>>4학년</label>
        </td>
      </tr>
      <tr>
        <th>취미</th>
        <td>
          <label><input type="checkbox" name="hobby" value="프로그램" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("프로그램")){out.print("checked");} }%>>프로그램</label>
          <label><input type="checkbox" name="hobby" value="독서" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("독서")){out.print("checked");} }%>>독서</label>
          <label><input type="checkbox" name="hobby" value="등산" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("등산")){out.print("checked");} }%>>등산</label>
          <label><input type="checkbox" name="hobby" value="여행" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("여행")){out.print("checked");} }%>>여행</label>
          <label><input type="checkbox" name="hobby" value="낚시" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("낚시")){out.print("checked");} }%>>낚시</label>
          <label><input type="checkbox" name="hobby" value="영화보기" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("영화보기")){out.print("checked");} }%>>영화보기</label>
          <label><input type="checkbox" name="hobby" value="잠자기" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("잠자기")){out.print("checked");} }%>>잠자기</label>
          <label><input type="checkbox" name="hobby" value="멍때리기" <%for(int i=0;i<hby.length;i++){if(hby[i].equals("멍때리기")){out.print("checked");} }%>>멍때리기</label>
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address" value="<%=address%>"></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone" value="<%=phone%>"></td>
      </tr>
      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="등록" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      
    </table>
     <%   
 }
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
  </form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>