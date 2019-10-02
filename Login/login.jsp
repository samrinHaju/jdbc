<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login Page</title>
	
	<style type="text/css">
		
		#login-box{
			width: 60%;
			margin: 0 auto;
			margin-top: 200px;
			border: 1px solid black;
			border-radius: 5px;
			padding: 20px;
			height: 600px;
		}
		#login-box>input,button{
			display: block;
			width: 100%;
			margin: 0 auto;
			height: 20pt;
			margin-bottom: 10px;
			border-radius: 4px 4px 4px 4px;
		}
		#login-box>input[type="submit"],button{
			width: 40%;
			height:	40px;
			background-color: #18C1A8;
			color: #ffffff; 
			border-radius: 4px;
		}
		span{
			display: block;
			text-align: center;
			margin-bottom: 10px;
		}
		.suc{
			position: fixed;
			display: block;
			text-align: center;
			margin-bottom: 13%;
			margin-left: 37%;
		}
		#login-box>input[type="submit"]{
			float:left;
			
		}
		button{
			float: right;
			
		}
	</style>
	
</head>

<body>
	
	<!--<div class="error" id=div1> Incorrect username or password!</div>
	<div class="suc" id=div1> Success</div>-->
				
		
	
	<form method="post" action="">
		<!-- <img src="../css/bg3.jpg" style="width:98%">  -->
		<div id="login-box">
			 <img src="../css/bg3.jpg" style="width:98%"> 
			<span>Log In</span>
			<input type="text" name="username" id="username" placeholder="Username" required="required" />
			<input type="password" name="pass" id="pass" placeholder="Passsword" required="required" />
			<input type="submit" id="submit" value="Log In" />
			<button onClick="javascript:location.href='../index.html'">Back</button>
		</div>
		
	</form>
</body>
<%@ include file="../footer.jsp" %> 
<script>
		$(document).ready(function() { 
			setTimeout(function() { 
				$('#div1').fadeOut(); 
		 }, 2000); 
		});
</script>   
</html>

<%@ include file="../connection.jsp" %>
<%
try{
	String username=request.getParameter("username");
	String pass=request.getParameter("pass");
	String dbname=null;
	String dbpass=null;
	String Data = "select * from jspdemo where username=? and password=? ";
	ps=connection.prepareStatement(Data);
	ps.setString(1,username);
	ps.setString(2,pass);
	rs = ps.executeQuery();
	while (rs.next()) {
	dbname=rs.getString("username");
	dbpass=rs.getString("password");
	}

	if(dbname.equals(username)&&dbpass.equals(pass)){
	session.setAttribute("sessname",username); 
	out.println("<div class='suc' id=div1>Successfully logged in!!!Redirecting in a bit</div>");
	%>
		<script>
		  setTimeout(function() {
		      document.location = "../View/view.jsp";
		  }, 3000); // <-- this is the delay in milliseconds
		</script>
	<%
	}
}
    catch(NullPointerException e){
        e.printStackTrace();
    }
%>
