<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh,TedirGhazali
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ include file="../connection.jsp" %>
<%
String id=request.getParameter("d");
int no=Integer.parseInt(id);
try {
    statement.executeUpdate("DELETE FROM jspdemo WHERE id = '"+no+"'");
    response.sendRedirect("../View/view.jsp");
} catch(Exception e){}
%>
