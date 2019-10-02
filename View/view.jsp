<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh,TedirGhazali
--%>
<%--@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../header.jsp" %>
        <p><br/></p>
        <div class="row">
            <% String name=(String)session.getAttribute("sessname"); %>
            <div class="col-md-6"><h3>Welcome <% out.print(name);%></h3></div>
            <div class="col-md-6 text-right">
                <a href="../Logout/logout.jsp" class="btn btn-info">Logout</a>
            </div>
        </div>
        <p></p>
        <table class="table table-hover table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>age</th>
                </tr>
            </thead>
            <tbody>
                <%@ include file="../connection.jsp" %>
                <%
                

                String Data = "select * from jspdemo";
                rs = statement.executeQuery(Data);
                while (rs.next()) {
                %>
                <tr>
                    <td><%=rs.getString("id")%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("password")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("phoneno")%></td>
                    <td><%=rs.getString("age")%></td>
                    <td class="text-center" width="180">
                        <a href='../Edit/edit.jsp?u=<%=rs.getString("id")%>' class="btn btn-info">Edit</a>
                        <a href='../Delete/delete.jsp?d=<%=rs.getString("id")%>' class="btn btn-warning">Delete</a>
                    </td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
<%@ include file="../footer.jsp" %>    
</html>
