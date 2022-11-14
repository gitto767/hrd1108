<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.studno.value==""){
		alert("학번을 입력하세요");
		document.form.studno.focus();
	}else if(document.form.name.value==""){
		alert("성명을 입력하세요");
		document.form.name.focus();
	}else if(document.form.dept.value==""){
		alert("학과를 입력하세요");
		document.form.dept.focus();
	}else if(document.form.position.value==""){
		alert("학년을 입력하세요");
		document.form.position.focus();
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
  <h3>학사 정보 등록 화면</h3>
  <form name="form" method="post" action="studinsertProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>학번</th>
        <td><input type="text" name="studno"></td>
      </tr>
      <tr>
        <th>성명</th>
        <td><input type="text" name="name"></td>
      </tr>
       <tr>
        <th>학과</th>
        <td>
          <select name="dept">
            <option value="1">컴퓨터공학과</option>
            <option value="2">기계공학과</option>
            <option value="3">전자과</option>
            <option value="4">영문학과</option>
            <option value="5">일어과</option>
            <option value="6">경영학과</option>
            <option value="7">무역학과</option>
            <option value="8">교육학과</option>          
          </select>
        </td>
      </tr>
      <tr>
        <th>학년</th>
        <td>
          <label><input type="radio" name="position" value="1">1학년</label>
          <label><input type="radio" name="position" value="2">2학년</label>
          <label><input type="radio" name="position" value="3">3학년</label>
          <label><input type="radio" name="position" value="4">4학년</label>
        </td>
      </tr>
      <tr>
        <th>취미</th>
        <td>
          <label><input type="checkbox" name="hobby" value="프로그램">프로그램</label>
          <label><input type="checkbox" name="hobby" value="독서">독서</label>
          <label><input type="checkbox" name="hobby" value="등산">등산</label>
          <label><input type="checkbox" name="hobby" value="여행">여행</label>
          <label><input type="checkbox" name="hobby" value="낚시">낚시</label>
          <label><input type="checkbox" name="hobby" value="영화보기">영화보기</label>
          <label><input type="checkbox" name="hobby" value="잠자기">잠자기</label>
          <label><input type="checkbox" name="hobby" value="멍때리기">멍때리기</label>
        </td>
      </tr>
      <tr>
        <th>주소</th>
        <td><input type="text" name="address"></td>
      </tr>
      <tr>
        <th>연락처</th>
        <td><input type="text" name="phone"></td>
      </tr>
      <tr>
        <td colspan=2 class="last">
          <input class="buttons" type="button" value="등록" onclick="check()">
          <input class="buttons" type="reset" value="취소">
        </td>
      </tr>   
      
    </table>
  </form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>