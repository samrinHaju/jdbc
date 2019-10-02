<%--
    Document   : connection
    Created on : October 07, 2018, 23:05:00 PM
    Author     : Shadab Shaikh,TedirGhazali
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<%@ include file="../header.jsp" %>
        <p><br/></p>
        
        <%@ include file="../connection.jsp" %>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-6"><h3>Edit/Update Data</h3></div>
                    <div class="col-md-6 text-right">
                        <a href="../View/view.jsp" class="btn btn-info">Back to View</a>
                    </div>
                </div>
                <p></p>
                <form action="" method="post">
                    <%

                    String u=request.getParameter("u");
                    int num=Integer.parseInt(u);
                    String Data = "select * from jspdemo where id='"+num+"'";
                    rs = statement.executeQuery(Data);
                    while (rs.next()) {
                    %>   
                    <label for="uname">User Name</label>
                    <label for="passwd" id='pw'>Password</label>
                    <div class="form-inline">
                        <input type="text" class="form-control" id="uname" name="unm" placeholder="Username" style='width:45%' value='<%=rs.getString("username")%>'>
                    
                        
                        <input type="text" class="form-control" id="passwd" name="pw" style="width: 45%;margin-left: 10%;" placeholder="Your password" value='<%=rs.getString("password")%>'>
                    </div>


                    <input type="hidden" name="id" value='<%=rs.getString("id")%>'/>
                    <div class="form-group">
                        <label for="myname">Name</label>
                        <input type="text" class="form-control" id="myname" name="nm" value='<%=rs.getString("name")%>'>
                    </div>

                    <div class="form-group">
                        <label for="myemail">Email address</label>
                        <input type="email" class="form-control" id="myemail" name="em" value='<%=rs.getString("email")%>'>
                    </div>

                     <div class="form-group">
                        <label for="myaddress">Address</label>
                        <textarea class="form-control" id="myadrees" name="ad"><%=rs.getString("address")%></textarea>
                    </div>

                    <div class="form-group">
                        <label for="mynumber">Phone number</label>
                        <input type="tel" class="form-control" id="mynumber" name="pn" value='<%=rs.getString("phoneno")%>'>
                    </div>

                    <div class="form-group" >
                        <label for="age">Age</label>
                        <select name='ag' id='some_select' value='<%=rs.getString("age")%>'>
                            
                        </select>
                    </div>
                    <%   
                    }
                    %>
                    <button type="submit" class="btn btn-warning">Update</button>
                </form>
            </div>
        </div>
<%@ include file="../footer.jsp" %>    
</html>
<script type="text/javascript">
    
    var select = '';
    for (i=18;i<=100;i++){
        select += '<option val=' + i + '>' + i + '</option>';
    }
    $('#some_select').html(select);
</script>
<%
String id=request.getParameter("id");
String username=request.getParameter("unm");
String password=request.getParameter("pw");
String name=request.getParameter("nm");
String email=request.getParameter("em");
String address=request.getParameter("ad");
String phone=request.getParameter("pn");
String age=request.getParameter("ag");
int updateQuery = 0;
if(id!=null && username!=null && password!=null && name!=null && email!=null && address!=null && phone!=null && age!=null){
    try{
        String query="update jspdemo set username=?,password=?,name=?,email=?,phoneno=?,address=?,age=? where id='"+id+"'";
        ps=connection.prepareStatement(query);
        ps.setString(1,username);
        ps.setString(2,password);
        ps.setString(3,name);
        ps.setString(4,email);
        ps.setString(5,phone);
        ps.setString(6,address);
        ps.setString(7,age);
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            response.sendRedirect("../View/view.jsp");
        }
    }catch(Exception ex){
        out.println("Your Connection: "+ex);
    }finally{
        ps.close();
        connection.close();
    }
}
%>
