<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.id.value==""){
		alert("교과목 코드를 입력하세요");
		document.form.id.focus();
	}else if(document.form.subject_name.value==""){
		alert("과목명을 입력하세요");
		document.form.subject_name.focus();
	}else if(document.form.credit.value==""){
		alert("학점를 입력하세요");
		document.form.credit.focus();
	}else if(document.form.lecturer.value==""){
		alert("담당강사를 입력하세요");
		document.form.lecturer.focus();
	}else if(document.form.start_hour.value==""){
		alert("시작 시간을 입력하세요");
		document.form.start_hour.focus();
	}else if(document.form.end_hour.value==""){
		alert("종료 시간을 입력하세요");
		document.form.end_hour.focus();
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
  <h3>교과목 추가</h3>
  <form name="form" method="post" action="subinsertProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>교과목 코드</th>
        <td><input type="text" name="id"></td>
      </tr>
      <tr>
        <th>과목명</th>
        <td><input type="text" name="subject_name"></td>
      </tr>
       <tr>
        <th>학점</th>
        <td><input type="text" name="credit"></td>
      </tr>
       <tr>
        <th>담당강사</th>
        <td>
          <select name="lecturer">
            <option selected hidden="" disabled>담당교수선택</option>
            <option value="1">김교수</option>
            <option value="2">이교수</option>
            <option value="3">박교수</option>
            <option value="4">우교수</option>
            <option value="5">최교수</option>
            <option value="6">강교수</option>
            <option value="7">황교수</option>                     
          </select>
        </td>
      </tr>
      <tr>
        <th>수업요일</th>
        <td>
          <label><input type="radio" name="week" value="1">월요일</label>
          <label><input type="radio" name="week" value="2">화요일</label>
          <label><input type="radio" name="week" value="3">수요일</label>
          <label><input type="radio" name="week" value="4">목요일</label>
          <label><input type="radio" name="week" value="5">금요일</label>
          <label><input type="radio" name="week" value="6">토요일</label>
        </td>
      </tr>
      
      <tr>
        <th>시작</th>
        <td><input type="text" name="start_hour"></td>
      </tr>
      <tr>
        <th>종료</th>
        <td><input type="text" name="end_hour"></td>
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