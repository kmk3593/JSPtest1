<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>  <!-- DAO인스턴스 -->
<%@ page import = "java.io.PrintWriter" %>  <!-- 출력 도와주는 객체 -->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />

<!-- jsp 에서 클래스의 setter함수를 호출한것과 마찬가지 -->
<!DOCTYPE html>

<html> 
<head>
<meta charset="UTF-8">
<title>회원가입액션</title>
</head>
<body>

<%
	//현재 로그인 되어있으면 회원가입 하면 로그인 되어있다고 알려주기 
	String userID = null;
	if(session.getAttribute("userID") != null){	// 세션의 userID가 비어있지 않으면 가져오기
		userID = (String)session.getAttribute("userID");
	}
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
	}



	if(user.getUserID()==null || user.getUserPassword()==null || user.getUserName()==null || user.getUserGender()==null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 부분이 있습니다.')");
		script.println("history.back()");	//뒤로가기
		script.println("</script>");

	}else{
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		//회원가입함수 실행 결과값에 따라서 화면으로 뿌려줄 스크립트 생성
		//백엔드에서 유효성검사

		if(result==1){	//회원가입 성공시
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='signup.jsp'");
			script.println("</script>");
		}
		else if(result==-2){	 //데이터베이스 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스에 문제가 발생했습니다.')");
			script.println("history.back()");	//뒤로가기
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('처리하지 못한 이상한 에러가 발생했습니다.')");
			script.println("history.back()");	//뒤로가기
			script.println("</script>");
		}
	}
	
%>

</body>
</html>