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
		alert("강사 ID를 입력하세요");
		document.form.idx.focus();
	}else if(document.form.name.value==""){
		alert("강사명을 입력하세요");
		document.form.name.focus();
	}else if(document.form.major.value==""){
		alert("전공를 입력하세요");
		document.form.major.focus();
	}else if(document.form.field.value==""){
		alert("세부전공을 입력하세요");
		document.form.field.focus();
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
  <h3>강사 추가</h3>
  <form name="form" method="post" action="teacherinsertProcess.jsp">
    <table class="inputtable">
      <tr>
        <th>강사 ID</th>
        <td><input type="text" name="idx"></td>
      </tr>
      <tr>
        <th>강사명</th>
        <td><input type="text" name="name"></td>
      </tr>
       <tr>
        <th>전 공</th>
        <td><input type="text" name="major"></td>
      </tr>
       <tr>
        <th>세부전공</th>
        <td><input type="text" name="field"></td>
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